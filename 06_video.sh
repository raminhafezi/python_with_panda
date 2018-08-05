#!/usr/bin/env python
import pandas as pd
''' 
	Joining and Merging the DataFrame 
	
'''


df1 = pd.DataFrame({'HPI' : [80,85,88,85],
                    'Int_rate' : [2,3,2,2],
                    'US_GDP_Thousands': [50,56,65,55]},
                    index = [2001, 2002, 2003, 2004])

df2 = pd.DataFrame({'HPI' : [80,85,88,85],
                    'Int_rate' : [2,3,2,2],
                    'US_GDP_Thousands' : [50,55,65,55]},
                    index = [2005,2006,2007,2008]) 

df3 = pd.DataFrame({'HPI' : [80,85,88,85],
                    'Unemployement' : [7,8,9,6],
                    'Low_tier_HPI' : [50,52,50,53]},
                     index = [2001, 2002, 2003, 2004])
                     
print(pd.merge(df1, df2, on='HPI'))
print(pd.merge(df1, df2, on=['HPI', 'Int_rate']))


# in join we want to join two dataFrame to gether based on the share index.
# but here in df1 and df3 we have a different index so lets first define HPI as an index

df1.set_index('HPI', inplace=True)
df3.set_index('HPI', inplace=True)

# now join two dataFrame based on the HPI index

joined = df1.join(df3)
print(joined)
