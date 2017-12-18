baudrate = 115200
globalclockfreq = 100e6

D_BAUD_FREQ = (16 * baudrate) / gcd(globalclockfreq, 16*baudrate);
D_BAUD_LIMIT = globalclockfreq / gcd(globalclockfreq, 16*baudrate) - D_BAUD_FREQ;

dec2hex(D_BAUD_FREQ)
dec2hex(D_BAUD_LIMIT)