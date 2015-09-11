#################################
##
## Macro to generate a plot of Global
## active power as a function of time for the
## exploratory course project
##
#################################

plot2 <- function()
{
  ##Set the directory we will work in
  setwd("/home/richard/coursera/exploring/project1/ExData_Plotting1");
  
  ## Grab the data we want to use
  power<-grab_data()

  #attach the data frame (so we don't need to use power$XXX)
  attach(power);

  ##set the output device
  png(file="plot2.png",width=480,height=480);
  
  ##Make the plot
  png(file="plot2.png",width=480,height=480)
  plot(as.numeric(Global_active_power)~as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"),
       ylab="Global Active Power (kilowatts)", xlab="",
       main="",
       type="l")
  
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
