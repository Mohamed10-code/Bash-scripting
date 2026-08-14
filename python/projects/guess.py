import random 


guess_the_number = random.randint(1, 50)

while True: 
    try:
        guess = int(input("Guess the numner: "))

        if guess < guess_the_number:
            print("To low ◢  " )
        elif guess > guess_the_number:
            print("To hight ⚡️")
        else:
            print("congratulations you have guess the numner: 🎂")
            break 
    except ValueError:
        print("Please enter Numner 💔")
