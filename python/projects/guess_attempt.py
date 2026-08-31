
import random

print("Hi! welcome to the number guessing. You have 7 chances to guess the number. let's start! ")

low = int(input("enter the lower bound: "))
high = int(input("enter the upper bound: "))

print(f"You have 7 chances to guess the number between {low} and  {high}. let's start! ")

num = random.randint(low, high)

#total allowed chances
ch = 7 
# Guess counter 
gc = 0

while gc < ch:
    gc += 1 
    guess = int(input("enter your guess: "))

    if guess == num:
        print(f"correct! the number is {num}. you guessed {gc} attempts. ")
        break 
    elif gc >= ch and guess != num:
        print(f"sorry! the number was {num}. Better luck next time. ")
    elif guess > num:
        print("Too high! try a lower number: ")
    elif guess < num:
        print("Too low! try a higher number: ")
