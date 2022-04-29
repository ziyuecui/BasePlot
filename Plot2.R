library(dplyr)

read.table('household_power_consumption.txt', sep = ';', header = T) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y"), 
               Time = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"),
               Global_active_power = as.numeric(as.character(Global_active_power))) %>%
        filter(Date %in% c(as.Date('2007-02-01'), 
                           as.Date('2007-02-02'))) -> dt

attach(dt)
png('plot2.png', width = 480, height = 480)
plot(Time, Global_active_power, type = 'n', ylab = 'Global Active Power (killowatts)', xlab = '')
lines(Time, Global_active_power)

dev.off()
