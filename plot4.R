#################################
##
## Macro to generate a four plots of
## power usage for the
## exploratory course project
##
#################################

plot4 <- function()
{
  ##Set the directory we will work in
  setwd("/home/richard/coursera/exploring/project1/ExData_Plotting1");
  
  ## Grab the data we want to use
  power<-grab_data()

  #attach the data frame (so we don't need to use power$XXX)
  attach(power);

  ##set the output device
  png(file="plot4.png",width=480,height=480);
  
  ##Divide the plotting canvas into 4
  par(mfrow=c(2,2));

  ##Make and display four plots
  ##Top Left
  plot(as.numeric(Global_active_power)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
       ylab="Global Active Power", xlab="",
       main="",
       type="l");
  
  ##Top Right
  plot(as.numeric(Voltage)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
       ylab="Voltage", xlab="datetime",
       type="l");
  
  ##Bottom Left
  plot(as.numeric(Sub_metering_1)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
       ylab="Energy sub metering", xlab="",
       type="l",col="black");
  points(as.numeric(Sub_metering_2)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
         type="l",col="red");
  points(as.numeric(Sub_metering_3)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
         type="l",col="blue");
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),
         lty=1,lwd=2,bty="n");
  
  ##Bottom Right
  plot(as.numeric(Global_reactive_power)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
       ylab="Global_reactive_power", xlab="datetime",
       type="l");
  
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
