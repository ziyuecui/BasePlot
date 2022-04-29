library(dplyr)

read.table('household_power_consumption.txt', sep = ';', header = T) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y"), 
               Time = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"),
               Global_active_power = as.numeric(as.character(Global_active_power)),
               Voltage = as.numeric(as.character(Voltage)),
               Global_reactive_power = as.numeric(as.character(Global_reactive_power))) %>%
        filter(Date %in% c(as.Date('2007-02-01'), 
                           as.Date('2007-02-02'))) -> dt

attach(dt)
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
plot(Time, Global_active_power, type = 'n', ylab = 'Global Active Power', xlab = '')
lines(Time, Global_active_power)

plot(Time, Voltage, type = 'n', xlab = 'datetime')
lines(Time, Voltage)

plot(Time, Sub_metering_1, type = 'n', ylab = 'Global Active Power (killowatts)', xlab = '')
lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2, col = 'red')
lines(Time, Sub_metering_3, col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(Time, Global_reactive_power, type = 'n', xlab = 'datetime')
lines(Time, Global_reactive_power)

dev.off()
