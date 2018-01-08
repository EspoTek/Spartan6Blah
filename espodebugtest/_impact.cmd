setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
loadProjectFile -file "/home/esposch/Git/Spartan6Blah/espodebugtest/impact.ipf"
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
setMode -bs
setMode -bs
setCable -port auto
setCable -port auto
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "/home/esposch/Git/Spartan6Blah/espodebugtest/top_level.bit"
Program -p 1 
setMode -bs
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
