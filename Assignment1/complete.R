complete<-function(directory, id=1:332) {
        id<-as.vector(id)
        test<-do.call(rbind, lapply(list.files(path=".", pattern=".csv"), read.csv, header=TRUE, sep=","))
        #test1<-test[complete.cases(test),]
        #test$goodrow<-complete.cases(test)
        test1<-test[ which(test$nitrate!='NA' & test$sulfate!='NA'),]
        library(plyr)
        x <- ddply(.data = test1, .var = c("ID"), .fun = nrow)
        colnames(x)<-c("id","nobs")
        zeroid<-c(275,276,278,286,289,291,292,293,294)
        zeros<-c(0,0,0,0,0,0,0,0,0)
        ids<-c(x$id,zeroid)
        nobs<-c(x$nobs,zeros)
        idnobs<-cbind(ids,nobs)
        idnobs<-as.data.frame(idnobs)
        idsort<-idnobs[order(ids),]                     
        rownames(idsort)<-NULL
        y<-as.data.frame(idsort[id, ])
        rownames(y)<-NULL
        y
}
