library(GGally)
library(ggplot2)
library(tidyverse)
library(ggExtra)
data <- read.csv("diabetes.csv")
#data$Age <- as.factor(data$Age)
data$age_range <- cut(data$Age, breaks = seq(20, 80, by = 10))
#GRAPH 1
plot1 <- ggplot(data = data) +
  geom_bar(mapping = aes(x = age_range, fill = Outcome, group = Outcome)) +
  theme(legend.position = "none")
  ggsave("plot1.png", plot1)

#GRAPH 2
plot2 <- ggpairs(data, columns = c("Insulin", "Pregnancies",
"BloodPressure", "Glucose", "SkinThickness", "Outcome"),
        title = "Scatterplot Matrix for Diabetes Data")
 ggsave("plot2.png", plot2)

#GRAPH 3
plot3 <- ggplot(data = data, aes(x = age_range,
y = BloodPressure, group = age_range)) +
  geom_boxplot() +
  labs(x = "Age", y = "BloodPressure",
  title = "Box Plot of BloodPressure by Age")
  ggsave("plot3.png", plot3)

#GRAPH 4
plot4 <- ggplot(data = data) +
  geom_point(aes(x = Glucose, y = Insulin,
                 color = Outcome),
             size = 4, shape = 3)
 ggsave("plot4.png", plot4)

#GRAPH 5
plot5 <- ggplot(data, aes(x = Age)) +
  geom_histogram() +
  scale_fill_brewer(palette = "Set1")
  ggsave("plot5.png", plot5)

#GRAPH 6
p <- ggplot(data, aes(x = Insulin, y = BloodPressure,
color = Insulin, size = Insulin)) +
      geom_point() +
      theme(legend.position = "none")
plot6 <- ggMarginal(p, type = "histogram", color = "red", fill = "slateblue")
ggsave("plot6.png", plot6)

#GRAPH 7
plot7 <- ggplot(data = data, aes(x = Insulin, y = Outcome)) +
                               geom_point() +
       stat_smooth(method = lm, col = "red")
ggsave("plot7.png", plot7)
