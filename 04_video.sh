#!/usr/bin/env python
import pandas as pd
import quandl

''' 
	We will cover Panda's IO in this code. 
	We will learn how to fetch data from a different file type and API
	We will use Quandl python package to request data from the Quandl website
	We will also use df.read_html to fetch list of US State abbriviation from Wikipedia site
	 in order to make a API Key for the Quandl website.
	 
	In Quandle website the data is divided and seperated for each US State, so we need to make an 
	API Key(which is combined a fixed term + US State abbriviation. then we can use that to fetch 
	data for each state and download data set for each steate and then join in together.
	
	We will cover join and union on data set in the next toturial.
	
	pd.read_html return a list and each element of the list is a dataFrame
	in order read an specific column in each dataFrame we will use dataFrame[1] notation for Example.
	
'''

api_key = 'yUxsN1NrRwssSDyET8Ui'

df = quandl.get('FMAC/HPI_AK', authtoken = api_key)

#print(df.tail(5))

#try to catch a list of  50 US state abbriviations from Wikipedia

us_States_aabr = pd.read_html('https://simple.wikipedia.org/wiki/List_of_U.S._states')

# This is a list
#print(us_States_aabr)


# This is a dataFrame
#print(us_States_aabr[0])

#print(type(us_States_aabr))
#print(type(us_States_aabr[0]))

#print(us_States_aabr[0][2][1:])

# Now lets make a API key for every US State to poll a request from the  website
#for abv in us_States_aabr[0][1][1:]:
#	print('FMAC/HPI_{}'.format(str(abv)))
	
	
fiddy_states = pd.read_html('https://simple.wikipedia.org/wiki/List_of_U.S._states')
for abbv in (fiddy_states[0][1][1:]):
	print('FMAC/HPI_{}'.format(abbv))


