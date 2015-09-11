#################################
##
## Macro to generate a histogram of
## Global active power for the
## exploratory course project
##
#################################

plot1 <- function()
{
  ##Set the directory we will work in
  setwd("/home/richard/coursera/exploring/project1/ExData_Plotting1");
  
  ## Grab the data we want to use
  power<-grab_data()

  #attach the data frame (so we don't need to use power$XXX)
  attach(power);

  ##set the output device
  png(file="plot1.png",width=480,height=480);
  
  ##Make the histogram
  hist(as.numeric(Global_active_power),
       xlab="Global Active Power (kilowatts)", ylab="Frequency",
       main="Global Active Power",
       col="red");
  
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
