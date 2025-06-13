#importing required libraries
library(datasets)
library(ggplot2)
library(lattice)
library(dplyr)
#To choose the data set
df <- read.table(file.choose(),header=TRUE,sep=",")
df
#first few rows
View(df)
summary(df)
head(df)
#To omit the null values


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
hist(data$Age,
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
#	How does the distribution of depression scores vary among different relationship statuses,
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
course <- "Business" 
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


install.packages("randomForest")
# Assuming your dataset is named 'df'
library(randomForest)

# Convert categorical variables to factors
df$Course <- as.factor(df$Course)
df$Gender <- as.factor(df$Gender)
df$Relationship_Status <- as.factor(df$Relationship_Status)
df$Substance_Use <- as.factor(df$Substance_Use)
df$Counseling_Service_Use <- as.factor(df$Counseling_Service_Use)
df$Family_History <- as.factor(df$Family_History)
df$Chronic_Illness <- as.factor(df$Chronic_Illness)
df$Residence_Type <- as.factor(df$Residence_Type)

# Split the data into training and testing sets
set.seed(123)
split_index <- sample(1:nrow(df), 0.8 * nrow(df))
train_data <- df[split_index, ]
test_data <- df[-split_index, ]

# Build a random forest model
rf_model <- randomForest(Depression_Score ~ ., data = train_data, ntree = 500)

# Make predictions on the test set
predictions <- predict(rf_model, newdata = test_data)

# Evaluate the model
confusion_matrix <- table(predictions, test_data$Depression_Score)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 4)))




