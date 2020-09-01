plot2 <- function(){
        ## Attempting to read the household_power_consumption.txt file
        ## Subset the data for the 2 days provided: 2007-02-01 and 2007-02-02
        ## Generate a plot of global active power vs time
        
        ## read the data
        HouseholdData <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";" )
        
        ## Merge Data and Time together to make one column
        TimeDate <- strptime(paste(HouseholdData$Date, HouseholdData$Time, sep = " ") , "%d/%m/%Y %H:%M:%S")
        HouseholdData <- cbind(HouseholdData, TimeDate)
        
        ## make sure class is the correct class across the board                
        HouseholdData$Date <- as.Date(HouseholdData$Date, format="%d/%m/%Y")
        HouseholdData$Time <- format(HouseholdData$Time, format="%H:%M:%S")
        HouseholdData$Global_active_power <- as.numeric(HouseholdData$Global_active_power)
        
        ## subset data from the dates above
        subsetdata <- subset(HouseholdData, Date == "2007-02-01" | Date == "2007-02-02")
        
        ## plot the dimensions of global active power vs. Date and Time
        png("plot2.png", width = 480, height = 480)
        with(subsetdata, plot(TimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
        dev.off()
}