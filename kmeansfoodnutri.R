#dataset
library(ggplot2)
foodnutri<- read.csv("nutrifood.csv", stringsAsFactors = FALSE)
View(foodnutri)

#datatype
head(foodnutri)

req_data<-foodnutri[,c("calories","transfat","energykcal")]

#random seed for data reproductive 
set.seed(123)

kmeans_result<-kmeans(req_data,centers = 4,nstart = 20)

foodnutri$cluster<-as.factor(kmeans_result$cluster)

print(kmeans_result)

ggplot(foodnutri,aes(x=calories,y=energykcal, color=cluster))+geom_point(size=3)+labs(title = "Clustering of energy per kcal by calories",x="calories", y="energy per kcal")+theme_dark()

ggplot(foodnutri,aes(x=calories,y=transfat, color=cluster))+geom_point(size=3)+labs(title = "Clustering of calories by transfat",x="calories", y="transfat")+theme_classic()


write.csv(foodnutri,"cluster_of_energy.csv",row.names = FALSE)
table(foodnutri$cluster)
