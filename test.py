#!/usr/bin/env python
import pandas as pd
import quandl
''' 
	Building DataFrame and Pickling 
	
'''

api_key = open('quandlapikey.txt', 'r').read()

#Source: https://www.quandl.com/tools/python
#Assigning our API key and removing new_line with rstrip()
quandl.ApiConfig.api_key = api_key.rstrip()
#Visiting Wikipedia page to get a list of US state abbriviation

fiddy_states = pd.read_html('https://simple.wikipedia.org/wiki/List_of_U.S._states')


#Building and printing the Quandl code for querrying the Quandle for 
#getting the US State housung price index  nby state later


for StateAbbv in (fiddy_states[0][1][1:]):
	query = 'FMAC/HPI_'+str(StateAbbv)
	df = quandl.get(query)
	#df.set_index('Value', inplace=True)
	print(df.index.values)
	print "*"*5

