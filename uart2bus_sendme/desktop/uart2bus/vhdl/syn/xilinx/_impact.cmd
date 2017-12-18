setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "C:/Users/cesposito/Documents/Xilinx/uart2bus/toplevel.bit"
attachflash -position 1 -spi "N25Q128"
assignfiletoattachedflash -position 1 -file "C:/Users/cesposito/Documents/Xilinx/ledblink2/impact.mcs"
attachflash -position 1 -spi "N25Q128"
setCable -port usb21 -baud 12000000
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
saveProjectFile -file "C:/Users/cesposito/Documents/Xilinx/uart2bus/impact.ipf"
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
saveProjectFile -file "C:/Users/cesposito/Documents/Xilinx/uart2bus/impact.ipf"
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
