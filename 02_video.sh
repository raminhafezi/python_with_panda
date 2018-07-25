#!/usr/bin/env python
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import style
''' 
	we want to make a data into a dataFrame
'''

style.use('ggplot')

web_stats = {
	'Day' : [1, 2, 3, 4, 5, 6],
	'Visitors' : [44, 25, 56, 36, 12, 36],
	'Bounce_Rate' : [62, 56, 76, 23, 87, 77]
}

# convert to Data Frame
df = pd.DataFrame(web_stats)

#print(df.head())
#print(df.head(3))
#print(df.tail(2))


# This code make a new dataFrame and return it so you will lost 
#your index later
#print(df.set_index('Day'))

#the slution is to set df = df.set_index('Day')

#df = df.set_index('Day')
#print(df.head())

#another solution is to set index inplace for ever like this
#df.set_index('Day', inplace = True)
#print(df)

# you can see jsut one column by print(df['Visitoes']) or by df.Visitors
print(df.Visitors)
print(df[['Visitors', 'Bounce_Rate']])


# Finally we can conevrt a  column to a list by tolist()
my_list = [df['Visitors'].tolist()]
print(my_list)


# if we want to convert to array the output of the df['Visitor', 'Bouce_Rate']
# we have to import numpy and use the function of the numpy
import numpy as np
my_2d_array = np.array(df[['Visitors', 'Bounce_Rate']])
print(my_2d_array)


# It is a good idea to convert this 2d_array to a dataFrame and it is possible
df2 = pd.DataFrame (np.array(df[['Visitors', 'Bounce_Rate']]))
print(df2)

# ;))
