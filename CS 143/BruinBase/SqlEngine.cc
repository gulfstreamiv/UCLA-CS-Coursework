/**
 * Copyright (C) 2008 by The Regents of the University of California
 * Redistribution of this file is permitted under the terms of the GNU
 * Public License (GPL).
 *
 * @author Junghoo "John" Cho <cho AT cs.ucla.edu>
 * @date 3/24/2008
 */

#include <cstdio>
#include <iostream>
#include <fstream>
#include "Bruinbase.h"
#include "SqlEngine.h"
#include "BTreeIndex.h"

using namespace std;

// external functions and variables for load file and sql command parsing 
extern FILE* sqlin;
int sqlparse(void);


RC SqlEngine::run(FILE* commandline)
{
  fprintf(stdout, "Bruinbase> ");

  // set the command line input and start parsing user input
  sqlin = commandline;
  sqlparse();  // sqlparse() is defined in SqlParser.tab.c generated from
               // SqlParser.y by bison (bison is GNU equivalent of yacc)

  return 0;
}

RC SqlEngine::select(int attr, const string& table, const vector<SelCond>& cond)
{
	RecordFile rf;   // RecordFile containing the table
	RecordId   rid;  // record cursor for table scanning

	RC     rc;
	int    key;
	string value;
	int    count;
	int    diff;


	// B+ tree
	BTreeIndex bt;
	IndexCursor cursor;
	int search_by_index = 0;
	vector<SelCond> cond_bounds;
	SelCond init;
	init.attr = -1;
	cond_bounds.insert(cond_bounds.begin(), init);
	cond_bounds.insert(cond_bounds.begin() + 1, init);

	// conditions such as =, <> will be stored in this vector
	// at the end, cond_eq_ne contains <> conditions only
	vector<SelCond> cond_eq_ne;

	// store value conditions
	vector<SelCond> cond_value;

	if ((rc = bt.open(table + ".idx", 'r')) == 0) 
	{
		/* we have the special command: select count(*) from table
		 * We use our custom function to count the key.
		 */
		if (attr == 4 and cond.size() == 0) {
			int total;
			total = bt.getTotalCount();
			if (total < 0) total = 0;
			fprintf(stdout, "%d\n", total);
			bt.close();
			goto exit_select;
		}

		// search through conditions to see if we need to use
		// B+ tree
		for (int i = 0; i < cond.size(); ++i) 
		{
			if(cond[i].attr == 1) { // condition on key column
				search_by_index = 1;
				break;
			}
		}

		if (search_by_index) 
		{

			/* Now to make everything faster, we need to go through
			 * the <vector>cond to determine if all the conditions are valid.
			 * The lower and upper bounds will be copied to <vector>cond_bounds
			 */

			for (int i = 0; i < cond.size(); ++i)
			{
				if (cond[i].attr == 1 && (cond[i].comp == SelCond::EQ || cond[i].comp == SelCond::NE)) 
				{
					cond_eq_ne.push_back(cond[i]);
				} 
				else if (cond[i].attr == 2) 
				{
					cond_value.push_back(cond[i]);
				} 
				else 
				{
					// determine lower bound
					if (cond[i].comp == SelCond::GT || cond[i].comp == SelCond::GE) 
					{
						if ((cond_bounds[0].attr == -1) || (atoi(cond[i].value) >= atoi(cond_bounds[0].value))) 
						{
							cond_bounds[0] = cond[i];
						}
					}

					// upper bound
					if (cond[i].comp == SelCond::LT || cond[i].comp == SelCond::LE) 
					{
						if ((cond_bounds[1].attr == -1) || (atoi(cond[i].value) <= atoi(cond_bounds[0].value)))
						{
							cond_bounds[1] =  cond[i];
						}
					}

				}
			}
			
			// check to see if the bounds are valid
			if (cond_bounds[0].attr != -1 && cond_bounds[1].attr != -1) 
			{
				if (atoi(cond_bounds[0].value) > atoi(cond_bounds[1].value))
					goto exit_select;
				else if ((atoi(cond_bounds[0].value) == atoi(cond_bounds[1].value)) &&
						(cond_bounds[0].comp != SelCond::GE || cond_bounds[1].comp != SelCond::LE))
					goto exit_select;
			}
			
			// now iterate through each element in cond_eq_ne to detect invalid condition
			// In this step, we also narrow down the bounds
			int key_eq_condition = 0;
			for (int i = 0; i < cond_eq_ne.size(); ++i) {
				if (cond_eq_ne[i].comp == SelCond::EQ) {
					// = condition cannot have two different values
					// for example, the condition (key = 5 and key = 8) will return 0 row
					if (key_eq_condition != 0){
						if (atoi(cond_bounds[0].value) != atoi(cond_eq_ne[i].value))
							goto exit_select;
						else
							cond_eq_ne.erase(cond_eq_ne.begin() + i);
					} else {
						if (cond_bounds[0].attr != -1) { // lower bound exists
							if (cond_bounds[0].comp == SelCond::GT &&
									atoi(cond_eq_ne[i].value) <= atoi(cond_bounds[0].value))
								goto exit_select;
							else if (atoi(cond_eq_ne[i].value) < atoi(cond_bounds[0].value))
								goto exit_select;

						}
						
						if (cond_bounds[1].attr != -1) { // upper bound exists
							if (cond_bounds[1].comp == SelCond::LT &&
									atoi(cond_eq_ne[i].value) >= atoi(cond_bounds[1].value))
								goto exit_select;
							else if (atoi(cond_eq_ne[i].value) > atoi(cond_bounds[1].value))
								goto exit_select;
						}
						
						// combine bounds
						cond_bounds[0] = cond_bounds[1] = cond_eq_ne[i];
						
						// remove duplicate condition
						cond_eq_ne.erase(cond_eq_ne.begin() + i);

						++key_eq_condition;
					}

				} else { // NE
					if (cond_bounds[0].attr != -1) { // lower bound
						if (atoi(cond_eq_ne[i].value) < atoi(cond_bounds[0].value))
							cond_eq_ne.erase(cond_eq_ne.begin() + i);
					}

					if (cond_bounds[0].attr != -1) { // upper bound
						if (atoi(cond_eq_ne[i].value) > atoi(cond_bounds[1].value))
							cond_eq_ne.erase(cond_eq_ne.begin() + i);
					}

					// for example, key <= 5 and key >= 5 and key <> 5
					// then we get nothing
					if (atoi(cond_bounds[0].value) == atoi(cond_bounds[1].value) &&
							atoi(cond_bounds[0].value) == atoi(cond_eq_ne[i].value))
						goto exit_select;
				}

			}
			
			// Because the function locate() in BTreeIndex always returns keys >= search key,
			// we want to make sure we get the correct value if the lower bound is >
			if (cond_bounds[0].attr != -1 && cond_bounds[0].comp == SelCond::GT) {
				SelCond temp1;
				temp1.attr = 1;
				temp1.comp = SelCond::NE;
				temp1.value = cond_bounds[0].value;
				cond_eq_ne.push_back(temp1);
			}
			
			if (cond_bounds[1].attr != -1 && cond_bounds[1].comp == SelCond::LT) {
				SelCond temp2;
				temp2.attr = 1;
				temp2.comp = SelCond::NE;
				temp2.value = cond_bounds[1].value;
				cond_eq_ne.push_back(temp2);
			}
		
			// if there are no bounds, we won't use B+ tree
			if (cond_bounds[0].attr == -1 && cond_bounds[1].attr == -1)
				search_by_index = 0;	
		}
	}


  // ORIGINAL:
  // open the table file
  if ((rc = rf.open(table + ".tbl", 'r')) < 0) 
  {
    fprintf(stderr, "Error: table %s does not exist\n", table.c_str());
    return rc;
  }
  //END OF ORIGINAL

  if (search_by_index) 
  {
	  if (cond_bounds[0].attr == -1) 
	  {
		  if ((rc = bt.pointToSmallestKey(cursor)) < 0) return rc;
	  } 
	  else
		  if ((rc = bt.locate(atoi(cond_bounds[0].value), cursor)) < 0) return rc;
	  
	   while ((rc = bt.readForward(cursor, key, rid)) == 0)
	   {
		   // check upper bound
		   if (cond_bounds[1].attr != -1 && key > atoi(cond_bounds[1].value))
			   goto exit_select;
		   
		   // check with key condition
		   int flag=0;
		   for (int i = 0; i < cond_eq_ne.size(); ++i)
		   {
			   if (key == atoi(cond_eq_ne[i].value))
				   {
					flag=1;
					break;
					}
		   }
		   if(flag==1)
			   continue;
		   // read the value
		   // improvement: if want to receive the key value only, we won't read the
		   // record file.
		   if (attr != 1 || cond_value.size() != 0) {

			   if ((rc = rf.read(rid, key, value) < 0)) return rc;

			   // check with value condition
			   if (cond_value.size() != 0) {
				   for (int i = 0; i < cond_value.size(); ++i) {
					   diff = strcmp(value.c_str(), cond_value[i].value);

					   switch (cond_value[i].comp) {
					   case SelCond::EQ:
						   if (diff != 0) continue;
						   break;
					   case SelCond::NE:
						   if (diff == 0) continue;
						   break;
					   case SelCond::GT:
						   if (diff <= 0) continue;
						   break;
					   case SelCond::LT:
						   if (diff >= 0) continue;
						   break;
					   case SelCond::GE:
						   if (diff < 0) continue;
						   break;
					   case SelCond::LE:
						   if (diff > 0) continue;
						   break;
					   }

				   }
			   }
		   }

		   ++count;
		   
		   // pass all the tests, print out the result
			switch (attr) {
			case 1:  // SELECT key
			  fprintf(stdout, "%d\n", key);
			  break;
			case 2:  // SELECT value
			  fprintf(stdout, "%s\n", value.c_str());
			  break;
			case 3:  // SELECT *
			  fprintf(stdout, "%d '%s'\n", key, value.c_str());
			  break;
			}
	   }
	  
	  // print matching tuple count if "select count(*)"
	  if (attr == 4) {
		fprintf(stdout, "%d\n", count);
	  }
	  
	  bt.close();
	  goto exit_select;
  }

  
  //ORIGINAL:
  // scan the table file from the beginning
  rid.pid = rid.sid = 0;
  count = 0;

  while (rid < rf.endRid()) 
  {
	// read the tuple
	if ((rc = rf.read(rid, key, value)) < 0) {
	  fprintf(stderr, "Error: while reading a tuple from table %s\n", table.c_str());
	  goto exit_select;
	}

	// check the conditions on the tuple
	for (unsigned i = 0; i < cond.size(); i++) {
	  // compute the difference between the tuple value and the condition value
	  switch (cond[i].attr) {
	  case 1:
	diff = key - atoi(cond[i].value);
	break;
	  case 2:
	diff = strcmp(value.c_str(), cond[i].value);
	break;
	  }

	  // skip the tuple if any condition is not met
	  switch (cond[i].comp) 
	  {
	  case SelCond::EQ:
	if (diff != 0) goto next_tuple;
	break;
	  case SelCond::NE:
	if (diff == 0) goto next_tuple;
	break;
	  case SelCond::GT:
	if (diff <= 0) goto next_tuple;
	break;
	  case SelCond::LT:
	if (diff >= 0) goto next_tuple;
	break;
	  case SelCond::GE:
	if (diff < 0) goto next_tuple;
	break;
	  case SelCond::LE:
	if (diff > 0) goto next_tuple;
	break;
	  }
	}

	// the condition is met for the tuple.
	// increase matching tuple counter
	count++;

	// print the tuple
	switch (attr) {
	case 1:  // SELECT key
	  fprintf(stdout, "%d\n", key);
	  break;
	case 2:  // SELECT value
	  fprintf(stdout, "%s\n", value.c_str());
	  break;
	case 3:  // SELECT *
	  fprintf(stdout, "%d '%s'\n", key, value.c_str());
	  break;
	}

	// move to the next tuple
	next_tuple:
	++rid;
  }

  // print matching tuple count if "select count(*)"
  if (attr == 4) {
	fprintf(stdout, "%d\n", count);
  }
  rc = 0;


  // close the table file and return
  exit_select:
  rf.close();
  return rc;
} 

RC SqlEngine::load(const string& table, const string& loadfile, bool index)
{
	RC rc;
	ifstream ifs(loadfile.c_str());

	if(!ifs.is_open()) {
		fprintf(stderr, "Error %d: cannot open %s\n", RC_FILE_OPEN_FAILED, loadfile.c_str());
		return RC_FILE_OPEN_FAILED;
	}
	
	// open or create a record file
	RecordFile rf;
	if ((rc = rf.open(table + ".tbl", 'w')) < 0) {
		fprintf(stderr, "Error %d: cannot open %s\n", rc, loadfile.c_str());
		ifs.close();
		rf.close();
		return rc;
	}
	
	/* PART D */
	// B+ tree
	BTreeIndex bt;
	if (index) {
		if((rc = bt.open(table + ".idx", 'w')) < 0) {
			fprintf(stderr, "Error %d: cannot open B+ tree\n", rc);
			ifs.close();
			rf.close();
			bt.close();
			return rc;
		}
	}

	int key;
	string line;
	string value;
	RecordId rcId;
	while (getline (ifs, line)) {
		// read each line and store to record file
		if ( (rc = parseLoadLine(line, key, value)) < 0 ||
			 (rc = rf.append(key, value, rcId)) < 0 ) {
			fprintf(stderr, "Error %d: cannot read file or append tuple\n", rc);
			ifs.close();
			rf.close();
			return rc;
		}

		if (index) {

			if ((rc = bt.insert(key, rcId)) < 0) {
				fprintf(stderr, "Error %d: cannot insert tuple to B+ tree\n", rc);
				ifs.close();
				rf.close();
				bt.close();
				return rc;
			}
		}
	}
	
	rf.close();
	ifs.close();
	bt.close();

	
	// debug : print tree
	IndexCursor cursor;
	bt.open(table + ".idx", 'r');
	bt.pointToSmallestKey(cursor);

	RecordId rid;
	int total = 0;
	while (bt.readForward(cursor, key, rid) == 0){
		cout << "{ key: " << key;
		cout << ", pid: " << rid.pid << " | " << rid.sid << " } " << endl;
		++total;
	};

	cout << "total: " << total << endl;
	

	return 0;
}

RC SqlEngine::parseLoadLine(const string& line, int& key, string& value)
{
    const char *s;
    char        c;
    string::size_type loc;
    
    // ignore beginning white spaces
    c = *(s = line.c_str());
    while (c == ' ' || c == '\t') { c = *++s; }

    // get the integer key value
    key = atoi(s);

    // look for comma
    s = strchr(s, ',');
    if (s == NULL) { return RC_INVALID_FILE_FORMAT; }

    // ignore white spaces
    do { c = *++s; } while (c == ' ' || c == '\t');
    
    // if there is nothing left, set the value to empty string
    if (c == 0) { 
        value.erase();
        return 0;
    }

    // is the value field delimited by ' or "?
    if (c == '\'' || c == '"') {
        s++;
    } else {
        c = '\n';
    }

    // get the value string
    value.assign(s);
    loc = value.find(c, 0);
    if (loc != string::npos) { value.erase(loc); }

    return 0;
}
