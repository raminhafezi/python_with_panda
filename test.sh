#!/usr/bin/env python
import pandas as pd
import quandl
''' 
	Building a huge DataFrame by join and Pickling, a method to save the dataFrame as a Serial 
	
'''

api_key = open('quandlapikey.txt', 'r').read()

#Source: https://www.quandl.com/tools/python
#Assigning our API key and removing new_line with rstrip()
quandl.ApiConfig.api_key = api_key.rstrip()
#Visiting Wikipedia page to get a list of US state abbriviation

fiddy_states = pd.read_html('https://simple.wikipedia.org/wiki/List_of_U.S._states')


#Building and printing the Quandl code for querrying the Quandle for 
#getting the US State housung price index  nby state later

main_df = pd.DataFrame()
for StateAbbv in (fiddy_states[0][1][1:]):
	query = 'FMAC/HPI_'+str(StateAbbv)
	df = quandl.get(query)
	'''the data we have get every time is like this
	
Date		  Value                  
1975-01-31   35.695975
1975-02-28   35.896770
1975-03-31   36.133518
1975-04-30   36.425723
1975-05-31   36.695708
1975-06-30   36.823713
1975-07-31   36.747060
1975-08-31   36.511773
1975-09-30   36.255136
1975-10-31   36.139294
1975-11-30   36.247464

they are indexed with the Date, and have a column name Value, which is a price. We want to make a huge dataFrame 
and join all of them into one. So, join operation, look at the index, and if two dataFrame has a same index value,
They merge those two dataFrame together. In here, our index is a Date (from 1975 to 2017). so we have no problem with the index,

So, if we want to join each dataFrame in a loop by ____main_df.join(df)_____, 
we will get error like ..
 _______In items_overlap_with_suffix '{rename}'.format(rename=to_rename)) ValueError: columns overlap but no suffix specified: Index([u'Value'], dtype='object')________
 
 It means, I tried to join two DataFrames together but those two DataFrames have the same "Column name",
 So by joining 2 dataFrames they will rise an error, because they have the same column name, they can not put two values into the same column name, so we have to rename column each time before joining it with our main_df by _____df.columns = [StateAbbv]
 To resolve this issue, we will rename the "Value" column to the abbriviation of each state
'''

	df.columns = [StateAbbv] #Error fixing in the webpage https://pythonprogramming.net/community/143/Problem%20/
	if main_df.empty:
		main_df = df
	else:
		main_df = main_df.join(df) 
		print(main_df.head(1))
	
	print("*"*5)

''' as you see, catching those data and then merge into one big DataFrame, tooks a long time. We have to save it.
we can save it into a excel file, or csv file, or in a text or xml file. 

the other option is 

-------Pickling-----------
The idea of pickle is to save any python object [class, dictionary, dataFtame, list, machine learning classifier, ...]
the pickle is serialize the input (python object) and save it as a byteStream or biteCode. 
And when you want, it can load object back.

So, we in our case, we read or fetch, all dataFrame and merge it into a big DataFrame and then serialize it by pickling

how to use pickle:
Likily, python has a pickle module, so just load it by _____import pickle____
