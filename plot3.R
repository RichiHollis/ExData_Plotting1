#################################
##
## Macro to generate three histograms of
## power sub_metering for the
## exploratory course project
##
#################################

plot3 <- function()
{
  ##Set the directory we will work in
  setwd("/home/richard/coursera/exploring/project1/ExData_Plotting1");
  
  ## Grab the data we want to use
  power<-grab_data()

  #attach the data frame (so we don't need to use power$XXX)
  attach(power);

  ##set the output device
  png(file="plot3.png",width=480,height=480);
  
  ##Make the plots
  plot(as.numeric(Sub_metering_1)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
       ylab="Energy sub metering", xlab="",
       type="l",col="black");
  ##Add on top of the previous plot
  points(as.numeric(Sub_metering_2)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
         type="l",col="red");
  ##Add on top of the previous plots
  points(as.numeric(Sub_metering_3)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
         type="l",col="blue");
  ##Add a legend so we know what we are looking at
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),
         lty=1,lwd=2);
  
  ##Turn-off the current device
  dev.off();
}

##############################
## Generic function to grab the data
## same for all plots in this project.
##############################
grab_data <- function()
{
  ##Remember the current directory
  current_directory = getwd();
  
  ##Location of the data
  setwd("/home/richard/coursera/exploring/project1/");
  
  ##Grab the full table
  power<-read.table("household_power_consumption.txt",
                    header=TRUE,
                    sep=";",
                    stringsAsFactors = FALSE);

  ##subset so we don't spin over evrything all the time
  power_selected<-subset(power,
                         as.Date(power$Date,"%d/%m/%Y")>=as.Date("02/01/2007","%m/%d/%Y")&
                         as.Date(power$Date,"%d/%m/%Y")<=as.Date("02/02/2007","%m/%d/%Y"));

  ##Go back to the original directory
  setwd(current_directory);
  
  ##Return the data frame
  return(power_selected);
}
