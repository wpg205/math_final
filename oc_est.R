setwd("/Users/williamgodel/Google Drive/Grad School/Year Three/math/final")
library(pscl)
library(oc)
library(wnominate)

votes<-read.csv(file = "votes_mask.csv",header=FALSE, sep=",")
votes<-as.matrix(votes)
votes_rc <- rollcall(votes, yea=c(1), nay=c(0), missing = NaN)

result1<-oc(votes_rc,polarity=c(472), dims = 1, minvotes=0, lop=0.0)
write.csv(result1$legislators[,7], file = "1D_oc_est.csv")

result2<-oc(votes_rc,polarity=c(472,472), dims = 2, minvotes=0, lop=0.0)

write.csv(result2$legislators[,7:8], file = "2D_leg_oc_est.csv")
write.csv(result2$rollcalls[,6:8], file = "2D_rc_oc_est.csv")
write.csv(result2$rollcalls[,1:4], file = "2D_yea_oc_est.csv")


summary(result2)
summary(result1)
