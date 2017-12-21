library(sp)
library(tmap)
library(rgdal)
# library(pdftools)
# txt <- pdf_text("susa.pdf")
# library(stringr)
# 
# stri<-readChar("sus.txt", nchar=1e5)
# ss<-str_replace_all(stri, "\n" ,"")
# str_match_all(ss, "\\(\\d*\\)([^\\.]*\\.)")
getwd()
map<-readOGR(dsn=path.expand("/home/art/maps"), layer="BARRIOS_EUSTAT_5000_ETRS89")
plot(map)
summary(map)

tm_shape(mapb)+tm_borders()
mapb<-map[map$BAR_MUNI=="020",]
tm_shape(mapb)+tm_borders()

nu <- read_delim("numero_habitantes_barrio_sexo_2017.csv",";", escape_double = FALSE, trim_ws = TRUE) 
nhh<-nu[nu$SEXO=="HOMBRES",]


nyc_tracts_merge <- merge(nyc_tracts, nyc_income, by.x="TRACTCE", by.y = "tract")
