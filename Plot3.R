library(dplyr)

read.table('household_power_consumption.txt', sep = ';', header = T) %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y"), 
               Time = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")) %>%
        filter(Date %in% c(as.Date('2007-02-01'), 
                           as.Date('2007-02-02'))) -> dt

attach(dt)
png('plot3.png', width = 480, height = 480)
plot(Time, Sub_metering_1, type = 'n', ylab = 'Energy Sub Metering', xlab = '')
lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2, col = 'red')
lines(Time, Sub_metering_3, col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
