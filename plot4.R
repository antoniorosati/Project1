
R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.66 (7060) x86_64-apple-darwin13.4.0]

[Workspace restored from /Users/antoniorosati/.RData]
[History restored from /Users/antoniorosati/.Rapp.history]

> setwd("/Users/antoniorosati/desktop/data/jhu/Exploratory")
> hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
> hpc$DateTime <- paste(hpc$Date, hpc$Time)
> hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
> start<-which(hpc$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
> end<-which(hpc$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
> hpcplots <- hpc[start:end,]
> par(mfcol = c(2, 2))
> plot(hpcplots$DateTime, as.numeric(as.character(hpcplots$Global_active_power)), type = 'l', ylab = "Global Active Power", xlab = "", bg = "white")
> plot(hpcplots$DateTime, as.numeric(as.character(hpcplots$Sub_metering_1)), type = 'l', ylab = "Energy sub metering", xlab = "", bg = "white")
> lines(hpcplots$DateTime, as.numeric(as.character(hpcplots$Sub_metering_2)), type = 'l', col = "red")
> lines(hpcplots$DateTime, hpcplots$Sub_metering_3, type = 'l', col = "blue")
> legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
> plot(hpcplots$DateTime, as.numeric(as.character(hpcplots$Voltage)), type = 'l', ylab = "Voltage", xlab = "datetime", bg = "white")
> plot(hpcplots$DateTime, as.numeric(as.character(hpcplots$Global_reactive_power)), type = 'l', ylab = "Global_reactive_power", xlab = "datetime", bg = "white")
> dev.copy(png, file = "plot4.png")
quartz_off_screen 
                3 
> dev.off()
quartz 
     2 
> 