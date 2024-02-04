#!/bin/bash
rows=20
columns=20
snakeX=10
snakeY=10
snakeDirection="right"
gameOver=false
snakeLength=1
score=0

# Initialize the board
for ((i=0; i<$rows; i++)); do
    for ((j=0; j<$columns; j++)); do
        if [ $i -eq $snakeY ] && [ $j -eq $snakeX ]; then
            echo -n "* "
        else
            echo -n ". "
        fi
    done
    echo
done


# Generate a random position for the food
foodX=$((RANDOM % columns))
foodY=$((RANDOM % rows))

# Update the position of the snake
snakeX=$((snakeX + 1))
snakeY=$((snakeY + 1))

# Main game loop
while [ $gameOver == false ]; do
    read -s -n 1 direction
    case "$direction" in
        "w" )
            if [ $snakeY -gt 0 ]; then
                snakeY=$((snakeY - 1))
            else
                gameOver=true
            fi
            ;;
        "s" )
            if [ $snakeY -lt $((rows - 1)) ]; then
                snakeY=$((snakeY + 1))
            else
                gameOver=true
            fi
            ;;
        "a" )
            if [ $snakeX -gt 0 ]; then
                snakeX=$((snakeX - 1))
            else
                gameOver=true
            fi
            ;;
        "d" )
            if [ $snakeX -lt $((columns - 1)) ]; then
                snakeX=$((snakeX + 1))
            else
                gameOver=true
            fi
            ;;
    esac
    # Check for food
    if [ $snakeX -eq $foodX ] && [ $snakeY -eq $foodY ]; then
        # длинна змеи и  набранные очки
        snakeLength=$((snakeLength + 1))
        foodX=$((RANDOM % columns))
        foodY=$((RANDOM % rows))
        #snakeLength=$((snakeLength + 1))
        score=$((score + 10))

    fi




    clear
    #Update the board
    for ((i=0; i<$rows; i++)); do
        for ((j=0; j<$columns; j++)); do
            if [ $i -eq $snakeY ] && [ $j -eq $snakeX ]; then
                for ((k=0; k<$snakeLength; k++)); do
                    echo -n "* "
                done
            elif [ $i -eq $foodY ] && [ $j -eq $foodX ]; then
                echo -n "F "
            else
                echo -n ". "
            fi
        done
        echo
    done
    
done
# Game over message and score display
clear
echo "Game Over! Score: $score"

