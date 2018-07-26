#!/usr/bin/env python
import pandas as pd
import quandl

''' 
	combining DataFrame 
	concatenating and appending
'''

api_key = 'yUxsN1NrRwssSDyET8Ui'

df = quandl.get('FMAC/HPI_AK', authtoken = api_key)

#print(df.tail(5))

#try to catch a list of  50 US state abbriviations from Wikipedia

us_States_aabr = pd.read_html('https://simple.wikipedia.org/wiki/List_of_U.S._states')

# This is a list
#print(us_States_aabr)


# This is a dataFrame
print(us_States_aabr[0])

#print(type(us_States_aabr))
#print(type(us_States_aabr[0]))

#print(us_States_aabr[0][2][1:])

# Now lets make a API key for every US State to poll a request from the  website
for abv in us_States_aabr[0][1][1:]:
	print('FMAC/HPI_{}'.format(str(abv)))
	



