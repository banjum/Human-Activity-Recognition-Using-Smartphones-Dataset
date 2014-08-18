run_analysis<-function()
{
    ###################################################
    # TIDY DATASET 1
    ###################################################
    
    #Read specific number of rows (used for debugging)
    NROW<- -1
    
    #Read features list to use as col names
    file<-"./UCI HAR Dataset/features.txt"
    colnames<-read.table(file)
    
    #get the vector of features that correspond to mean and std
    keep<-grep("mean|std",colnames[[2]])
        
    #Gather test data
    file<-"./UCI HAR Dataset/test/X_test.txt"
    data<-read.table(file,strip.white=TRUE,nrows=NROW,col.names=colnames[[2]])
    
    #Subset it by vector keep that corresponds to columns with mean and std
    data<-data[keep]
    
    #Append it with activity id 
    file<-"./UCI HAR Dataset/test/y_test.txt"
    col<-read.table(file,nrows=NROW,col.names="activityname")
    data<-cbind(col,data)
    
    #Apped it with subject id
    file<-"./UCI HAR Dataset/test/subject_test.txt"
    col<-read.table(file,nrows=NROW,col.names="subjectid")
    data<-cbind(col,data)
    
    #Gather train data
    file<-"./UCI HAR Dataset/train/X_train.txt"
    data_t<-read.table(file,strip.white=TRUE,nrows=NROW,col.names=colnames[[2]])
    
    #Subset it by vector keep that corresponds to columns with mean and std
    data_t<-data_t[keep]
    
    #Append it with activity id
    file<-"./UCI HAR Dataset/train/y_train.txt"
    col<-read.table(file,nrows=NROW,col.names="activityname")
    data_t<-cbind(col,data_t)
    
    #Apped it with subject id
    file<-"./UCI HAR Dataset/train/subject_train.txt"
    col<-read.table(file,nrows=NROW,col.names="subjectid")
    data_t<-cbind(col,data_t)
    
    #Combine test and train datasets
    data<-rbind(data,data_t)
    
    # Replace activity ids with activity names
    file<-"./UCI HAR Dataset/activity_labels.txt"
    activity_names<-read.table(file)
    
    for(i in seq_len(nrow(data)))
    {
        index<-as.numeric(data[["activityname"]][i])
        data[["activityname"]][i]<-as.character(activity_names[[2]][index])
    }

    # Make dataset variable names better
    names(data)<-gsub("\\.","",names(data))#remove dots
    names(data)<-tolower(names(data))#make lower case
    
    # Store it in file
    write.csv(data,"tidy_UCI_HAR.csv",row.names=FALSE)
    
    ###################################################
    # TIDY DATASET 2
    ###################################################
    ag<-aggregate(data[3:81],by=list(data$subjectid, data$activityname),mean)
    write.table(ag,"tidy_UCI_HAR_dataset2.txt",sep="\t",col.names=FALSE,row.names=FALSE)

}