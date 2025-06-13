#importing required libraries

library(datasets)
library(ggplot2)
library(lattice)
library(dplyr)
#To choose the data set
df <- read.table(file.choose(),header=TRUE,sep=",")
df

str(df)
View(df)
summary(df)
head(df)
colnames(df)

#Ques 1
#What is the overall distribution of relationship statuses in the data set,
#How does the distribution of depression scores vary among different relationship
#statuses, and what insights can we draw from the boxplot analysis in understanding 
#the emotional well-being of individuals in various relationship statuses?
df <- df[complete.cases(df$Relationship_Status), ]

ggplot(df, aes(x = Relationship_Status, fill = Relationship_Status)) +
  geom_bar() +
  labs(title = "Distribution of Relationship Status", x = "Relationship Status", y = "Count") +
  theme_minimal()

ggplot(df, aes(x = Relationship_Status, y = Depression_Score, fill = Relationship_Status)) +
  geom_boxplot() +
  labs(title = "Depression Scores by Relationship Status", x = "Relationship Status", y = "Depression Score") +
  theme_minimal()


#Ques 2
#How is the distribution of substance use represented in the data set,
#and what insights can be gained by examining the gender-specific breakdown
#of substance use through the stacked bar plot?
ggplot(df, aes(x = Substance_Use, fill = Substance_Use)) +
  geom_bar() +
  labs(title = "Distribution of Substance Use", x = "Substance Use", y = "Count") +
  theme_minimal()

ggplot(df, aes(x = Gender, fill = Substance_Use)) +
  geom_bar(position = "stack") +
  labs(title = "Substance Use by Gender", x = "Gender", y = "Count") +
  theme_minimal()
#Ques 3
#How does the distribution of stress levels vary among different courses,
#and what can be inferred about the potential impact of academic disciplines 
#on the stress experienced by students based on the boxplot analysis?
ggplot(df, aes(x = Course, fill = Course)) +
  geom_bar() +
  labs(title = "Distribution of Courses", x = "Course", y = "Count") +
  theme_minimal()

ggplot(df, aes(x = Course, y = Stress_Level, fill = Course)) +
  geom_boxplot() +
  labs(title = "Stress Level by Course", x = "Course", y = "Stress Level") +
  theme_minimal()
#Ques 4
#How does the distribution of ages among students relate to their average depression
#scores, and what insights can be gained from the combination of a histogram and a line plot 
#depicting the mean depression score across different age groups?
hist(df$Age,
     col="skyblue",
     border="black",
     main="Histogram",
     xlab="Age",
     ylab="No.of Students",
     breaks=20,
)
ggplot(df, aes(x = Age, y = Depression_Score, group = 1)) +
  geom_line(stat = "summary", fun.y = "mean", color = "red") +
  labs(title = "Average Depression Score by Age", x = "Age", y = "Average Depression Score") +
  theme_minimal()
#Ques 5
#How does the distribution of depression scores vary among different relationship statuses,
#and what insights can be gained by incorporating sleep quality as a factor in the analysis 
#through the use of a boxplot?
ggplot(df, aes(x = Relationship_Status, y = Depression_Score, fill = Sleep_Quality)) +
  geom_boxplot() +
  labs(title = "Depression Scores by Relationship Status with Sleep Quality", x = "Relationship Status", y = "Depression Score") +
  theme_minimal()

#Linear Regression
df$Sleep_Quality <- ifelse(df$Sleep_Quality == "Good", 1, 0)

# Create a logistic regression model
model <- glm(Sleep_Quality ~ Course + Gender , data = df, family = binomial)

# Function to predict the sleep quality result
predict_result <- function(Course, Gender) {
  new_data <- data.frame(Course = course, Gender = gender)
  result_prediction <- predict(model, newdata = new_data, type = "response")
  
  return(ifelse(result_prediction > 0, "Good", "Poor"))
}

# Example usage:
course <- "Law" 
gender <- "Female"  


predicted_result <- predict_result(course, gender)
print(predicted_result)

#ACCURACY
df$Sleep_Quality <- ifelse(df$Sleep_Quality == "Good", 1, 0)

# Predict the probabilities using the logistic regression model
predicted_probabilities <- predict(model, type = "response")

# Convert probabilities to binary predictions (1 or 0)
predicted_classes <- ifelse(predicted_probabilities > 0.5, 1, 0)

# Compare predicted_classes to the actual Sleep_Quality
accuracy <- mean(predicted_classes == df$Sleep_Quality)
print(paste("Accuracy:", round(accuracy, 4)))


# Assuming you have a data frame named 'df' with columns "CGPA," "Stress_Level," "Physical_Activity," and "Depression_Score"

# Install and load the required packages
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

# Create a decision tree model
tree_model <- rpart(Depression_Score ~ CGPA + Stress_Level + Physical_Activity, data = df)

# Plot the decision tree
rpart.plot(tree_model, main = "Decision Tree for Depression Score Prediction", extra = 1)


library(rpart)
library(rpart.plot)

# Create a decision tree model
#tree_model <- rpart(Depression_Score ~ CGPA + Stress_Level + Physical_Activity, data = df, cp = 0.001)

# Plot the decision tree with all nodes
rpart.plot(
  tree_model,
  main = "Decision Tree for Depression Score Prediction",
  extra = 1,
  box.palette = "Greens",  # Choose a color palette
  nn = TRUE,  # Add node numbers
  cex = 1.2,  # Adjust text size
  fallen.leaves = TRUE,  # Align leaves horizontally for better readability
  branch.lty = 3 , 
  shadow.col = "lightgray" # Use dashed lines for branches
)

# Print the summary of the tree
summary(tree_model)
