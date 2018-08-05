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




#Building and printing the Quandl code for querrying the Quandle for 
#getting the US State housung price index  nby state later

'''
for StateAbbv in (fiddy_states[0][1][1:]):
	query = ('FMAC/HPI_{}'.format(StateAbbv))
	df = quandl.get(query)
	print("State: {}, index {}".format(StateAbbv, df.tail(5)))
	print "*"*5
'''

# Now we can use join to aggregate all dataFrame into a one DataFame.
# so first we make an empty DataFrame and then add each state DataFrame into it

def state_list():
	fiddy_states = pd.read_html('https://simple.wikipedia.org/wiki/List_of_U.S._states')
	return fiddy_states[0][1][1:]

def grab_initial_State_data():
	states = state_list()
	main_df = pd.DataFrame()
	
	for Abbv in (states):
		query = ('FMAC/HPI_{}'.format(Abbv))
		df = quandl.get(query)
		
		if main_df.empty:
			main_df = df
		else:
			main_df = main_df.join(df, lsuffix='_left', rsuffix='_right')
	return main_df

print(grab_initial_State_data())
