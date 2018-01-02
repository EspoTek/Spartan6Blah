setPreference -pref StartupClock:AUTO_CORRECTION
setPreference -pref AutoSignature:FALSE
setPreference -pref KeepSVF:FALSE
setPreference -pref ConcurrentMode:FALSE
setPreference -pref UseHighz:FALSE
setPreference -pref UserLevel:NOVICE
setPreference -pref svfUseTime:FALSE
setPreference -pref SpiByteSwap:AUTO_CORRECTION
setPreference -pref AutoInfer:TRUE
setPreference -pref SvfPlayDisplayComments:FALSE
setMode -pff
setMode -pff
addConfigDevice  -name "saturn-config" -path "C:\Users\Esposch\Documents\Xilinx\blinking_led\"
setSubmode -pffspi
setAttribute -configdevice -attr multibootBpiType -value ""
addDesign -version 0 -name "0"
setMode -pff
addDeviceChain -index 0
setMode -pff
addDeviceChain -index 0
setAttribute -configdevice -attr compressed -value "FALSE"
setAttribute -configdevice -attr compressed -value "FALSE"
setAttribute -configdevice -attr autoSize -value "FALSE"
setAttribute -configdevice -attr fileFormat -value "mcs"
setAttribute -configdevice -attr fillValue -value "FF"
setAttribute -configdevice -attr swapBit -value "FALSE"
setAttribute -configdevice -attr dir -value "UP"
setAttribute -configdevice -attr multiboot -value "FALSE"
setAttribute -configdevice -attr multiboot -value "FALSE"
setAttribute -configdevice -attr spiSelected -value "TRUE"
setAttribute -configdevice -attr spiSelected -value "TRUE"
addPromDevice -p 1 -size 16384 -name 16M
setMode -pff
setMode -pff
setMode -pff
setMode -pff
addDeviceChain -index 0
setMode -pff
addDeviceChain -index 0
setSubmode -pffspi
setMode -pff
setAttribute -design -attr name -value "0000"
addDevice -p 1 -file "C:/Users/Esposch/Documents/Xilinx/blinking_led/led_blink.bit"
setMode -pff
setSubmode -pffspi
generate
setCurrentDesign -version 0
setMode -bs
setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "C:/Users/Esposch/Documents/Xilinx/blinking_led/led_blink.bit"
attachflash -position 1 -spi "N25Q128"
assignfiletoattachedflash -position 1 -file "C:/Users/Esposch/Documents/Xilinx/blinking_led/saturn-config.mcs"
attachflash -position 1 -spi "N25Q128"
Program -p 1 -dataWidth 1 -spionly -e -v -loadfpga 
Program -p 1 -spionly -e -v -loadfpga 
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "C:\Users\Esposch\Documents\Xilinx\blinking_led\\auto_project.ipf"
setMode -bs
setMode -pff
setMode -bs
deleteDevice -position 1
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
deletePromDevice -position 1
setCurrentDesign -version 0
deleteDevice -position 1
deleteDesign -version 0
setCurrentDesign -version -1
