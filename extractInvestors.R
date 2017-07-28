inv<-read.csv("SeedDB-Investors.csv")
grep("[::digit::]", inv, value = TRUE)
inv<-inv[130:7261,]
inv2<-gsub("<.*?>", "", inv)
?gsub
inv
write.csv(inv2, "Investor.csv")
inv3<-gsub("[^0-9]", "", inv)
inv3
write.csv(inv3, "InvestorCode.csv")
inv3<-as.data.frame(inv3)
website<-paste0("http://www.seed-db.com/investorgraph/investorview?investorid=",inv3$inv3)
df<-cbind(inv2,inv3,website)
write.csv(df, "SeedDB-Investor.csv")

inv4<-read.csv("SeedDB-Investor.csv")
setwd("C:/Users/skarzynskimw/GitHub/extractInvestorData")
inv4<-inv4[,2:4]
names(inv4)[1:2]<-c("Investor", "InvestorID")
#trim each website url to 77 characters
inv4[,3]<-strtrim(inv4[,3],77)

#test it
nchar(inv4[,3])==77

write.csv(inv4, "SeedDB-InvestorTrim.csv")
