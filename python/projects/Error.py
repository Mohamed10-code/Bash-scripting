
attempt = 0 
while True:

    try:
        x = int(input("what is x: "))
        break 
    except ValueError:
        attempt += 1 
        print("x is not interger: ")

print(f"You have attempted {attempt} times ")
print(f"x is {x}")
