plot1 <- function(){
        ## Attempting to read the household_power_consumption.txt file
        ## Subset the data for the 2 days provided: 2007-02-01 and 2007-02-02
        ## Build a histogram or global active power
        
        ## read the data
        HouseholdData <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";" )
        
        ## make sure class is the correct class across the board                
        HouseholdData$Date <- as.Date(HouseholdData$Date, format="%d/%m/%Y")
        HouseholdData$Time <- format(HouseholdData$Time, format="%H:%M:%S")
        HouseholdData$Global_active_power <- as.numeric(HouseholdData$Global_active_power)
     
        ## subset data from the dates above
        subsetdata <- subset(HouseholdData, Date == "2007-02-01" | Date == "2007-02-02")
        
        ##plot histogram of global active power for 2 days
        png("plot1.png", width = 480, height = 480)
        hist(subsetdata$Global_active_power, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
        dev.off()
}