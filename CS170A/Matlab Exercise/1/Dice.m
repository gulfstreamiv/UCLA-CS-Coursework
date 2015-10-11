%----------------------------------------------------------------------------
% Dice.m
%----------------------------------------------------------------------------

% Script File: Dice
%
% Simulates 1000 rollings of a pair of dice.
% [written by C. van Loan]

   close all
   clc
   
   First  = 1 + floor(6*rand(1000000,1));
   Second = 1 + floor(6*rand(1000000,1));
   Throws = First + Second;
   hist(Throws, linspace(2,12,11));
   title('Outcome of 1000 Dice Rolls.')

