insurance <- read.csv("insurance.csv", stringsAsFactors = TRUE)

str(insurance)

summary(insurance$expenses)

hist(insurance$expenses)

table(insurance$region)

table(insurance$sex)

table(insurance$smoker)

cor(insurance[c("age", "bmi", "children", "expenses")])

insurance$age2 <- insurance$age^2

insurance$bmi30 <- ifelse(insurance$bmi >= 30, 1, 0)

ins_model <- lm(expenses ~ age2 + children + bmi30 + sex + smoker + region,
                data = insurance)

ins_model

summary(ins_model)
