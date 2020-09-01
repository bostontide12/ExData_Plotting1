plot3 <- function(){
        ## Attempting to read the household_power_consumption.txt file
        ## Subset the data for the 2 days provided: 2007-02-01 and 2007-02-02
        ## Generate a plot of submetering 1, 2, and 3 vs time
        
        ## read the data
        HouseholdData <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";" )
        
        ## Merge Data and Time together to make one column
        TimeDate <- strptime(paste(HouseholdData$Date, HouseholdData$Time, sep = " ") , "%d/%m/%Y %H:%M:%S")
        HouseholdData <- cbind(HouseholdData, TimeDate)
        
        ## make sure class is the correct class across the board                
        HouseholdData$Date <- as.Date(HouseholdData$Date, format="%d/%m/%Y")
        HouseholdData$Time <- format(HouseholdData$Time, format="%H:%M:%S")
        HouseholdData$Global_active_power <- as.numeric(HouseholdData$Global_active_power)
        HouseholdData$Global_reactive_power <- as.numeric(HouseholdData$Global_reactive_power)
        HouseholdData$Voltage <- as.numeric(HouseholdData$Voltage)
        HouseholdData$Global_intensity <- as.numeric(HouseholdData$Global_intensity)
        HouseholdData$Sub_metering_1 <- as.numeric(HouseholdData$Sub_metering_1)
        HouseholdData$Sub_metering_2 <- as.numeric(HouseholdData$Sub_metering_2)
        HouseholdData$Sub_metering_3 <- as.numeric(HouseholdData$Sub_metering_3)
        
        ## subset data from the dates above
        subsetdata <- subset(HouseholdData, Date == "2007-02-01" | Date == "2007-02-02")
        
        ## plot the dimensions of submetering 1, 2, and 3 vs time
        png("plot3.png", width=480, height=480)
        plot(TimeDate, subsetdata$Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering")
        lines(subsetdata$TimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
        lines(subsetdata$TimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
        legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
        dev.off()
}