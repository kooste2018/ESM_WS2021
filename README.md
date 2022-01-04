# ESM_project
this is the repository for project of lecture environmental sensing and modelling, WS 2021/22. see task description in WS21_22_TaskDescriptionAirQualityData.pdf and our presentation https://docs.google.com/presentation/d/1vusKi98P3vWSo5zbdr_A4PxYKVPhYVa81OoGY4aciZY/edit#slide=id.g108c5fccc0c_0_0
## data 
we use the December 2021 NO2 data from https://www.lfu.bayern.de/luft/immissionsmessungen/messwertarchiv/index.htm, the original .xlsx file NO2_2021_12.xlsx can be found in this repo. For this project, we only evaluate data from the following stations:
  - Landshuter Allee (LHA)
  - Stachus (STA)
  - Lothstraße (LOT)
  - Allach
  - Johanneskirchen 
## task 4 
Question: Is there a correlation between traffic and NO2 concentration for the whole day and is there another effect that also needs to be considered?
Answer: From the second figure we can see a significant correlation between both data, since the more traffic during the day leads to the higher NO2 concentration. However, we cannot come to a conclusion that traffic dominates NO2 ppm, because the it always increases with intraday delay, which indicates the accumulated NO2 emission by traffic or other possible reasons. More observations are reqiured to support an argument with stronger correlations. 
## task 5
1. how to open a .kml/.kmz file with google maps?
 - Open Google My Maps.
 - Create a new map.
 - Press import into the upper left corner.
 - Now open the KML file. Or drag the KML file into the import window.
 - You did it! You have successfully imported a KML into Google Maps.
2. possible solution: we create a 20x20 matrix and interplate with some predefined function or manuelly. **the question here is the cooridinate of stations in this matrix.** then we overlay this matrix as a mask to the given .kmz file. see reference.  




reference: 

https://www.researchgate.net/post/How-to-import-KMZ-KML-file-into-Matlab 

https://www.mathworks.com/help/map/exporting-vector-data-to-kml.html

https://www.mathworks.com/help/map/ref/kmlwritepolygon.html#bu2jsw9-1-latitude

