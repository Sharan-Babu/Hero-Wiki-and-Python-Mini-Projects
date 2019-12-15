# WORKING!
# website : icanhazdadjoke.com
# get response and validate internet connection
# Take keyword
# return all jokes

import requests
jokeitem = input("You want a joke on? ")
information = requests.get(f"https://icanhazdadjoke.com/search?term={jokeitem}", headers= {"Accept":"application/json"})
connection = information.ok
if connection==False:
    print("OOps ensure internet connectivity")
else:    	
	result = information.json()
	l_no_of_jokes = result["results"]
	no_of_jokes = len(l_no_of_jokes)
	response=""
	if no_of_jokes==0:
		while no_of_jokes==0:
			response = input("TRy some other word(Type 'zzz' to quit): ")
			if response=="zzz":
				break
			else:	
			    information = requests.get(f"https://icanhazdadjoke.com/search?term={response}", headers= {"Accept":"application/json"})
			    result = information.json()
			    l_no_of_jokes = result["results"]
			    no_of_jokes = len(l_no_of_jokes)

	if response!="zzz":
		information = requests.get(f"https://icanhazdadjoke.com/search?term={response}", headers= {"Accept":"application/json"})
		l_no_of_jokes = result["results"]
		no_of_jokes = len(l_no_of_jokes)
		print(f"There are {no_of_jokes} joke/s available.\n")
		print(f"The {no_of_jokes} jokes are:\n")
		x=0
		for each_joke in l_no_of_jokes:
			print(l_no_of_jokes[x]['joke'])
			x+=1
