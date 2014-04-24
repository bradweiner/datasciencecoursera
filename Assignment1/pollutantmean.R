##Assignment
##pollutantmean <- function(directory, pollutant, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

##Code Starts HERE##

setwd("~")
pollutantmean <- function(directory, pollutant, id=1:332) 
{
        setwd("~")
        basedir<-getwd()
        #directory<-"specdata/"
        targetdirectory<-paste(basedir,"/",directory,sep="")
        setwd(targetdirectory)
        #set directory
        #directory<-"C:/Users/wein0339/Desktop/Dropbox/Coursera/Programming with R/specdata/"
        #set id
        #id<-20
        #set pollutant
        #pollutant<-"sulfate"
        #Vector of filenames in the directory
        filenames<-as.character(list.files())
        #Concatenate root directory to each file
        fullfile<-paste(basedir,"/",directory,"/",filenames,sep="")
        #create vector for storing data
        meantable<- c()
        #for loop to build out the means
        for (i in id) {
                # read the file
                loadfile <- read.csv(fullfile[i])
                # load the specified pollutant
                result <- loadfile[,pollutant]
                # get the good values from the specified pollutant
                valid <- result[ !is.na(result) ]
                meantable <- c(meantable,valid)
        }
        return(mean(meantable))
       
} 
