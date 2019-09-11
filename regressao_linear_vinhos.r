wine <- read.csv('wine.csv', stringsAsFactors = FALSE)

str(wine)

ins_model <- lm(Price ~ AGST,
                data = wine)

ins_model

summary(ins_model)

plot(
  wine$AGST,
  wine$Price,
  main = "Average Growing Season Temp vs Price",
  xlab = "AGST",
  ylab = "Price",
  col = "blue"
)
abline(ins_model$coefficients, col = "red")

