# 🧠 Mental Health Insights Dashboard 📊

*An Interactive Exploration of Student Well-Being using R*

---

## 🔍 Overview

This project explores the **mental health landscape among students** using a rich dataset containing variables like **relationship status**, **depression scores**, **substance use**, **stress levels**, and more. Through **data visualization, regression modeling, and decision trees**, we derive meaningful insights into factors impacting student emotional well-being.

---

## 💡 Project Objectives

* Understand mental health variations by **relationship status**, **gender**, **course**, and **age**
* Identify patterns in **substance use** and **sleep quality**
* Use **logistic regression** to predict sleep quality
* Visualize depression score patterns using a **decision tree**

---

## 📁 Dataset

* The dataset is selected interactively using `file.choose()`
* Assumes columns like:

  * `Depression_Score`
  * `Stress_Level`
  * `Sleep_Quality`
  * `Substance_Use`
  * `Physical_Activity`
  * `CGPA`
  * `Course`, `Gender`, `Age`, `Relationship_Status`

---

## 🛠️ Tools & Libraries Used

| Category                | Libraries             |
| ----------------------- | --------------------- |
| 📊 Visualization        | `ggplot2`, `lattice`  |
| 📦 Data Wrangling       | `dplyr`, `datasets`   |
| 🧮 Statistical Modeling | `rpart`, `rpart.plot` |
| 📈 Regression Analysis  | `glm` (base R)        |

---

## 📊 Visual Analysis

### 1️⃣ Relationship Status & Depression

* Bar chart of relationship status
* Boxplot of **Depression Score by Relationship Status**
* 🔍 *Insight:* Emotional well-being varies distinctly across status types.

### 2️⃣ Substance Use by Gender

* Stacked bar chart visualizing **substance use patterns**
* 🔍 *Insight:* Gender-specific substance use behavior is easily distinguishable.

### 3️⃣ Stress Levels by Course

* Course-wise count and boxplots
* 🔍 *Insight:* Academic streams may correlate with differing stress levels.

### 4️⃣ Age vs Depression Score

* Histogram of age
* Line plot showing **average depression score per age**
* 🔍 *Insight:* Emotional health trends across age groups are highlighted.

### 5️⃣ Relationship Status + Sleep Quality

* Multivariate boxplot integrating **sleep quality**
* 🔍 *Insight:* Poor sleep amplifies depression risk across all relationship types.

---

## 🤖 Logistic Regression

### 📌 Objective:

Predict whether a student has **Good or Poor Sleep Quality** based on:

* `Course`
* `Gender`

### 🔍 Model:

```r
model <- glm(Sleep_Quality ~ Course + Gender, data = df, family = binomial)
```

### 🧪 Prediction:

```r
predict_result("Law", "Female")  ➡️ "Good"
```

### 📈 Accuracy:

> Achieved model accuracy: `~<calculated value>` (rounded to 4 decimals)

---

## 🌳 Decision Tree for Depression Score

**Inputs**:

* CGPA
* Stress Level
* Physical Activity

**Output**:

* Depression Score prediction

```r
tree_model <- rpart(Depression_Score ~ CGPA + Stress_Level + Physical_Activity, data = df)
rpart.plot(tree_model)
```

✅ Enhanced with:

* Node numbers
* Leaf alignment
* Dashed branches and shaded boxes

---

## 📸 Sample Visuals

> *(Screenshots of boxplots, tree diagram, or ggplot charts can be added here for extra flair in the GitHub repo)*

---

## 🙋‍♀️ Author

**Sanya Shresta Jathanna**
🔗 [Portfolio](https://sanyashresta.netlify.app)
🐦 [@sanya\_shresta](https://twitter.com/sanya_shresta)
💻 [GitHub](https://github.com/SanyaShresta25)

---

## ✨ Future Enhancements

* 📦 Package this into a **Shiny dashboard**
* 🧠 Add more advanced models: Random Forest, SVM
* 🌈 Add theme toggling and interactive filtering

---

> *"Data is not just about numbers—it's the key to understanding human experience."*

---


