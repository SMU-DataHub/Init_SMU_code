#---
# title: "Live Session 2 CLT"
# author: "Todd"
# date: "12.29.2022"
# output:
#   html_document:
#     df_print: paged
#---


# From the Rmarkdown file in the Live Session 1 repository on Github, 
# we create an R file by placing the extension *.r instead of the *.Rmd 
# extension.  From here, we can modify and debug the assignment.  
# Restated, the assignment is:  
# 1. Adapt the code to generate a population of 10,000,000 from a chi-square 
# distribution with 2 degrees of freedom.  This is a heavily right skewed 
# distribution.  (Hint: rchisq()) You will have to red up on this function 
# and probably do some trial and error.  Being able to learn new functions 
# and methods is a key skill.  





# Simulator to Demonstrate CLT

## Control Parameters



n1 <- 10000000

#generate 10,000,000 random values that follow Chi-Square distribution with df=2
values <- rchisq(n1, df = 2)

#view first 5 values
head(values)

#create a histogram to visualize distribution of values
#par(mfrow = c(2,1))
hist(values, col = "green", main = paste("Distribution of the Chi-Square population: n = ", n1), xlab = "Dist 1 Chi-Square", xlim = c(-15,15))

#Determine the mean and standard error of the values
x <- mean(values)
y <- sd(values)
paste("The mean of the population is,", x, "The standard deviation of the population is,", y)
z <- (x - y)

paste("The difference between the mean x and the standard deviation y is,", z)

# Part 4 is the question: "According to CLT, what should be the approximate
# distribution of sample means of size 50 from this right skewed population?
# ANSWER:  The means of the sample size 50 should be the same as the mean of the 
# population:  mux = mu(sample)
# What shoud be the mean and standard error of the mean (stand deviation of 
# of the distribution of sample means)?
# ANSWER: The standard error should be smaller by a facter of 1/squareroot(50)

# Part 5 is to run the math and check the CLT


# df <- read.table("C:\\users\\tgarn\\OneDrive\\Desktop\\SMU - MS Data Science\\Courses\\DS 6306 Doing Data Science\\Assignments\\Week 1\\Working Folder - Assignments\\Question 2\\yob2016.txt",stringsAsFactors = FALSE,header = FALSE,sep = ";") # nolint
n2 <- 50 # sample size per sample for 1st distribution
simulations <- 10000 #number of samples and thus number of xbars we will generate.  
mu <- x # mean parameter for use with normal distribuions
sigma <- y # standard deviation parameter for use with normal distribuions


# ## Data Holder
xbar_holder1 <- numeric(simulations) # This will hold all the sample means for the first distribution.

# ## Simulate and Store
#Utilizing some of the existing code we will do the following
# # Generate 10000 samples each of size 50 and find the mean 
#of each sample.  Then store each mean in the xbar_holder vector.
for (i in 1:simulations)
{ 
 sample1 <- rnorm(n2,mean = mu, sd = sigma)

xbar1 <- mean(sample1)
xbar_holder1[i] <- xbar1
}

# ## display the distribution of sample means (plot a histogram of the sample means)
# # {r}
##par(mfrow = c(2,1))
hist(xbar_holder1, col = "blue", main = paste("Distribution of the sample mean: n = ", n2), xlab = "Dist 1 Sample Means", xlim = c(-4,4))
# # hist(xbar_holder2, col = "red", main = paste("Distribution of the sample mean: n = ", n2), xlab = "Dist 2 Sample Means", xlim = c(-4,4))
# hist(xbar_holder3, col = "green", main = paste("Distribution of the sample mean: n = ", n3), xlab = "Dist 1 Chi-Square", xlim = c(-4,4))


# ## summary statistics of the distribution of the simulated sample means. 
# # {r}
summary(xbar_holder1) #5 number summary and the mean
# # summary(xbar_holder2) #5 number summary and the mean
# summary(xbar_holder3) # number summary and the mean
sd(xbar_holder1) # standard deviation of dstribuion 1
# # sd(xbar_holder2) #standard deviation of distribuion 2
# sd(xbar_holder3) #standard deviation of Chi-Square distribution




