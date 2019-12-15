""" Tic - Tac - Toe! WORKING!!!!!!!!!!! """
#two player version
game_board = ["-","-","-",
              "-","-","-",
              "-","-","-"]

def display_board():
	print(game_board[0] + " | " + game_board[1] + " | " + game_board[2])
	print(game_board[3] + " | " + game_board[4] + " | " + game_board[5])
	print(game_board[6] + " | " + game_board[7] + " | " + game_board[8])              
z=1

def check():
	global z
	x=0
	for symbol in game_board:
		if symbol != "-":
			x = x+1
	if x==9:
		print("It is A Tie")
		z=0	

	if game_board[0] == game_board[1] and game_board[0]==game_board[2] and game_board[2]!="-":
		print("Game Over!")
		z=0
	if game_board[3] == game_board[4] and game_board[3]==game_board[5] and game_board[5]!="-":
		print("Game Over!")
		z=0
	if game_board[6] == game_board[7] and game_board[6]==game_board[8] and game_board[8]!="-":
		print("Game Over!")	
		z=0

	if game_board[0] == game_board[3] and game_board[0]==game_board[6] and game_board[6]!="-":
		print("Game Over!")
		z=0	
	if game_board[1] == game_board[4] and game_board[1]==game_board[7] and game_board[7]!="-":
		print("Game Over!")
		z=0
	if game_board[2] == game_board[5] and game_board[2]==game_board[8] and game_board[8]!="-":
		print("Game Over!")	
		z=0	

	if game_board[0] == game_board[4] and game_board[0]==game_board[8] and game_board[8]!="-":
		print("Game Over!")
		z=0
	if game_board[2] == game_board[4] and game_board[2]==game_board[6] and game_board[6]!="-":
		print("Game Over!")
		z=0
		



player1_symbol = input("Which symbol does player1 want to use: ")
player2_symbol = input("Which symbol does player2 want to use: ")



def play():
	global z
	chance= "Player1"
	def change_turn():
		nonlocal chance
		if chance=="Player1":
			chance="Player2"
		elif chance=="Player2":
			chance="Player1"	

	while True:
		if z==0:
			break	
		display_board()
		position = input(chance+"! Choose a position between 1 and 9: ")
		position = int(position)
		index = position-1
	
		if chance== "Player1":
			game_board[index] = player1_symbol
		elif chance=="Player2":
			game_board[index] = player2_symbol
		check()		
		change_turn()
			
		


play()



