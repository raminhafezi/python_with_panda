#!/usr/bin/env python
import pandas as pd
''' 
	combining DataFrame 
	concatenating and appending
'''

df1 = pd.DataFrame({'HPI' : [80,85,32,56],
					'Int_rate' : [2,3,2,2],
					'US_GDP_Thousands': [50,56,65,55]},
					index = [2001, 2002, 2003, 2004])
					
df2 = pd.DataFrame({'HPI' : [80,85,88,85],
					'Int_rate' : [2,3,2,2],
					'US_GDP_Thousands' : [50,55,65,55]},
					index = [2005,2006,2007,2008])
					
df3 = pd.DataFrame({'HPI' : [80,85,88,85],
					'Int_rate' : [50,52,50,53],
					'Low_tier_HPI' : [50,52,50,53]},
					index = [2001, 2002, 2003, 2004])	
					
concat = pd.concat([df1, df3, df2], sort=True)
print(concat)	

'''
Here is the result
      HPI  Int_rate  Low_tier_HPI  US_GDP_Thousands
2001   80         2           NaN              50.0
2002   85         3           NaN              56.0
2003   32         2           NaN              65.0
2004   56         2           NaN              55.0
2001   80        50          50.0               NaN
2002   85        52          52.0               NaN
2003   88        50          50.0               NaN
2004   85        53          53.0               NaN
2005   80         2           NaN              50.0
2006   85         3           NaN              55.0
2007   88         2           NaN              65.0
2008   85         2           NaN              55.0

As you see, there are multiple NaN place which we like to have the number,
because they could be. So concatination is not very good to aggregate DataFrame together
'''
df4 = df1.append(df2)
print(df4)
'''
here is a result of the append
      HPI  Int_rate  US_GDP_Thousands
2001   80         2                50
2002   85         3                56
2003   32         2                65
2004   56         2                55
2005   80         2                50
2006   85         3                55
2007   88         2                65
2008   85         2                55

so basically the append just add to be bottom of the dataFrame
in this case we do not have the shared index between two datasets.
'''

df4 = df1.append(df3)
print(df4)

'''
Here is a result
      HPI  Int_rate  Low_tier_HPI  US_GDP_Thousands
2001   80         2           NaN              50.0
2002   85         3           NaN              56.0
2003   32         2           NaN              65.0
2004   56         2           NaN              55.0
2001   80        50          50.0               NaN
2002   85        52          52.0               NaN
2003   88        50          50.0               NaN
2004   85        53          53.0               NaN


So, it is much like a concatenation
basically append is good if you want to add another row to your dataset 

look at this example
'''

# First we define a series in pandas
ser = pd.Series([80, 25, 2], index = ['HPI', 'Int_rate', 'US_GDP_Thousands'])

# now we can appedn this to our dataset

app = df1.append(ser, ignore_index = True)
print(app)
