import random

def print_board(board):
    print()
    for i in range(3):
        print(" | ".join(board[i]))
        if i < 2:
            print("---------")
    print()

def check_winner(board, mark):
    for i in range(3):
        if all(board[i][j] == mark for j in range(3)):
            return True
        if all(board[j][i] == mark for j in range(3)):
            return True

    if all(board[i][i] == mark for i in range(3)):
        return True
    if all(board[i][2-i] == mark for i in range(3)):
        return True

    return False

def is_draw(board):
    return all(board[i][j] != " " for i in range(3) for j in range(3))

def ai_move(board):
    empty_cells = [(i, j) for i in range(3) for j in range(3) if board[i][j] == " "]
    return random.choice(empty_cells)

def play_game():
    board = [[" " for _ in range(3)] for _ in range(3)]
    print("Tic-Tac-Toe (You = X, Computer = O)\n")

    while True:
        print_board(board)
        try:
            pos = int(input("Enter position (1-9): "))
            if pos < 1 or pos > 9:
                print("Invalid! Enter 1–9.")
                continue
        except:
            print("Please enter a number.")
            continue

        row = (pos - 1) // 3
        col = (pos - 1) % 3

        if board[row][col] != " ":
            print("Already taken, choose another!")
            continue

        board[row][col] = "X"

        if check_winner(board, "X"):
            print_board(board)
            print("🎉 You win!")
            break

        if is_draw(board):
            print_board(board)
            print("It's a draw!")
            break
        print("\nComputer thinking...\n")
        r, c = ai_move(board)
        board[r][c] = "O"

        if check_winner(board, "O"):
            print_board(board)
            print("💻 Computer wins!")
            break
    print("\nGame Over!")
play_game()
