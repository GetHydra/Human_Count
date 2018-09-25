###########Human Count##############  
This Repo holds some spare code for the IoT work being done.  
  
####################################  
#########GetCount.R#################  
This function will take three input parameters and output the most likely count of objects  
contained in a smart bin. This is accomplished by building three theoretical distributions  
and then modeling 1,000 pulls from each. From these pulls we assess the likelyhood  
that the current voltage is related to each distribution. From this we take the distribution  
with the least amount of error as the most likley. We then use the mean from that distribution  
as the denominator in the count calculation.  
  
#####Input Parameters#####  
Current_Vly: the current voltage   
Tare: the recorded tare value  
Varz: band parameter 
  
#####Output Value#####  
Integer representing estimated current count  


