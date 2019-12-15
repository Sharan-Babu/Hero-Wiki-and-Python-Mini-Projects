""" Hangman Game """
# WORKING FOR ALL CASES !!!!!! (Even if to_be_guessed_word has non-distinct letters).
to_be_guessed_word = "batbat"

to_be_guessed_list = []
for z in to_be_guessed_word:
	to_be_guessed_list.append(z)                   

word_progress = []
for x in range(len(to_be_guessed_word)):
	word_progress.append("*")

chances_left = 5

def check():
	letter_count =0
	global chances_left
	global to_be_guessed_word
	global to_be_guessed_list
	global word_progress
	
	letter = input("Which letter do you think is present in the word to be guessed: ")
	letter=letter.lower()
	
	if letter not in to_be_guessed_word:
		chances_left -= 1
		print("Oops, letter not present in word to be guessed")
	
	if chances_left==0:
		print("Game Over")	
		print("The correct answer was "+to_be_guessed_word)
	
	if letter in to_be_guessed_word:
		letter_count = to_be_guessed_list.count(letter)
		print(f"Yes, the letter is present {letter_count} times in the word to be guessed!")
		#word_progress = [d if d==letter else "*" for d in to_be_guessed_list]
		cracknum=0
		for d in to_be_guessed_list:
			if letter==d and word_progress[cracknum]!=letter:
				word_progress[cracknum] = letter
			cracknum+=1	

	print(word_progress)	


while chances_left !=0:
	if "*" not in word_progress:
		print("Correct! , The correct answer is "+to_be_guessed_word)
		break
	check()		





			


   