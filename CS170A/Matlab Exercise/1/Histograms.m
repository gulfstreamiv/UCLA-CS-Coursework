% Histograms of rand(1000,1) and randn(1000,1).
% [written by C. van Loan]

   x = rand(1000000,1);
   % subplot(2,1,1)
   hist(x,30)
   axis([-1 2 0 60])
   title('Distribution of Values in rand(1000,1)')
   xlabel(sprintf('Mean = %5.3f. Median = %5.3f.',mean(x),median(x)))

   x = randn(1000000,1);
   % subplot(2,1,2)
   figure  %  open a new figure window
   hist(x,linspace(-3.9,3.9,100))
   title('Distribution of Values in randn(1000,1)')
   xlabel(sprintf('Mean = %5.3f. Standard Deviation = %5.3f',mean(x),std(x)))
