#First, download and save the dataset in to your working directory
#Second, unzip and put the ".txt" file and save it in to the working directory
#The folowing the series of codes will extract athe appropriate data subset and generate the desired plot and save it in a ".png" format


#Reading the whole data
electricData <- read.table("household_power_consumption.txt",
                           comment.char = "#",
                           header = TRUE,
                           sep=";",
                           na.strings = "?")
#Subsetting the two days data
data<- subset(electricData, as.character(Date) == "1/2/2007"|as.character(Date) == "2/2/2007" )

# Convert date column in data into date format
data<-data.frame(Date_Time=0,data)
data$Date_Time<-paste(data$Date,data$Time,sep=" ")
data$Date<-as.Date(data$Date,tz="EST", format="%d/%m/%Y")
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S",tz="EST")


# Plot 2
with(data,plot(Date_Time,Global_active_power,type="l",lwd=1,
               xlab="",ylab="Global active power (kilowatts)"))

# Save plot to a png file
dev.copy(png,"plot2.png",units="px",height=480,width=480)
dev.off()
