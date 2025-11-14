#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void init_board(char board[3][3]);
void print_board(char board[3][3]);
int make_move(char board[3][3], int pos, char mark);
int check_winner(char board[3][3]); 
int is_draw(char board[3][3]);
void clear_input_line(void);

int main(void) {
    char board[3][3];
    int current_player = 1; 
    char marks[3] = {' ', 'X', 'O'};
    int pos;
    int result;
    char play_again = 'Y';

    while (toupper(play_again) == 'Y') {
        init_board(board);
        current_player = 1;
        result = 0;

        while (1) {
            print_board(board);
            printf("Player %d (%c), enter position (1-9): ", current_player, marks[current_player]);

            if (scanf("%d", &pos) != 1) {
                printf("Invalid input. Please enter a number 1-9.\n");
                clear_input_line();
                continue;
            }
            clear_input_line();

            if (pos < 1 || pos > 9) {
                printf("Position must be between 1 and 9.\n");
                continue;
            }

            if (!make_move(board, pos, marks[current_player])) {
                printf("Position %d is already taken. Try a different one.\n", pos);
                continue;
            }
            if (check_winner(board)) {
                print_board(board);
                printf("Player %d (%c) wins! Congratulations!\n", current_player, marks[current_player]);
                break;
            }
            if (is_draw(board)) {
                print_board(board);
                printf("It's a draw!\n");
                break;
            }
            current_player = (current_player == 1) ? 2 : 1;
        }
        printf("Play again? (Y/N): ");
        if (scanf(" %c", &play_again) != 1) {
            play_again = 'N';
        }
        clear_input_line();
    }

    printf("Thanks for playing!\n");
    return 0;
}
void init_board(char board[3][3]) {
    int r, c, n = 1;
    for (r = 0; r < 3; ++r) {
        for (c = 0; c < 3; ++c) {
            board[r][c] = '0' + n; 
            ++n;
        }
    }
}
void print_board(char board[3][3]) {
    puts("");
    printf(" %c | %c | %c\n", board[0][0], board[0][1], board[0][2]);
    printf("---+---+---\n");
    printf(" %c | %c | %c\n", board[1][0], board[1][1], board[1][2]);
    printf("---+---+---\n");
    printf(" %c | %c | %c\n", board[2][0], board[2][1], board[2][2]);
    puts("");
}
int make_move(char board[3][3], int pos, char mark) {
    int row = (pos - 1) / 3;
    int col = (pos - 1) % 3;
    if (board[row][col] == 'X' || board[row][col] == 'O') {
        return 0;
    }

    board[row][col] = mark;
    return 1;
}
int check_winner(char board[3][3]) {
    int i;
    for (i = 0; i < 3; ++i) {
        if (board[i][0] == board[i][1] && board[i][1] == board[i][2])
            return 1;
    }
    for (i = 0; i < 3; ++i) {
        if (board[0][i] == board[1][i] && board[1][i] == board[2][i])
            return 1;
    }
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2])
        return 1;
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0])
        return 1;

    return 0;
}
int is_draw(char board[3][3]) {
    int r, c;
    for (r = 0; r < 3; ++r)
        for (c = 0; c < 3; ++c)
            if (board[r][c] != 'X' && board[r][c] != 'O')
                return 0;
    return 1;
}
void clear_input_line(void) {
    int ch;
    while ((ch = getchar()) != '\n' && ch != EOF) { }
}
