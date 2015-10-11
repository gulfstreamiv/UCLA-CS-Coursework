#include "BTreeNode.h"
#include "Bruinbase.h"
#include <stdio.h>
#include <string.h>
using namespace std;


/**
 * Move pointer to the beginning of the buffer;
 */

void BTLeafNode::resetBufferPtr() {
	bufferPointer = (l_struct*) (buffer + sizeof(int));
}

BTLeafNode::BTLeafNode() {
	memset(buffer, 0, sizeof(buffer));
	setNextNodePtr(0);
	resetBufferPtr();
}

/*
 * Read the content of the node from the page pid in the PageFile pf.
 * @param pid[IN] the PageId to read
 * @param pf[IN] PageFile to read from
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTLeafNode::read(PageId pid, const PageFile& pf)
{ 
	return pf.read(pid, buffer);
}
    
/*
 * Write the content of the node to the page pid in the PageFile pf.
 * @param pid[IN] the PageId to write to
 * @param pf[IN] PageFile to write to
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTLeafNode::write(PageId pid, PageFile& pf)
{
	return pf.write(pid, buffer);
}

/*
 * Update total keys
 */
void BTLeafNode::updateKeyCount(int count) {
	memcpy(buffer, &count, sizeof(int));
}
		
/*
 * Return the number of keys stored in the node.
 * @return the number of keys in the node
 */
int BTLeafNode::getKeyCount()
{ 
	int i;
	memcpy(&i, buffer, sizeof(int));
	return i;
}

/*
 * Insert a (key, rid) pair to the node.
 * @param key[IN] the key to insert
 * @param rid[IN] the RecordId to insert
 * @return 0 if successful. Return an error code if the node is full.
 */
RC BTLeafNode::insert(int key, const RecordId& rid)
{
	int current_num_keys = getKeyCount();

	if(current_num_keys == MAX_KEY_PER_NODE) {
		return RC_NODE_FULL;
	}

	resetBufferPtr();
	int index = 0;

	while ((index < current_num_keys) && key > bufferPointer->key) {
		++index;
		++bufferPointer;
	}

	if (index != current_num_keys) 
		shiftRight(index);

	bufferPointer->rid = rid;
	bufferPointer->key = key;

	updateKeyCount(current_num_keys + 1);

	return 0;
}

/*
 * Insert the (key, rid) pair to the node
 * and split the node half and half with sibling.
 * The first key of the sibling node is returned in siblingKey.
 * @param key[IN] the key to insert.
 * @param rid[IN] the RecordId to insert.
 * @param sibling[IN] the sibling node to split with. This node MUST be EMPTY when this function is called.
 * @param siblingKey[OUT] the first key in the sibling node after split.
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTLeafNode::insertAndSplit(int key, const RecordId& rid, 
                              BTLeafNode& sibling, int& siblingKey)
{ 
	RC rc;

	if (sibling.getKeyCount() != 0)
		return RC_INVALID_NODE;


	int current_num_keys = getKeyCount();

	// reset pointer
	resetBufferPtr();

	// find place to insert new key
	int loc_to_insert = 0;
	while (loc_to_insert != current_num_keys && key > bufferPointer->key) {
		++loc_to_insert;
		++bufferPointer;
	}


	// middle of the node
	resetBufferPtr();
	int midLocation = current_num_keys / 2;
	bufferPointer += midLocation;
	int insert_to_sibling = 0;

	if (loc_to_insert > midLocation) {
		++midLocation;
		++bufferPointer;
		insert_to_sibling = 1;
	}


	// copy right half to sibling
	for (int i = midLocation; i < current_num_keys; ++i, ++bufferPointer) {
		if ((rc = sibling.insert(bufferPointer->key, bufferPointer->rid)) < 0) return rc;
	}

	// copy the next pointer if there exists one in the current Node
	if (getNextNodePtr() != 0) {
		sibling.setNextNodePtr(getNextNodePtr());
	}

	if (!insert_to_sibling) {
		updateKeyCount(current_num_keys - 1); // make it non-full
		if ((rc = insert(key, rid)) < 0) return rc;
	} 
	else {
		if ((rc = sibling.insert(key, rid)) < 0) return rc;
	}

	sibling.resetBufferPtr();
	int sib_key;
	RecordId sib_rid;
	if ((rc = sibling.readEntry(0, sib_key, sib_rid)) < 0) return rc;

	siblingKey = sib_key;

	// update number of keys
	updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());

	return 0;
}

/*
 * Find the entry whose key value is larger than or equal to searchKey
 * and output the eid (entry number) whose key value >= searchKey.
 * Remeber that all keys inside a B+tree node should be kept sorted.
 * @param searchKey[IN] the key to search for
 * @param eid[OUT] the entry number that contains a key larger than or equalty to searchKey
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTLeafNode::locate(int searchKey, int& eid)
{
	resetBufferPtr();
	int current_num_keys = getKeyCount();
	int j;
	for (j = 0; j < current_num_keys; ++j, ++bufferPointer) {
		if (bufferPointer->key >= searchKey) {
			eid = j;
			break;
		}
	}

	if (j >= current_num_keys) {
		return RC_NO_SUCH_RECORD;
	}

	return 0;
}

/*
 * Read the (key, rid) pair from the eid entry.
 * @param eid[IN] the entry number to read the (key, rid) pair from
 * @param key[OUT] the key from the entry
 * @param rid[OUT] the RecordId from the entry
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTLeafNode::readEntry(int eid, int& key, RecordId& rid)
{ 
	int current_num_keys = getKeyCount();

	if (eid < 0 || eid >= current_num_keys)
		return RC_NO_SUCH_RECORD;

	resetBufferPtr();
	bufferPointer += eid;

	key = bufferPointer->key;
	rid = bufferPointer->rid;

	return 0;
}


/*
 * Return the pid of the next slibling node.
 * @return the PageId of the next sibling node 
 */
PageId BTLeafNode::getNextNodePtr()
{ 
	int next_pageid;
	memcpy(&next_pageid, buffer + (PageFile::PAGE_SIZE - 2*sizeof(int)), sizeof(int));

	return next_pageid;
}

/*
 * Set the pid of the next slibling node.
 * @param pid[IN] the PageId of the next sibling node 
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTLeafNode::setNextNodePtr(PageId pid)
{ 
	memcpy(buffer + (PageFile::PAGE_SIZE - 2*sizeof(int)), &pid, sizeof(int));

	return 0;
}

void BTLeafNode::shiftRight(int index){
	memmove(bufferPointer + 1, bufferPointer, (getKeyCount() - index) * SLOT_SIZE);
}


/////////// NON LEAF /////////////
/**
 * Move pointer to the beginning of the buffer;
 */

void BTNonLeafNode::resetBufferPtr() {
	bufferPointer = (nl_struct*) (buffer + sizeof(int) * 2);
}

BTNonLeafNode::BTNonLeafNode() {
	memset(buffer, 0, sizeof(buffer));
	resetBufferPtr();
}

void BTNonLeafNode::updateKeyCount(int count) {
	memcpy(buffer, &count, sizeof(int));
}

void BTNonLeafNode::shiftRight(int index){
	memmove(bufferPointer + 1, bufferPointer, (getKeyCount() - index) * SLOT_SIZE);
}

/*
 * Read the content of the node from the page pid in the PageFile pf.
 * @param pid[IN] the PageId to read
 * @param pf[IN] PageFile to read from
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTNonLeafNode::read(PageId pid, const PageFile& pf)
{
	RC rc;
	if ((rc = pf.read(pid, buffer)) < 0) return rc;
	resetBufferPtr();
	return 0;
}
    
/*
 * Write the content of the node to the page pid in the PageFile pf.
 * @param pid[IN] the PageId to write to
 * @param pf[IN] PageFile to write to
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTNonLeafNode::write(PageId pid, PageFile& pf)
{
	return pf.write(pid, buffer);
}

/*
 * Return the number of keys stored in the node.
 * @return the number of keys in the node
 */
int BTNonLeafNode::getKeyCount()
{
	// read first four bytes;
	int i;
	memcpy(&i, buffer, sizeof(int));
	return i;
}


/*
 * Insert a (key, pid) pair to the node.
 * @param key[IN] the key to insert
 * @param pid[IN] the PageId to insert
 * @return 0 if successful. Return an error code if the node is full.
 */
RC BTNonLeafNode::insert(int key, PageId pid)
{
	int current_num_keys = getKeyCount();

	if(current_num_keys == MAX_KEY_PER_NODE) {
		return RC_NODE_FULL;
	}

	resetBufferPtr();
	int counter = 0;

	while ((counter < current_num_keys) && key > bufferPointer->key) {
		++counter;
		++bufferPointer;
	}

	if (counter != current_num_keys) 
		shiftRight(counter);

	bufferPointer->key = key;
	bufferPointer->pid = pid;

	updateKeyCount(current_num_keys + 1);

	return 0;
}

/*
 * Insert the (key, pid) pair to the node
 * and split the node half and half with sibling.
 * The middle key after the split is returned in midKey.
 * @param key[IN] the key to insert
 * @param pid[IN] the PageId to insert
 * @param sibling[IN] the sibling node to split with. This node MUST be empty when this function is called.
 * @param midKey[OUT] the key in the middle after the split. This key should be inserted to the parent node.
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTNonLeafNode::insertAndSplit(int key, PageId pid, BTNonLeafNode& sibling, int& midKey)
{
	RC rc;
	
	if (sibling.getKeyCount() != 0)
		return RC_INVALID_NODE;

	int current_num_keys = getKeyCount();

	// reset pointer
	resetBufferPtr();

	// place where new key should be inserted
	int loc_to_insert = 0;
	while (loc_to_insert != current_num_keys && key > bufferPointer->key) {
		++loc_to_insert;
		++bufferPointer;
	}


	// middle of node
	resetBufferPtr();
	int midLocation = current_num_keys / 2;
	bufferPointer += midLocation;
	int insert_to_sibling = -1;


	if (midLocation == loc_to_insert)   //CHANGED HERE
	{
		if(current_num_keys % 2 == 0)
		{
			midKey = key;
			if((rc = sibling.insert(key,pid)) < 0) return rc; 
		}
		else
		{
			midKey = bufferPointer->key;
			insert_to_sibling = 2;
		}		
	} 
	else if (loc_to_insert < midLocation) 
	{
		if (current_num_keys % 2 == 0)
		{
			midKey = (bufferPointer - 1)->key;
			if( (rc = (sibling.insert((bufferPointer - 1)->key,(bufferPointer - 1)->pid)) < 0) ) return rc;  //CHANGE HERE
			insert_to_sibling = 0; // insert new key to the current node
		} 
		else 
		{
			midKey = bufferPointer->key;
			if((rc = sibling.insert((bufferPointer)->key,(bufferPointer)->pid)) < 0) return rc;
			++bufferPointer;
			midLocation++;
			insert_to_sibling = 0;
		} 
	} 
	else 
	{
		if (current_num_keys % 2 == 0)
		{
			midKey = bufferPointer->key;
			if((rc = sibling.insert((bufferPointer)->key,(bufferPointer)->pid)) < 0) return rc;
			++bufferPointer;
			midLocation++;
			insert_to_sibling = 1;
		}
		else if (loc_to_insert > midLocation + 1)
		{
			midKey = (bufferPointer+1)->key;
			insert_to_sibling = 3;
			++bufferPointer;
			midLocation++;
		}
		else
		{
			midKey = key;
			insert_to_sibling = 4;
			++bufferPointer;
			midLocation++;
		}
	}

	/*// copy right half to sibling
	int i;
	if(insert_to_sibling == 1 || ( (loc_to_insert < midLocation) && (current_num_keys % 2 != 0) ) 
	|| insert_to_sibling == 3 || insert_to_sibling == 4)
		i=midLocation+1;
	else
		i=midLocation;
	*/	
	for (int i=midLocation; i < current_num_keys; ++i, ++bufferPointer) 
	{
		sibling.insert(bufferPointer->key, bufferPointer->pid);
	}

	// insert new key or not?
	if (insert_to_sibling != -1)
	{
		if (insert_to_sibling == 0) 
		{
			updateKeyCount(current_num_keys - 1); // make it non full
			if ((rc = insert(key, pid)) < 0) return rc;
			updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
		} 
		else if (insert_to_sibling == 1)
		{
			if ((rc = sibling.insert(key, pid)) < 0) return rc;
			updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
		}
		else if (insert_to_sibling == 2)
		{
			updateKeyCount(current_num_keys - 1);
			if ((rc = insert(key, pid)) < 0) return rc;
			updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
		}
		else if (insert_to_sibling == 3)
		{
			if ((rc = sibling.insert(key, pid)) < 0) return rc;
			updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
		}
		else
		{
			if ((rc = sibling.insert(key, pid)) < 0) return rc;
			updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
		}
		//updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
	}
	else 
	{
		updateKeyCount(current_num_keys + 1 - sibling.getKeyCount());
	}

	return 0;
}

/*
 * Given the searchKey, find the child-node pointer to follow and
 * output it in pid.
 * @param searchKey[IN] the searchKey that is being looked up.
 * @param pid[OUT] the pointer to the child node to follow.
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTNonLeafNode::locateChildPtr(int searchKey, PageId& pid)
{
	resetBufferPtr();
	int current_num_keys = getKeyCount();
	int counter = 1;

	while (searchKey > bufferPointer->key && (counter < current_num_keys)) {
		++counter;
		++bufferPointer;
	}
	if(searchKey >= bufferPointer->key)
		pid = bufferPointer->pid;  // >=  goes to the right
	else 
		pid = (--bufferPointer)->pid; // <  goes to the left

	return 0;
}

/*
 * Initialize the root node with (pid1, key, pid2).
 * @param pid1[IN] the first PageId to insert
 * @param key[IN] the key that should be inserted between the two PageIds
 * @param pid2[IN] the PageId to insert behind the key
 * @return 0 if successful. Return an error code if there is an error.
 */
RC BTNonLeafNode::initializeRoot(PageId pid1, int key, PageId pid2)
{
	resetBufferPtr();

	bufferPointer->key = key;
	bufferPointer->pid = pid2;
	(--bufferPointer)->pid = pid1;

	updateKeyCount(1);

	return 0;
}

/**
 * Simple return the left sibling's pid of the current node
 */
 RC BTNonLeafNode::getLeftSiblingPid(int &pid) {
	 resetBufferPtr();
	 pid = (--bufferPointer)->pid;
	 return 0;
 }
