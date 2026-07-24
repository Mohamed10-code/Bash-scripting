
#ask user for their name 

name = input("what is your name: ").strip().title()

# Remove whitespaces from str and capitalize user's name 

#name = name.strip().title()

# capitalize user's name

#name = name.capitalize()

# split name into first and last name   

first, last, = name.split(" ")

# title user's name mean first latters 

#name = name.title()

# say hello to the user

print(f"hello, {first}")
