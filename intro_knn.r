# Import the CSV file
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

# Drop the id feature
wbcd <- wbcd[-1]

# Table of diagnosis
table(wbcd$diagnosis)

# Recode diagnosis as a factor
wbcd$diagnosis <- factor(
  wbcd$diagnosis,
  levels = c("B", "M"),
  labels = c("Benign", "Malignant")
)

# Table or proportions with more informative labels
round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)

# Summarize three numeric features
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])

# Create normalization function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# Test normalization function - result should be identical
normalize(c(1, 2, 3, 4, 5))
normalize(c(10, 20, 30, 40, 50))

# Normalize the wbcd data
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

# Confirm that normalization worked
summary(wbcd_n$area_mean)

# Create training and test data
wbcd_train <- wbcd_n[1:469,]
wbcd_test <- wbcd_n[470:569,]

# Create labels for training and test data
wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]


# Load the "class" library
library(class)

wbcd_test_pred <-
  knn(
    train = wbcd_train,
    test = wbcd_test,
    cl = wbcd_train_labels,
    k = 21
  )