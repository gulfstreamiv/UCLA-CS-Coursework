%----------------------------------------------------------------------------
% DicePair.m
%----------------------------------------------------------------------------

function H = DicePair(n)

% Simulates n rollings of a pair of dice.
% [adapted from Dice.m, written by C. van Loan]

   close all
   clc
   
   First  = 1 + floor(6*rand(n,1));
   Second = 1 + floor(6*rand(n,1));
   Throws = First + Second;
   hist(Throws, 2:12);
   H = hist(Throws, 2:12);
   title(sprintf('Outcome of %d Dice Rolls.',n))

