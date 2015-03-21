---
output: html_document
---

# Human Activity Recognition using Smartphones
Raw data reading for both test and traing data were loaded along with list of suject and activity.
Then the subject and activity table were binded with the data table to have a single table having subject, activity and various variable readings.
After that the two tables, test and train were merged together to have single table  containing both test and training data.

Subset the data, select only those colums having one of these 'mean', 'Mean', 'std' in their name. Subject and Activity column are retained.
'activity' columns numeric values are replaced by corresponding activity label.

Group the data first by subject and then again by activity column. Finally calculate the mean for all variables for each group for each subject. 
This generates the final table haivng tidy data. This data is then written into a file.  


## List of variables in tidy data

#### Variables representing time domain signals are prefixed with 't'
#### Variables representing frequency domain signals are prefixed with 'f'

1. **subject** : Type - Numeric  
ID of person participating in the project               

2. **activity** Character  
Activity being performed by the subject for which various readings are recorded. Activity Code and corresponding Labels
- 1. LAYING
- 2. SITTING
- 3. STANDING
- 4. WALKING
- 5. WALKING DOWNSTAIRS
- 6. WALKING UPSTAIRS
        
3. **tBodyAcc.mean.X:**  : Type - Numeric  
Body acceleration Mean value in X direction

4. **tBodyAcc.mean.Y**   : Type - Numeric  
Body acceleration Mean value in Y direction            

5. **tBodyAcc.mean.Z**   : Type - Numeric  
Body acceleration Mean value in Z direction             

6. **tBodyAcc.std.X**    : Type - Numeric  
Body acceleration Standard Deviation value in X direction                 

7. **tBodyAcc.std.Y**  : Type - Numeric  
Body acceleration Standard Deviation value in Y direction

8. **tBodyAcc.std.Z**  : Type - Numeric  
Body acceleration Standard Deviation value in Z direction    

9. **tGravityAcc.mean.X**  : Type - Numeric  
Acceleration due to Gravity Mean value in X direction                

10. **tGravityAcc.mean.Y**     : Type - Numeric  
Acceleration due to Gravity Mean value in Y direction                

11. **tGravityAcc.mean.Z**   : Type - Numeric  
Acceleration due to Gravity Mean value in Z direction                    

12. **tGravityAcc.std.X**   : Type - Numeric  
Acceleration due to Gravity Standard Deviation value in X direction                                 

13. **tGravityAcc.std.Y**   : Type - Numeric  
Acceleration due to Gravity Standard Deviation value in Y direction                                    

14. **tGravityAcc.std.Z**  : Type - Numeric  
Acceleration due to Gravity Standard Deviation value in Z direction                                       

15. **tBodyAccJerk.mean.X** : Type - Numeric  
Body Acceleration Jerk mean value in X direction                                                 

16. **tBodyAccJerk.mean.Y**  : Type - Numeric  
Body Acceleration Jerk mean value in Y direction                                                       

17. **tBodyAccJerk.mean.Z** : Type - Numeric  
Body Acceleration Jerk mean value in Z direction                                                          

18. **tBodyAccJerk.std.X** : Type - Numeric  
Body Acceleration Jerk Standard Deviation value in X direction                                                                 

19. **tBodyAccJerk.std.Y**  : Type - Numeric  
Body Acceleration Jerk Standard Deviation value in Y direction                                                                       

20. **tBodyAccJerk.std.Z**  : Type - Numeric  
Body Acceleration Jerk Standard Deviation value in Z direction                                                                           

21. **tBodyGyro.mean.X**  : Type - Numeric  
Body Gyro mean value in X direction                                                                                 

22. **tBodyGyro.mean.Y**  : Type - Numeric  
Body Gyro mean value in Y direction                                                                                                    

23. **tBodyGyro.mean.Z** : Type - Numeric  
Body Gyro mean value in Z direction                                                                                                    

24. **tBodyGyro.std.X**  : Type - Numeric  
Body Gyro Standard Deviation value in X direction                                                                                                    

25. **tBodyGyro.std.Y**    : Type - Numeric  
Body Gyro Standard Deviation value in Y direction                                                                                                                       

25. **tBodyGyro.std.Z**    : Type - Numeric  
Body Gyro Standard Deviation value in Z direction                                                                                                                      

26. **tBodyGyroJerk.mean.X**   : Type - Numeric  
Body Gyro Jerk mean value in X direction                                                                                                    

28. **tBodyGyroJerk.mean.Y**     : Type - Numeric  
Body Gyro Jerk mean value in Y direction                                                                                                             

29. **tBodyGyroJerk.mean.Z**     : Type - Numeric  
Body Gyro Jerk mean value in Z direction                                                                                                    

30. **tBodyGyroJerk.std.X**    : Type - Numeric  
Body Gyro Jerk Standard Deviation value in X direction                                                                                                                   

31. **tBodyGyroJerk.std.Y**   : Type - Numeric  
Body Gyro Jerk Standard Deviation value in Y direction                                                                                                                             

32. **tBodyGyroJerk.std.Z**   : Type - Numeric  
Body Gyro Jerk Standard Deviation value in Z direction                                                                                                                              

33. **tBodyAccMag.mean**  : Type - Numeric   
Body Acceleration Mag  mean value

34. **tBodyAccMag.std**  : Type - Numeric   
Body Acceleration Mag Standard Deviation value              

35. **tGravityAccMag.mean: **  : Type - Numeric   
Gravity Acceleration Mag mean value

36. **tGravityAccMag.std** : Type - Numeric  
Gravity Acceleration Mag Standard Deviation value       

37. **tBodyAccJerkMag.mean**  : Type - Numeric  
Body Acceleration Jerk Mag mean value

38. **tBodyAccJerkMag.std**  : Type - Numeric
Body Acceleration Jerk Mag Standard Deviation value

39. **tBodyGyroMag.mean: ** : Type - Numeric  
Body Gyro Mag mean value                

40. **tBodyGyroMag.std:**  : Type - Numeric  
Body Gypro Mag Standard Deviation

41. **tBodyGyroJerkMag.mean** : Type - Numeric  
Body Gyro Jerk Mag Mean Value

42. **tBodyGyroJerkMag.std**   : Type - Numeric  
Body Gyro Jerk Mag Standard Deviation value

43. **fBodyAcc.mean.X**   : Type - Numeric  
Frequency Body Acceleration mean value in X direction

44. **fBodyAcc.mean.Y**  : Type - Numeric  
Frequency Body Acceleration mean value in Y direction              

45. **fBodyAcc.mean.Z**  : Type - Numeric  
Frequency Body Acceleration mean value in Z direction                    

46. **fBodyAcc.std.X**  : Type - Numeric  
Frequency Body Acceleration Standard Deviation in X direction

47. **fBodyAcc.std.Y**  : Type - Numeric  
Frequency Body Acceleration Standard Deviation in Y direction                    

48. **fBodyAcc.std.Z**  : Type - Numeric  
Frequency Body Acceleration Standard Deviation in Z direction                     

49. **fBodyAcc.meanFreq.X**  : Type - Numeric  
Frequency Body Acceleration Mean in X direction

50. **fBodyAcc.meanFreq.Y**   : Type - Numeric  
Frequency Body Acceleration Mean in Y direction              

51. **fBodyAcc.meanFreq.Z**   : Type - Numeric  
Frequency Body Acceleration Mean in Z direction                

52. **fBodyAccJerk.mean.X**   : Type - Numeric   
Frequency Body Acceleration Jerk Mean in X direction            

53. **fBodyAccJerk.mean.Y**    : Type - Numeric  
Frequency Body Acceleration Jerk Mean in Y direction                         

54. **fBodyAccJerk.mean.Z**    : Type - Numeric  
Frequency Body Acceleration Jerk Mean in Z direction                             

55. **fBodyAccJerk.std.X**  : Type - Numeric  
Frequency Body Acceleration Jerk Standard Deviation in X direction                          

56. **fBodyAccJerk.std.Y**  : Type - Numeric  
Frequency Body Acceleration Jerk Standard Deviation in Y direction                                          

57. **fBodyAccJerk.std.Z**  : Type - Numeric  
Frequency Body Acceleration Jerk Standard Deviation in Z direction                                      

58. **fBodyAccJerk.meanFreq.X**  : Type - Numeric  
Frequency Body Acceleration Jerk Mean in X direction                                      

59. **fBodyAccJerk.meanFreq.Y**  : Type - Numeric  
Frequency Body Acceleration Jerk Mean in Y direction                                                  

60. **fBodyAccJerk.meanFreq.Z**  : Type - Numeric  
Frequency Body Acceleration Jerk Mean in Z direction                                      

61. **fBodyGyro.mean.X**  : Type - Numeric  
Frequency Body Gyro Mean value in X direction

62. **fBodyGyro.mean.Y**  : Type - Numeric  
Frequency Body Gyro Mean value in Y direction               

63. **fBodyGyro.mean.Z**  : Type - Numeric  
Frequency Body Gyro Mean value in Z direction                    

64. **fBodyGyro.std.X**  : Type - Numeric  
Frequency Body Gyro Standard Deviation value in X direction               

65. **fBodyGyro.std.Y**  : Type - Numeric  
Frequency Body Gyro Standard Deviation value in Y direction                                

66. **fBodyGyro.std.Z**  : Type - Numeric  
Frequency Body Gyro Standard Deviation value in Z direction                              

67. **fBodyGyro.meanFreq.X**  : Type - Numeric  
Frequency Body Gyro Mean value in X direction                              

68. **fBodyGyro.meanFreq.Y**  : Type - Numeric  
Frequency Body Gyro Mean value in Y direction                                             

69. **fBodyGyro.meanFreq.Z**  : Type - Numeric  
Frequency Body Gyro Mean value in Z direction                                              

70. **fBodyAccMag.mean**  : Type - Numeric  
Frequency Body Acceleration  Mag mean value             

71. **fBodyAccMag.std** : Type - Numeric  
Body Acceleration Mag Standard Deviation

72. **fBodyAccMag.meanFreq**  : Type - Numeric  
Body Acceleration Mag Mean value

73. **fBodyBodyAccJerkMag.mean** : Type - Numeric  
Body Acceleration Jerk Mag mean Value

74. **fBodyBodyAccJerkMag.std**  : Type - Numeric  
Body Acceleration Jerk Mag Standard Deviation Value

75. **fBodyBodyAccJerkMag.meanFreq**  : Type - Numeric  
Body Acceleration Jerk Mag mean value

76. **fBodyBodyGyroMag.mean**  : Type - Numeric  
Body Gyro Mag Mean value

77. **fBodyBodyGyroMag.std**  : Type - Numeric  
Body Gyro Mag Standard Deviation

78. **fBodyBodyGyroMag.meanFreq**  : Type - Numeric  
Body Gyro Mag mean freq. Value

79. **fBodyBodyGyroJerkMag.mean**  : Type - Numeric  
Body Gyro Jerk Mag mean value

80. **fBodyBodyGyroJerkMag.std**  : Type - Numeric  
Body Gyro Jerk Mag Standard Deviation value

81. **fBodyBodyGyroJerkMag.meanFreq**  : Type - Numeric   
Body Gyro Jerk Mag mean value

82. **angle.tBodyAccMean.gravity.**  : Type - Numeric  
Angle Body Acceleration mean gravity

83. **angle.tBodyAccJerkMeangravityMean.**  : Type - Numeric   
Angle Body Acceleration Jerk Mean Gravity Mean Value

84. **angle.tBodyGyroMean.gravityMean.**  : Type - Numeric  
Angle Body Gyro Mean Gravity Mean value

85. **angle.tBodyGyroJerkMean.gravityMean.**  : Type - Numeric  
Angle Body Gyro Jerk Mean Gravity mean value

86. **angle.X.gravityMean.**  : Type - Numeric  
Angle Gravity mean in X direction

87. **angle.Y.gravityMean.**  : Type - Numeric  
Angle Gravity mean in Y direction