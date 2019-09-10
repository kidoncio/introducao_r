
## Vector
subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101,4)
flu_status <- c(FALSE, FALSE, TRUE)

temperature
temperature[2]
temperature[2:3]
temperature[-2]


## Factor

# Add gender factor
gender <- factor(c("MALE", "FEMALE", "MALE"))
gender

# Add blood type factor
blood <- factor(c("O", "AB", "A"),
                levels = c("A", "B", "AB", "O"))
blood

# Add ordered factor
symptons <- factor(c("SEVERE", "MILD", "MODERATE"),
                   levels = c("MILD", "MODERATE", "SEVERE"),
                   ordered = TRUE)
symptons


## Lists

# John Doe
subject1 <- list(fullname = subject_name[1],
                 temperature = temperature[1],
                 flu_status = flu_status[1],
                 gender = gender[1],
                 blood = blood[1],
                 symptons = symptons[1])
subject1

# Get a single list value by position (returns a sub-list)
subject1[2]

# Get a single list value by position (returns a numeric vector)
subject1[[2]]

# Get a single list value by name
subject1$temperature

# Get several list items by specifying a vector of names
subject1[c("temperature", "flu_status")]

# Acces a list like a vector
subject1[2:3]


## Data frames

# Create a data frame from medical patient data
pt_data <- data.frame(subject_name, temperature, flu_status, gender,
                      blood, symptons, stringsAsFactors = FALSE)

# Display the data frame
pt_data
