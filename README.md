# BI_Projects

I wanted to show through this project that the algorithm of linear regression works correctly. 

1 - First of all I consider a sample of data and through maximum likelihood (or least squares method) I make an estimation of regression parameters.

2 - Than I create another sample of data that contains the sample 1 and I calculate again the regression parameters. I plot the two different regression models and in most cases we see that the regression model of sample 2 is closer to the real function than the regression model of sample 1.

3 - I repeat the step 1 and 2 many times (in this project I set this number equal to 1000) and I count how many times regression model 2 is better than regression model 1. At the end I have seen that 60-80% of the times regression model 2 is better than regression model 1 and this is coherent to what I expected. So we can conclude that this experiment is coherent with the fact that regression parameters tend to be closer to the real one as $n -> infinity$.
