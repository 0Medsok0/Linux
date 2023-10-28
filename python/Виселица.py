import random


list =  ['apple', 'ball', 'cat', 'dog', 'elephant', 'giraffe', 'house', 'tree', 'water', 'mountain', 'river', 'lake', 'cloud', 'sky', 'sun']
def quessed(word_list):  # выбирает случайное слово из списка
    quesses = ''
    word = random.choice(word_list)
    print('Подсказка: ваше слово состоит из '+str(len(word))+' букв. Введите ваши предположения.')
    while quesses != word: # Пока загаданное слово != 1 выбранному из списка
        print('Введите букву')
        quesses += input()
        count = 0
        for i in word:
            if i in quesses:
                count += 1
                print(f'Отгадали букв {count}')
        
        if count == len(word):
            print('Вы угадали это слово!')
            break

    
word = quessed(list) # вызов функции  


