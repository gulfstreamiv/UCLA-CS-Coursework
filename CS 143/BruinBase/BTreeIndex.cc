/*
 * Copyright (C) 2008 by The Regents of the University of California
 * Redistribution of this file is permitted under the terms of the GNU
 * Public License (GPL).
 *
 * @author Junghoo "John" Cho <cho AT cs.ucla.edu>
 * @date 3/24/2008
 */
 
#include "BTreeIndex.h"
#include "BTreeNode.h"
#include <iostream>
using namespace std;

BTreeIndex::BTreeIndex()
{
	treeHeight=0;
	rootPid=-1;
}
/*
 * Open the index file in read or write mode.
 * Under 'w' mode, the index file should be created if it does not exist.
 * @param indexname[IN] the name of the index file
 * @param mode[IN] 'r' for read, 'w' for write
 * @return error code. 0 if no error
 */
RC BTreeIndex::open(const string& indexname, char mode)
{
	RC rc;
	if ((rc = pf.open(indexname, mode)) < 0) return rc;

	// get rootPid and treeHeight
	if ((rc = pf.read(0, treeInfo_buffer)) < 0) 
	{
		if (pf.endPid() == 0) 
		{ //newly created
			treeHeight=0;
			rootPid=-1;
			memset(treeInfo_buffer, 0, sizeof(treeInfo_buffer));
			memcpy(treeInfo_buffer, &rootPid, sizeof(rootPid));
			memcpy(treeInfo_buffer + sizeof(rootPid), &treeHeight, sizeof(treeHeight));
			return 0;
		} 
		else
			return rc;
	}
	memcpy(&rootPid, treeInfo_buffer, sizeof(rootPid));
	memcpy(&treeHeight, treeInfo_buffer + sizeof(rootPid), sizeof(treeHeight));

	return 0;
}

/*
 * Close the index file.
 * @return error code. 0 if no error
 */
RC BTreeIndex::close()
{
    return pf.close();
}

/*
 * Insert (key, RecordId) pair to the index.
 * @param key[IN] the key for the value inserted into the index
 * @param rid[IN] the RecordId for the record being inserted into the index
 * @return error code. 0 if no error
 */
RC BTreeIndex::insert(int key, const RecordId& rid)
{
	RC rc;
	BTLeafNode leaf;
	
	// we have an empty tree
	if (rootPid == -1) 
	{
		if ((rc = leaf.insert(key, rid)) < 0) return rc;
		
		if ((rc = leaf.write(1, pf)) < 0) return rc;

		rootPid = 1;
		treeHeight = 1;

		// update tree info
		if ((rc = updateTreeInfo()) < 0) return rc;

	} 
	
	//not an empty tree
	else 
	{
		//if we only have one node ===> tree height = 1
		if (treeHeight == 1) 
		{ 	// the root is also the leaf node
			leaf.read(1, pf);
			//cout << " End PID is: " << pf.endPid() << endl;
			//if the only node is full, we insert and split, then create a new root
			if (leaf.getKeyCount() == leaf.MAX_KEY_PER_NODE)
			{ 
				// full node
				BTLeafNode sibling;
				int siblingKey;
				if ((rc = leaf.insertAndSplit(key, rid, sibling, siblingKey)) < 0) return rc;

				// update 2 nodes
				if ((rc = leaf.setNextNodePtr(2)) < 0) return rc;
				if ((rc = leaf.write(1, pf)) < 0)	return rc;
				if ((rc = sibling.write(2, pf)) < 0) return rc;

				// create a new root
				BTNonLeafNode root;
				if ((rc = root.initializeRoot(1, siblingKey, 2)) < 0) return rc;
				if ((rc = root.write(3, pf)) < 0) return rc;

				rootPid = 3;
				treeHeight = 2;
				// update treeInfo
				if ((rc = updateTreeInfo()) < 0) return rc;

			} 
			//else we do the normal insertion
			else 
			{
				if ((rc = leaf.insert(key, rid)) < 0) return rc;
				if ((rc = leaf.write(1, pf)) < 0) return rc;
			}

		}
		//if our tree is more than one level
		else 
		{ 
			insertHelper(-1, 1, rootPid, key, rid);
		}
	}
    return 0;
}


RC BTreeIndex::insertHelper(PageId parentNode, int currentLevel, PageId currentNode, const int &key, const RecordId &rid) 
{
	RC rc;
	
	//base case: leaf level insertion
	if (currentLevel == treeHeight)
	{ 
		//DEBUG
	//	cout << "We get here: Bottom level. Current level is: " << currentLevel << " which is equal to tree height." << endl;
		// current node is a leaf node
		BTLeafNode leaf_node;
		
		//read current node page content into leaf struct
		if ((rc = leaf_node.read(currentNode, pf)) < 0) return rc;
		
		//if leaf is full, insert and split and push up sibling key
		if (leaf_node.getKeyCount() == leaf_node.MAX_KEY_PER_NODE)
		{ 
			BTLeafNode sibling;
			int siblingKey;
			if ((rc = leaf_node.insertAndSplit(key, rid, sibling, siblingKey)) < 0) return rc;

			// update 2 nodes
			int nextPid = pf.endPid();
			if ((rc = leaf_node.setNextNodePtr(nextPid)) < 0) return rc;
			if ((rc = leaf_node.write(currentNode, pf)) < 0)	return rc;
			if ((rc = sibling.write(nextPid, pf)) < 0) return rc;
			//insert and split the leaf node, and return the key of the newly created sibling node
			return siblingKey; 
		} 
		
		//if leaf still has free space
		else 
		{
			//do normal insertion and return 0 if succeeded
			if ((rc = leaf_node.insert(key, rid)) < 0) return rc;
			if ((rc = leaf_node.write(currentNode, pf)) < 0) return rc;
			return 0;
		}
	} 
	
	//recursion level: current node is non-leaf
	else 
	{
		// read the content of the current node page content into intermediate_node struct
		BTNonLeafNode intermediate_node;
		if ((rc = intermediate_node.read(currentNode, pf)) < 0) return rc;
		
		// locate the child node page id which contains the key value
		PageId childNode;
		if ((rc = intermediate_node.locateChildPtr(key, childNode)) < 0) return rc;
		
		// follow this child node to the leaf
		//if child node is a leaf node and is not full, then we stop here
		//////*****RECURSION HERE******////////
		//DEBUG
		//cout << "We are entering next level, current level is: " << currentLevel << endl;
		if ((rc = insertHelper(currentNode, currentLevel+1, childNode, key, rid)) <= 0) return rc;

		// if we got here, rc now contains the siblingKey. We have to determine if the current non-leaf node is full
		// to push the key to the upper level
		int PushUpKey = rc;
		
		//if current node is full, we need to flush up the mid key accordingly
		if (intermediate_node.getKeyCount() == intermediate_node.MAX_KEY_PER_NODE)
		{ 
			//create a new sibling node 
			int newMidKey;
			BTNonLeafNode nf_sibling;
			//DEBUG
		//	cout << "end pid used on level : " << currentLevel << ", is: " << pf.endPid()-1 << endl;
		//	cout << "Current tree height is: " << treeHeight << endl;			
			if ((rc = intermediate_node.insertAndSplit(PushUpKey, pf.endPid()-1, nf_sibling, newMidKey)) < 0) return rc;

			// update intermediate_node
			if ((rc = intermediate_node.write(currentNode, pf)) < 0) return rc;

			// update new sibling
			int nf_sibling_pid = pf.endPid();
			if ((rc = nf_sibling.write(nf_sibling_pid, pf)) < 0) return rc;

			// is the current node root node? If so, then we create a new root 
			if (currentLevel == 1) 
			{
				// create a new root
				BTNonLeafNode newRoot;
				if ((rc = newRoot.initializeRoot(currentNode, newMidKey, nf_sibling_pid)) < 0) return rc;

				// write to disk
				PageId newRoot_pid = pf.endPid();
				if ((rc = newRoot.write(newRoot_pid, pf)) < 0) return rc;

				// update rootPid and treeHeight
				rootPid = newRoot_pid;
				++treeHeight;

				if ((rc = updateTreeInfo()) < 0) return rc;
				//insert success
				return 0;
			}
			//if we are at non-root level, push up the mid key
			else 
			{
				//DEBUG
			//	cout << "end pid returning from level : " << currentLevel << ", is: " << pf.endPid()-1 << endl; 
			//	cout << "Current tree height is: " << treeHeight << endl;
				return newMidKey;
			}
		} 
		//if the current node is not full
		else 
		{
			if(currentLevel==treeHeight-1)
			{
				BTLeafNode child_leaf;
				if ((rc = child_leaf.read(childNode, pf)) < 0) return rc;
				if ((rc = intermediate_node.insert(PushUpKey, child_leaf.getNextNodePtr())) < 0) return rc;
			}
			else
				if ((rc = intermediate_node.insert(PushUpKey, pf.endPid()-1)) < 0) return rc;		
				
/*			else if(currentLevel>1&&currentLevel<treeHeight)
			{
				BTNonLeafNode non_leaf_node;
				if ((rc = intermediate_node.insert(PushUpKey, pf.endPid()-1)) < 0) return rc;
			}
*/
			//update intermediate_node
			if ((rc = intermediate_node.write(currentNode, pf)) < 0) return rc;

			return 0;
		}
	}

	return 0;
}

/*
 * Find the leaf-node index entry whose key value is larger than or 
 * equal to searchKey, and output the location of the entry in IndexCursor.
 * IndexCursor is a "pointer" to a B+tree leaf-node entry consisting of
 * the PageId of the node and the SlotID of the index entry.
 * Note that, for range queries, we need to scan the B+tree leaf nodes.
 * For example, if the query is "key > 1000", we should scan the leaf
 * nodes starting with the key value 1000. For this reason,
 * it is better to return the location of the leaf node entry 
 * for a given searchKey, instead of returning the RecordId
 * associated with the searchKey directly.
 * Once the location of the index entry is identified and returned 
 * from this function, you should call readForward() to retrieve the
 * actual (key, rid) pair from the index.
 * @param key[IN] the key to find.
 * @param cursor[OUT] the cursor pointing to the first index entry
 *                    with the key value.
 * @return error code. 0 if no error.
 */
RC BTreeIndex::locate(int searchKey, IndexCursor& cursor)
{
	if (treeHeight == 0) {
		return RC_NO_SUCH_RECORD;
	}
	RC rc;
	int pid = rootPid; // read the root first
	if (treeHeight != 1) {
		BTNonLeafNode nl_node;
		for (int current_level = 1; current_level < treeHeight; ++current_level) {
			if ((rc = nl_node.read(pid, pf)) < 0) return rc;
			if ((rc = nl_node.locateChildPtr(searchKey, pid)) < 0) return rc;
		}
	}

	// read the leaf
	BTLeafNode l_node;
	if ((rc = l_node.read(pid, pf)) < 0) return rc;
	if ((rc = l_node.locate(searchKey, cursor.eid)) < 0) return rc;
	cursor.pid = pid;

	return 0;
}

/*
 * Read the (key, rid) pair at the location specified by the index cursor,
 * and move foward the cursor to the next entry.
 * @param cursor[IN/OUT] the cursor pointing to an leaf-node index entry in the b+tree
 * @param key[OUT] the key stored at the index cursor location.
 * @param rid[OUT] the RecordId stored at the index cursor location.
 * @return error code. 0 if no error
 */
RC BTreeIndex::readForward(IndexCursor& cursor, int& key, RecordId& rid)
{
	RC rc;
	BTLeafNode l_node;

	if ((rc = l_node.read(cursor.pid, pf)) < 0) return rc;

	if (cursor.eid == l_node.getKeyCount()) { // move to the next sibling
			int next_pid = l_node.getNextNodePtr();
			if (next_pid == 0) { // no more sibling
				return RC_END_OF_TREE;
			} else {
				cursor.pid = next_pid;
				cursor.eid = 0;
				if ((rc = l_node.read(cursor.pid, pf)) < 0) return rc;
			}
	}


	l_node.readEntry(cursor.eid, key, rid);
	cursor.eid++;

	return 0;
}

/**
* Write rootPid & treeHeight to pagePid = 0
*/
RC BTreeIndex::updateTreeInfo() {
	// update rootPid and treeHeight
	memcpy(treeInfo_buffer, &rootPid, sizeof(rootPid));
	memcpy(treeInfo_buffer + sizeof(rootPid), &treeHeight, sizeof(treeHeight));
	return pf.write(0, treeInfo_buffer);
}

RC BTreeIndex::pointToSmallestKey(IndexCursor& cursor) {
	if (treeHeight == 0) {
		return RC_NO_SUCH_RECORD;
	}
	RC rc;
	int pid = rootPid; // read the root first
	if (treeHeight != 1) {
		BTNonLeafNode nl_node;
		for (int current_level = 1; current_level < treeHeight; ++current_level) {
			if ((rc = nl_node.read(pid, pf)) < 0) return rc;
			if ((rc = nl_node.getLeftSiblingPid(pid)) < 0) return rc;
		}
	}

	cursor.eid = 0;
	cursor.pid = pid;

	return 0;
}

int BTreeIndex::getTotalCount() {
	RC rc;
	IndexCursor cursor;
	int total = 0;

	if ((rc = pointToSmallestKey(cursor)) < 0) return rc;

	PageId pid = cursor.pid;
	BTLeafNode leaf;

	do {
		if ((rc = leaf.read(pid, pf)) < 0) return rc;
		total += leaf.getKeyCount();
	} while ((pid = leaf.getNextNodePtr()) != 0);

	return total;
}
