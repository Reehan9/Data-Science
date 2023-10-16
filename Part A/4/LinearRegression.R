library(ggplot2)
library(caTools)

data(mtcars)
head(mtcars)

split<- sample.split( mtcars , SplitRatio = 0.7)
train<- subset(mtcars , split == TRUE)
test<- subset(mtcars , split == FALSE)


linear_model<-lm(mpg ~ hp, train)
pred<- predict(linear_model , newdata = test)

residuals<-resid(linear_model)
rmse<-sqrt(mean(residuals^2))


test_residuals <- test$mpg - pred
test_rmse <- sqrt(mean(test_residuals^2))
test_rmse


summary(pred)

summary(linear_model)

residuals<-resid(linear_model)
rmse<-sqrt(mean(residuals^2))

ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_point()+
  geom_smooth(method="lm",color="red" , se = FALSE)