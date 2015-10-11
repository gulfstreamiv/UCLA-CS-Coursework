// UCLA CS 111 Lab 1 command reading

#include "command.h"
#include "command-internals.h"
#include "alloc.h"

#include <error.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>


/* FIXME: You may need to add #include directives, macro definitions,
   static function definitions, etc.  */

/* FIXME: Define the type 'struct command_stream' here.  This should
   complete the incomplete type declaration in command.h.  */

int ifSimpleChar(char check);

command_t createSimpleCmd(char *givenString);
command_t createSpecialCmd(enum command_type input);

void join_commands(command_t token, command_t cmd1, command_t cmd2);
void subshell_commands(command_t token, command_t sub);
void processDirectionToken(command_t token, command_t input, command_t output);

command_t getSimpleCmd(char* cmdBuffer, int* index);

int ifSpecialToken(char check);

command_t generateTree(command_t* cmdsContainer, int numCommands, int* initialPos, int curLevel);

command_t getSimpleCmd(char* cmdBuffer, int* index)
{
	
	/* code to retrieve simple command 
	should pass its char buffer into createSimpleCmd to create the actual struct
	*/

	/*temporary initial size of buffer, will resize if needed */
	size_t buffer_size = (size_t) (sizeof(char) * 32);

	/*char buffer for array */
	char* buffer;
	
	buffer = (char*) checked_malloc(buffer_size); 

	int position = 0;
	
	/*will be the char of the head of the stream we are looking at to retrieve the simple command */ 
	char head = cmdBuffer[*index];

	while (head != EOF && head != '\n' && head != ';')
	{	
			/* we have a valid simple word character that we need to attach to the buffer */
			if (ifSimpleChar(head) == 1 || head == ' ')
			{
				if (((position+1) * sizeof(char)) == buffer_size)
					{
						buffer = (char*) checked_grow_alloc(buffer, &buffer_size);
					}
					
			
						buffer[position] = head;
						
						position++;
						*index = *index + 1;
						head = cmdBuffer[*index];
						
			}
			else
			{
			buffer[position] = '\0';
				/*free the buffer since we are done using it */
				*index = *index - 1;
				/*we are done retrieving all the simple command characters so we can create the simple command */			
				return createSimpleCmd(buffer);
				
			}
	}	
	
	
	buffer[position] = '\0';

	*index = *index - 1;
	
	command_t c = createSimpleCmd(buffer);

	return c;
}

/*code to create a simple command struct */
command_t createSimpleCmd(char *givenString)
{

	/*malloc a new command struct */
	command_t smplcmd = (command_t)checked_malloc(sizeof(struct command));

	int numWord = 0;
	
	/*set its appropriate variables */
	smplcmd->type = SIMPLE_COMMAND;

	smplcmd->status = 0;

	smplcmd->input = NULL;

	smplcmd->output = NULL;
	
	smplcmd->nonRoot = false;

	/* temporary size of words array, 8 bytes*/
	size_t wordArraySize = (size_t) (8 * sizeof(char*));

	smplcmd->u.word = (char **)checked_malloc(wordArraySize);

	/*split string into words by using strtok */
	char *fetchSingleWord = strtok(givenString, " ");
	
	while(fetchSingleWord != NULL)
	{
	
		if ((numWord * sizeof(char*)) == wordArraySize)
	   {
		smplcmd->u.word = (char **)checked_grow_alloc(smplcmd->u.word, &wordArraySize);
		}
		
		/*set the word variable in the union of the command struct to be the simple command word */

		smplcmd->u.word[numWord] = (char *)checked_malloc(strlen(fetchSingleWord) + 1);
	
		strcpy(smplcmd->u.word[numWord], fetchSingleWord);

		numWord++;

		/*get the next word in the splitted string */
		fetchSingleWord = strtok(NULL, " ");

	}
	
	smplcmd->u.word[numWord] = '\0';
	
	return smplcmd;

}

command_t
createSpecialCmd(enum command_type src)
{
	command_t cmd = (command_t)checked_malloc(sizeof(struct command));
	
	cmd->type = src;
	cmd->status = 2;
	cmd->input = NULL;
	cmd->output = NULL;
	cmd->layer = 0;

	return cmd;
}

void
join_commands(command_t token, command_t cmd1, command_t cmd2)
{
	token->u.command[0] = cmd1;
	token->u.command[1] = cmd2;
	cmd1->nonRoot = 1;
	cmd2->nonRoot = 1;
}

void
subshell_commands(command_t token, command_t sub)
{
	token->u.subshell_command = sub;
}

void processDirectionToken(command_t token, command_t src1, command_t src2)
{	
	size_t input_size= 32 * sizeof(char);
	int index = 0;
	src1->input = (char *) checked_malloc(32 * sizeof(char));
	src1->input[0] = '\0';
	
	size_t output_size= 32 * sizeof(char);
	src2->output = (char *) checked_malloc(32 * sizeof(char));
	src2->output[0] = '\0';
	
	//char* nothing = (char*) checked_malloc(sizeof(char*));
	//nothing[0] = '\0';
	
	if (token->type == LARGER_SIGN)
	{
			if (src1->u.word[index] != NULL)
			{
			if (sizeof(src1->u.word[index]) >= output_size)
				{src2->output = (char*) checked_grow_alloc(src2->output, &output_size);}
			strcat(src2->output, src1->u.word[index]);
			index++;
			}

	}
	
	index = 0;
	
	if (token-> type == SMALLER_SIGN)
	{
			if (src2->u.word[index] != NULL)
			{

			if (sizeof(src2->u.word[index]) >= input_size)
				{src1->input = (char*) checked_grow_alloc(src1->input, &input_size);}
			
			strcat(src1->input, src2->u.word[index]);
			index++;
			
			}
	}
	
	if (token->type == LARGER_SIGN)
	{
		token->nonRoot = 1;
		src1->nonRoot = 1;
	}
	
	if (token->type == SMALLER_SIGN)
	{
		token->nonRoot = 1;
		src2->nonRoot = 1;
	}
		
}

int ifSimpleChar(char check)
{
	if ( isalpha(check) || isdigit(check) || check == '!' || check == '%' || check == '+' || check == ',' || check == '-' || check == '.' || check == '/' || check == ':' || check == '@' || check ==  '^' || check == '_')
	{return 1;}
else {return 0;}
				
}

int ifSpecialToken(char check)
{
	if (check == ';' || check == '|' || check == '&' ||
     check == '(' || check == ')' || check == '<' || check == '>')
	return 1;
	else return 0; 
}

command_t
generateTree(command_t* cmdsContainer, int size, int* initialPos, int curLevel)
{

	int curPosition = *initialPos;
	int restorePoint = *initialPos;
	int moveBackwards;
	int moveForwards;
	int numCommands = size;
	
	/*temporary command for subshell*/
	command_t cmd = (command_t)checked_malloc(sizeof(struct command));
	
	/*temporary command for subshell used to set parent*/
	command_t cmd2 = (command_t)checked_malloc(sizeof(struct command));
	
	/* check if first command is simple */
	if(cmdsContainer[0]->type != SIMPLE_COMMAND && cmdsContainer[0]->type != LEFT_PAREN)
	{ error(1,0, "First ccommand must be simple command or subshell command");	}

	while(curPosition < numCommands)
	{
			if (cmdsContainer[curPosition]->type == LEFT_PAREN)
			{
				/* create a subshell command */
				/* set the value of generateTree to it */
	
				cmd->type = SUBSHELL_COMMAND;
				cmd->status = 2;
				cmd->input = NULL;
				cmd->output = NULL;
			
				*initialPos = curPosition + 1;
			
				cmd2 = generateTree(cmdsContainer, numCommands, initialPos, curLevel+1);
				cmd2->nonRoot =1;
		
				cmd->u.subshell_command = cmd2;
			
			
				/*set the left paren slot in the array to the new subshell command we have created */
				cmdsContainer[curPosition] = cmd;
			
			}
			curPosition++;
	}
		
	curPosition = restorePoint;
	
	while(curPosition < numCommands)
	{
			/* return the tree that we have finished up one level from the subshell command */
			if (cmdsContainer[curPosition]->type == RIGHT_PAREN && curLevel > 0 && cmdsContainer[curPosition]->layer ==0)
			{
				numCommands = curPosition;
				
				cmdsContainer[curPosition]->layer = 1;
				cmdsContainer[curPosition]->nonRoot = 1;	
			}
			curPosition++;
	}
	
	curPosition = restorePoint;
	
	while(curPosition < numCommands)
	{
			if((cmdsContainer[curPosition]->type != SMALLER_SIGN && 
				cmdsContainer[curPosition]->type != LARGER_SIGN))
			{ curPosition++; }
			else
			{
				if (cmdsContainer[curPosition]->nonRoot ==0)
				{
					moveBackwards = curPosition-1;
					moveForwards = curPosition+1;
			
					while(cmdsContainer[moveBackwards]->nonRoot == 1)
					{
						moveBackwards--; 
					}
					while(cmdsContainer[moveForwards]->nonRoot == 1)
					{
						moveForwards++; 
					}			
			
					/*code to set the redirection of simple commands for input*/
					if (cmdsContainer[curPosition]->type == SMALLER_SIGN)
					{
						processDirectionToken(cmdsContainer[curPosition], cmdsContainer[moveBackwards], cmdsContainer[moveForwards]); 
					}
			
					/*code to set the redirection of simple commands for output*/
					if (cmdsContainer[curPosition]->type == LARGER_SIGN)
					{
						processDirectionToken(cmdsContainer[curPosition], cmdsContainer[moveForwards], cmdsContainer[moveBackwards]); 
					}
				
				}
				else
				{
					curPosition++;
				}
			}
	}
	
	curPosition = restorePoint;
	
	while(curPosition < numCommands)
	{
			if(cmdsContainer[curPosition]->type != PIPE_COMMAND)
			{ curPosition++; }
			else
			{	
				if (cmdsContainer[curPosition]->nonRoot ==0)
				{
					cmdsContainer[curPosition]->layer--;
					moveBackwards = curPosition-1;
					moveForwards = curPosition+1;
					while(cmdsContainer[moveBackwards]->nonRoot == 1)
					{ moveBackwards--; }
					while(cmdsContainer[moveForwards]->nonRoot == 1)
					{ moveForwards++; }
					join_commands(cmdsContainer[curPosition], cmdsContainer[moveBackwards], cmdsContainer[moveForwards]);
					curPosition = moveForwards + 1;
				}
				else
				{
					curPosition++;
				}
			}
	}	
	
	curPosition = restorePoint;
	
	while(curPosition < numCommands)
	{
			if((cmdsContainer[curPosition]->type != AND_COMMAND &&
				cmdsContainer[curPosition]->type != OR_COMMAND))
			{ curPosition++; }
			else
			{
				if (cmdsContainer[curPosition]->nonRoot ==0)
				{
					cmdsContainer[curPosition]->layer--;
					moveBackwards = curPosition-1;
					moveForwards = curPosition+1;
					while(cmdsContainer[moveBackwards]->nonRoot == 1)
					{ moveBackwards--; }
					while(cmdsContainer[moveForwards]->nonRoot == 1)
					{ moveForwards++; }
					join_commands(cmdsContainer[curPosition], cmdsContainer[moveBackwards], cmdsContainer[moveForwards]);
					curPosition = moveForwards + 1;
				}
				else
				{
					curPosition++;
				}
			}
	}
	
	curPosition = restorePoint;
	
	while(curPosition < numCommands)
	{
			if(cmdsContainer[curPosition]->type != SEQUENCE_COMMAND)
			{ curPosition++; }
			else
			{
			
				if (cmdsContainer[curPosition]->nonRoot ==0)
				{
					cmdsContainer[curPosition]->layer--;
					moveBackwards = curPosition-1;
					moveForwards = curPosition+1;
					while(cmdsContainer[moveBackwards]->nonRoot == 1)
					{ moveBackwards--; }
					while(cmdsContainer[moveForwards]->nonRoot == 1)
					{ moveForwards++; }
					join_commands(cmdsContainer[curPosition], cmdsContainer[moveBackwards], cmdsContainer[moveForwards]);
					curPosition = moveForwards + 1;
				}
				else
				{
					curPosition++;
				}
			}
	}
	
	curPosition = restorePoint;
	
	/* find and return the only node without parents (head node) */
	while(curPosition < numCommands)
	{
			if(cmdsContainer[curPosition]->nonRoot == false)
			{ return cmdsContainer[curPosition]; }
			curPosition++;
	}
	
	return NULL;
}

command_stream_t
make_command_stream (int (*get_next_byte) (void *),
		     void *get_next_byte_argument)
{
	/* create a current_byte char to look at the current byte */
	char current_byte; 

	/* create a temporary array to hold all the commands that we will even put together into a tree */
	command_t tmpCmdHolder = NULL;

	/*char buffer array to take in all the characters from the file in the beginning*/
	char* cmdBuffer;

	/*index for what element in the character buffer we are currently looking at */
	int cmdBufIndx = 0;

	/*malloc initialize size of char buffer to 16, change size of character to indicate that */
	cmdBuffer = (char *)checked_malloc(256 * sizeof(char));
	size_t size = (size_t) 256 * sizeof(char);
	
	/*for changing subshell commands*/
	int* initialPos = (int*) checked_malloc(sizeof(int*));

	/*to create array of commands */
	size_t containerSize = (sizeof(command_t) * 1024);
	command_t* cmdsContainer = (command_t*) checked_malloc(containerSize);
	int counter = 0;
	int numCommands = 0;
	
	/*create primary array of commands*/
	command_stream_t output = (command_stream_t) checked_malloc(sizeof(struct command_stream));
	output->command_array = (command_t*) checked_malloc((size_t) sizeof(command_t) * 8);
	output->index = 0;
	output->size = 0;
	
	current_byte = get_next_byte(get_next_byte_argument);
	
	int marker;
	
	//iteratively get next element
	while (current_byte != EOF)
	{
		
		/*realloc memory */
		if (cmdBufIndx * sizeof(char) == size)
			{cmdBuffer = (char *) checked_grow_alloc(cmdBuffer, &size);}
		cmdBuffer[cmdBufIndx] = current_byte;
		cmdBufIndx++ ;
		current_byte = get_next_byte(get_next_byte_argument);
		
	}
	
	cmdBuffer[cmdBufIndx] = current_byte;
	
	/* set cmdBufIndx back to 0 once we are done reading */
	cmdBufIndx = 0;
	
	/* keep track of line for return error */
	int line_num = 1;

	/* create variable to check if we are in a subshell or not */
	int NumOpenBrack = 0;

	
	char curElement = cmdBuffer[cmdBufIndx];
	
	/* checked the bytes in the command buffer we have just created one by one to create commands */	
	while (curElement != EOF)
	{
		/* check correct use of paranthesis */
		
		/* store what we are currently looking at in the buffer into a char*/
		

		/* ignore white spaces, tabs, and comment tokenol */
		while((curElement == ' ') || (curElement == '\t') || (curElement == '#'))
		{
			/* if comment, ignore until newline */
			if(curElement == '#')
					{
						if (cmdBufIndx >0)
						{
							if (cmdBuffer[cmdBufIndx-1] != ' ' && cmdBuffer[cmdBufIndx-1] != '\n')
							{
								error(1, 0, "invalid character before #");
							}
						}
					while(curElement != '\n')
 					{cmdBufIndx++;
					curElement = cmdBuffer[cmdBufIndx];}
					}
			else
				{cmdBufIndx++;
				curElement = cmdBuffer[cmdBufIndx];}
		}
	
		if (ifSimpleChar(curElement) == 1)
		{
			/* put code to retrieve following simple command, and put it into a simple command struct */
			tmpCmdHolder = getSimpleCmd(cmdBuffer, &cmdBufIndx);

		}
		
		else if (ifSpecialToken(curElement) == 1)
		{
			/* check to see which special token the character currently is and put the command into the proper special command struct" */
			if(curElement == '&')
			{
			
				if (counter > 0)   //checking for error
				{
					if(cmdsContainer[counter-1]->type != SIMPLE_COMMAND &&
						cmdsContainer[counter-1]->type != RIGHT_PAREN)
					{ error(1,0, "Two consecutive special commands in line: %i",line_num);	}
				}
				
				cmdBufIndx++;
				curElement = cmdBuffer[cmdBufIndx];
				
				/* check if AND_COMMAND is valid */
				if(curElement == '&')
				{
					marker = cmdBufIndx;
					cmdBufIndx++;
						curElement = cmdBuffer[cmdBufIndx];
					 
					while(curElement == ' ' || curElement == '\n' || curElement == '\t' || curElement == '#')
					{
						/* if comment, ignore until newline */
						if(curElement == '#')
						{
					
							if (cmdBufIndx >0)
								{
									if (cmdBuffer[cmdBufIndx-1] != ' ' && cmdBuffer[cmdBufIndx-1] != '\n')
									{
										error(1, 0, "invalid character before #");
									}
								}
							while(curElement != '\n')
							{
								cmdBufIndx++;
								curElement = cmdBuffer[cmdBufIndx];
							}
						}
						cmdBufIndx++;
						curElement = cmdBuffer[cmdBufIndx];
					}
					if(curElement == '(' || ifSimpleChar(curElement) == 1)
					{
					
					tmpCmdHolder = createSpecialCmd(AND_COMMAND);
					cmdBufIndx = marker;
					curElement = cmdBuffer[cmdBufIndx];
				
					}
					else
					{ error(1,0, "Invalid token after '&' in line: %i",line_num);	}		
				}
				/*also check if next command in array of commands is a simple command or a LEFT PAREN */
				
				
							
	/* add and command to array of commands */
					
			}
			
			else if(curElement == '|')
			{
			
			if (counter > 0)
			{
			if(cmdsContainer[counter-1]->type != SIMPLE_COMMAND &&
					cmdsContainer[counter-1]->type != RIGHT_PAREN)
				{ error(1,0, "Two consecutive special commands in line: %i",line_num);	}
			}
				/* check if OR_COMMAND or PIPE_COMMAND is valid */
				cmdBufIndx++;
				curElement = cmdBuffer[cmdBufIndx];
				//OR case
				if(curElement == '|')
				{
							marker = cmdBufIndx;
							cmdBufIndx++;
							curElement = cmdBuffer[cmdBufIndx];
							while(curElement == ' ' || curElement == '\n' || curElement == '\t' || curElement == '#')
							{
								/* if comment, ignore until newline */
									if(curElement == '#')
									{
										if (cmdBufIndx >0)
										{
											if (cmdBuffer[cmdBufIndx-1] != ' ' && cmdBuffer[cmdBufIndx-1] != '\n')
											{
												error(1, 0, "invalid character before #");
											}
										}
										while(curElement != '\n')
										{
											cmdBufIndx++;
											curElement = cmdBuffer[cmdBufIndx];
										}
									}
								cmdBufIndx++;
								curElement = cmdBuffer[cmdBufIndx];
							}
							if(curElement == '(' || ifSimpleChar(curElement) == 1)
							{
								tmpCmdHolder = createSpecialCmd(OR_COMMAND);
								cmdBufIndx = marker;
								curElement = cmdBuffer[cmdBufIndx];
							}
							else
							{
								error(1, 0, "invalid token after '||'");
							}
							cmdBufIndx = marker;
							curElement = cmdBuffer[cmdBufIndx];
					
					
				}
				//PIPELINE case
				else if(curElement == ' ' || curElement == '\n' || curElement == '\t' || curElement == '(' || ifSimpleChar(curElement) == 1)
					{
						marker = cmdBufIndx-1;
						while(curElement == ' ' || curElement == '\n' || curElement == '\t' || curElement == '#')
							{
								/* if comment, ignore until newline */
									if(curElement == '#')
									{
										if (cmdBufIndx >0)
										{
											if (cmdBuffer[cmdBufIndx-1] != ' ' && cmdBuffer[cmdBufIndx-1] != '\n')
											{
												error(1, 0, "invalid character before #");
											}
										}
									
										while(curElement != '\n')
										{
										cmdBufIndx++;
										curElement = cmdBuffer[cmdBufIndx];
										}
									}
									cmdBufIndx++;
									curElement = cmdBuffer[cmdBufIndx];
							}
						if(curElement == '(' || ifSimpleChar(curElement) == 1)
							{	
								tmpCmdHolder = createSpecialCmd(PIPE_COMMAND);
								cmdBufIndx = marker;
								curElement = cmdBuffer[cmdBufIndx];
							}
						else
							{
								error(1, 0, "invalid token after '|'");
							}		
						cmdBufIndx = marker;
						curElement = cmdBuffer[cmdBufIndx];
					}
			}
			
			else if(curElement == '(')
			{
				NumOpenBrack++;
				marker = cmdBufIndx;
				cmdBufIndx++;
				curElement = cmdBuffer[cmdBufIndx];
				while (curElement == ' ' || curElement == '\n' || curElement == '\t' || curElement == '#')
				{
					/* if comment, ignore until newline */
								if(curElement == '#')
								{
										if (cmdBufIndx >0)
										{
											if (cmdBuffer[cmdBufIndx-1] != ' ' && cmdBuffer[cmdBufIndx-1] != '\n')
											{
												error(1, 0, "invalid character before #");
											}
										}
										while(curElement != '\n')
										{
											cmdBufIndx++;
											curElement = cmdBuffer[cmdBufIndx];
										}
								}
					cmdBufIndx++;
					curElement = cmdBuffer[cmdBufIndx];
				}
				
				if(ifSimpleChar(curElement) == 1)
					{ tmpCmdHolder = createSpecialCmd(LEFT_PAREN); }
				else
					{ error(1,0, "Invalid token after '(' in line: %i",line_num);	}
				cmdBufIndx = marker;
				curElement = cmdBuffer[cmdBufIndx];	
			}
			
			else if(curElement == ')')
			{
				NumOpenBrack--;
				if(NumOpenBrack < 0)
				{ error(1,0, "')' cannot precede '(' in line: %i",line_num);	}
				tmpCmdHolder = createSpecialCmd(RIGHT_PAREN);
			}
			
			else if(curElement == '<')
			{
				if (counter >= 2)
				{
					if (cmdsContainer[counter -2]->type == LARGER_SIGN)
					{error(1,0, "Invalid token before '<' in line: %i",line_num);}
				}
				marker = cmdBufIndx;
				cmdBufIndx++;
				curElement = cmdBuffer[cmdBufIndx];
				while(curElement == ' ' || curElement == '\t')
				{
					cmdBufIndx++;
					curElement = cmdBuffer[cmdBufIndx];
				}
				if (ifSimpleChar(curElement))
				{
					tmpCmdHolder = createSpecialCmd(SMALLER_SIGN);
					cmdBufIndx = marker;
					curElement = cmdBuffer[cmdBufIndx];
				}
				else
				{ error(1,0, "Invalid token after '<' in line: %i",line_num);}	
			}
			
			else if(curElement == '>')
			{
				marker = cmdBufIndx;
				cmdBufIndx++;
				curElement = cmdBuffer[cmdBufIndx];
				while(curElement == ' ' || curElement == '\t')
				{
					cmdBufIndx++;
					curElement = cmdBuffer[cmdBufIndx];
				}
				if (ifSimpleChar(curElement))
				{
					tmpCmdHolder = createSpecialCmd(LARGER_SIGN);
					cmdBufIndx = marker;
					curElement = cmdBuffer[cmdBufIndx];
				}
				else
				{ error(1,0, "Invalid token after '>' in line: %i",line_num);	}
			}
			
			else if(curElement == ';' && NumOpenBrack > 0 && counter != 0)
			{
					marker = cmdBufIndx;
					cmdBufIndx++;
					curElement = cmdBuffer[cmdBufIndx];
					while (curElement == ' ' || curElement== '\n' || 
						curElement == '\t' || curElement == '#')
					{
						if (curElement == '#')
						{
							if (cmdBufIndx >0)
							{
								if (cmdBuffer[cmdBufIndx-1] != ' ' && cmdBuffer[cmdBufIndx-1] != '\n')
								{
									error(1, 0, "invalid character before #");
								}
							}
							while(curElement != '\n')
							{
							 cmdBufIndx++;
							 curElement = cmdBuffer[cmdBufIndx];
							 }
					    }
						cmdBufIndx++;
						curElement = cmdBuffer[cmdBufIndx];
					}
					if( ifSimpleChar(curElement) == 1)
					{
						tmpCmdHolder = createSpecialCmd(SEQUENCE_COMMAND);
						cmdBufIndx = marker;
						curElement = cmdBuffer[cmdBufIndx];
					}
					else if (curElement == '(')
					{
						tmpCmdHolder = createSpecialCmd(SEQUENCE_COMMAND);
						cmdBufIndx = marker;
						curElement = cmdBuffer[cmdBufIndx];
					}
					else if (curElement == ')')
					{
						cmdBufIndx = marker;
						curElement = cmdBuffer[cmdBufIndx];
					}
					else
					{ error(1,0, "Invalid token after ';' in line: %i",line_num);	}
			}
			else if(curElement == ';'  && counter == 0)
			{error(1,0, "Invalid token in line: %i",line_num);}
			
		}
		
		else if (curElement == '#')
		{
				if(cmdBufIndx >0)
				{
					if (cmdBuffer[cmdBufIndx-1] != ' ')
					{error(1,0, "Invalid token in line: %i",line_num);}
				}	
				while(curElement != '\n')
 				{
					cmdBufIndx++;
					curElement = cmdBuffer[cmdBufIndx];
				}
		}
		
		else if (curElement != '\n' && curElement != EOF)
		{error(1,0, "Invalid token in line: %i",line_num);}
		
		/*check if we are at a newline and we are not in a subshell command */
		if(((curElement == '\n') || (curElement == ';')) && (counter != 0))
		{
			if (NumOpenBrack == 0)
			{
				if (cmdsContainer[counter-1]->type == SIMPLE_COMMAND||
				cmdsContainer[counter-1]->type == RIGHT_PAREN)
				{				
					output->command_array[output->size] = generateTree(cmdsContainer, numCommands, initialPos, 0);
					output->size++;
					*initialPos = 0;
					free(cmdsContainer);	
					containerSize = (size_t) (sizeof(command_t) * 1024);
					cmdsContainer = (command_t*) checked_malloc(containerSize);
					counter = 0;
					numCommands = 0;
				}		
			
			}
			else if (NumOpenBrack>0)
			{
				if (curElement == '\n')
				{
					if (counter > 0)
					{
						if (cmdsContainer[counter-1]->type == SIMPLE_COMMAND)
						{	
							marker = cmdBufIndx;
							cmdBufIndx++;
							curElement = cmdBuffer[cmdBufIndx];
							while (curElement == ' ' || curElement == '\n')
							{
								cmdBufIndx++;
								curElement = cmdBuffer[cmdBufIndx];
							}
							if (curElement == '(' || ifSimpleChar(curElement))
							{
								tmpCmdHolder = createSpecialCmd(SEQUENCE_COMMAND);
								/*check if we need to resize */
								if ((counter * sizeof(command_t)) == containerSize)
									cmdsContainer = (command_t*) checked_grow_alloc(cmdsContainer, &containerSize);
							
								cmdsContainer[counter] = tmpCmdHolder;
								counter++;
								numCommands++;
							}
							cmdBufIndx = marker;
							curElement = cmdBuffer[cmdBufIndx];	
						}
					
					}
					/* else do nothing */
				}
				else if (curElement == ';')
				{
					if (counter > 0)
					{
						if (tmpCmdHolder->type == SEQUENCE_COMMAND)
						{
							if (cmdsContainer[counter-1]->type == SIMPLE_COMMAND)
							{
								/*check if we need to resize */
								if ((counter * sizeof(command_t)) == containerSize)
									cmdsContainer = (command_t*) checked_grow_alloc(cmdsContainer, &containerSize);
				
								cmdsContainer[counter] = tmpCmdHolder;
								counter++;
								numCommands++;
							}
						}
					}
				}
			}
		}
			
		/*add command to the commands container */
		if (curElement != '\n' && curElement != ';' && curElement != EOF)
		{		
				if(counter == 0)
				{
					if(tmpCmdHolder->type != SIMPLE_COMMAND && tmpCmdHolder->type != LEFT_PAREN)
					{ error(1,0, "The first command must be a simple command or open parenthesis in line: %i",line_num-1);	}
				}
				
				/*check if we need to resize */
				if ((counter * sizeof(command_t)) == containerSize)
					cmdsContainer = (command_t*) checked_grow_alloc(cmdsContainer, &containerSize);
				
				cmdsContainer[counter] = tmpCmdHolder;
				counter++;
				numCommands++;
		}
		
		cmdBufIndx++;
		curElement = cmdBuffer[cmdBufIndx];
	
		if((curElement == EOF) && (counter != 0))
		{
				if (NumOpenBrack > 0)
				{ error(1,0, "Unclosed parenthesis in line: %i",line_num-1);}
				if (counter > 0)
				{
					if (cmdsContainer[counter-1]->type != SIMPLE_COMMAND && cmdsContainer[counter-1]->type != RIGHT_PAREN)
					{	
						error(1, 0, "last command is not a simple command or right paren");
					}
				}
				output->command_array[output->size] = generateTree(cmdsContainer, numCommands, initialPos, 0);
				output->size++;
				*initialPos = 0;				
				free(cmdsContainer);	
		}
	}
	return output;
}

command_t
read_command_stream (command_stream_t s)
{
  int temp = s->index;
	s->index++;
	if (temp < s->size)
	{
	return s->command_array[temp];
	}
	else
	{return NULL;}
}