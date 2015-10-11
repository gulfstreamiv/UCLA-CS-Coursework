/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/*
 * leftBitCount - returns count of number of consective 1's in
 *     left-hand (most significant) end of word.
 *   Examples: leftBitCount(-1) = 32, leftBitCount(0xFFF0F0F0) = 12
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 50
 *   Rating: 4
 */
int leftBitCount(int x) {
  // this algorithm divides and conquers, but specifically for 
	int v = x;
	int r;	// store our result here
	int shift;
	int full = !(~x); // we must add one if we have 0xffffffff

	// This awesome algorithm's credit goes to Olafur P.G.
	// Without his insight I would never have been able to derive it

	// Check the top 16 bits and add them to our result if they exist
	r = !(~(v>>16)) << 4;
	v <<= r;
	// check the remaining 8 bits
	shift = !(~(v >> 24)) << 3;
	v   <<= shift;
	r    |= shift;
	// remaining 4 bits
	shift = !(~(v>>28)) << 2;
	v   <<= shift;
	r    |= shift;
	// remaining 2 bits
	shift = !(~(v >> 30)) << 1;
	v   <<= shift;
	r    |= shift;
	// remaining 1 bits
	r    ^= 1&((v>>31));

	// rememer to add one if we have 32 on bits
	return r + full;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
   int sign = (x>>31) & 1;
   int signChain =~sign+1;
   int placeHolder = 0; /*throwaway variable for various operations*/
   int c = 2; /*counter to increment to count the bits*/
   int copy = x; /*to be used for checking if power of 2*/
   int copy2 = x; /*to be used for checking zero*/
   int tminCheck = x ^ (1 << 31);
   tminCheck = !tminCheck;
   tminCheck = ~tminCheck+1; /*all ones if x was tmin*/

   x = (x & ~signChain) | ((~x +1) & signChain);/*now a positive value*/
   x = x + ~0;
   x = (x | x >> 1);
   x = (x | x >> 2);
   x = (x | x >> 4);
   x = (x | x >> 8);
   x = (x | x >> 16);
   x = (x + 1); /*x is rounded up to the next power of 2*/

   /*the following chunks of code follow an algorithm that
does five different checks, incrementing the counter
for each check so that the result is the bit position
of the rounded up value of x*/
   placeHolder = !(x & (0xFF | 0xFF << 8));
   placeHolder = ~placeHolder+1;
   c += (placeHolder & 16);

   placeHolder = !(x & (0xFF | 0xFF << 16));
   placeHolder = ~placeHolder + 1;
   c += (placeHolder & 8);

   placeHolder = 0x0F | 0x0F <<8;
   placeHolder = placeHolder | placeHolder <<16;
   placeHolder = !(x & placeHolder);
   placeHolder = ~placeHolder+1;
   c += (placeHolder & 4);

   placeHolder = 0x33 | 0x33 << 8;
   placeHolder = placeHolder | placeHolder << 16;
   placeHolder = !(x & placeHolder);
   placeHolder = ~placeHolder+1;
   c += (placeHolder & 2);

   placeHolder = 0x55 | 0x55 << 8;
   placeHolder = placeHolder | placeHolder << 16;
   placeHolder = !(x & placeHolder);
   placeHolder = ~placeHolder+1;
   c += (placeHolder & 1);

   /*determines if x is 0. if so, you want to return 1.*/
   copy2 = !copy2;
   copy2 = ~copy2+1;

   c += ~((tminCheck)&1);

   /*add one to the count if x is a power of 2*/
   copy = copy & (copy+~0);
   c += !copy;
   return (c & ~copy2) | (copy2 & 1);
}
/*
 * satAdd - adds two numbers but when positive overflow occurs, returns
 *          maximum possible value, and when negative overflow occurs,
 *          it returns minimum positive value.
 *   Examples: satAdd(0x40000000,0x40000000) = 0x7fffffff
 *             satAdd(0x80000000,0xffffffff) = 0x80000000
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 30
 *   Rating: 4
 */
int satAdd(int x, int y) {
    int sum = x + y;  
    int isOverFlow = ((sum ^ x) & (sum ^ y)) >> 31;  
    return (sum >> (isOverFlow & 31)) + (isOverFlow << 31);
}
/* 
 * sm2tc - Convert from sign-magnitude to two's complement
 *   where the MSB is the sign bit
 *   Example: sm2tc(0x80000005) = -5.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 4
 */
int sm2tc(int x) {
    int mask = 1 << 31;
	int neg = (mask & x) >> 31;
	int pos = ~neg;
	int sign = mask & x;
	pos = pos & x;
	neg = neg & x;
	neg = ~(neg + ~0);
	return (neg + pos + sign);
}
/*
 * ezThreeFourths - multiplies by 3/4 rounding toward 0,
 *   Should exactly duplicate effect of C expression (x*3/4),
 *   including overflow behavior.
 *   Examples: ezThreeFourths(11) = 8
 *             ezThreeFourths(-9) = -6
 *             ezThreeFourths(1073741824) = -268435456 (overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 3
 */
int ezThreeFourths(int x) {
  // like x*3/4, but if the number is negative we add 3 before the division
  // so it is rounded towards zero 
  int z = x+(x<<1); // x << 1 = x * 2, so add the missing x
  // if z is positive, masking 3 by (z >> 31) will always result in 0
  return (z + (3 & (z >> 31))) >> 2; // shift by 2 to divide by 4
}
/* 
 * isNonNegative - return 1 if x >= 0, return 0 otherwise 
 *   Example: isNonNegative(-1) = 0.  isNonNegative(0) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 3
 */
int isNonNegative(int x) {
  return !((x&(1<<31)));
}
/* 
 * replaceByte(x,n,c) - Replace byte n in x with c
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: replaceByte(0x12345678,1,0xab) = 0x1234ab78
 *   You can assume 0 <= n <= 3 and 0 <= c <= 255
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 3
 */
int replaceByte(int x, int n, int c) {
	int n8 = n << 3;
	int mask = 0xff << n8;
	int cshift = c << n8;
	return (x & ~mask) | cshift;
}
/* 
 * rotateRight - Rotate x to the right by n
 *   Can assume that 0 <= n <= 31
 *   Examples: rotateRight(0x87654321,4) = 0x76543218
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 25
 *   Rating: 3 
 */
int rotateRight(int x, int n) {
  int comp_shift = (32 + ~n + 1);
  int head_mask = (1 << n) + ~1 + 1;
  int tail_mask = ~(head_mask << comp_shift);
  int tail = (x >> n) & tail_mask;
  int head = (x & head_mask) << comp_shift;
  return tail | head;
}
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
    return (x + ((x >> 31) & ((1 << n) + ~0))) >> n;
}
/* 
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x) {
   int mask = (0xAA << 8) + 0xAA;
   mask = (mask << 16) + mask;
   return !((x & mask) ^ mask);
}
/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
   return (~(x & y)) & (~((~x) & (~y)));
}
/*
 * isTmin - returns 1 if x is the minimum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmin(int x) {
  int neg1;
  neg1 = !(~x); // if x == -1, neg1 == 1, else, neg1 == 0
  return !((~(x+1)^x)|neg1); // add 1, flip, xor, becomes 0 if Tmax (or if -1)
}
