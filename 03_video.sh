#!/usr/bin/env python
import pandas as pd

''' 
	We will cover Panda's IO in this code.
'''
#read from CSV
#file_address = '/home/ramin/Desktop/git___workspace/python_with_pandas/daily-leaderboard-2018-07-20.csv'
file_address = '/home/ramin/git_workspace/python_with_panda/daily-leaderboard-2018-07-20.csv'

#put it into the dataFrame
df = pd.read_csv(file_address)

#set the index
df.set_index('name', inplace=True)

#Save it into a new CSV file
df.to_csv('newFile.csv')
#print(df.head())

#make it a new dataFrame or basically re-design the dataFrame
#df = pd.read_csv('/home/ramin/Desktop/git___workspace/python_with_pandas/newFile.csv')
df = pd.read_csv('/home/ramin/git_workspace/python_with_panda/newFile.csv')


# we can also set the index at the time of reading the CSV file
df = pd.read_csv(file_address, index_col = 'max_max_position_concentration')
print(df.head(125))
#print(df.columns.values)
df.to_html('newHTML.html')












