
# i ask the user to input name and if the name matches "farah" the program stops else it keep asking for a name
# i did this with the while loops 



def main():
    user_input = str(input("guess the name? "))

    if user_input == "farah":
         print("The name has been found: and it's", user_input)
    else:
         print("Try again")


    while user_input != "farah":
        main()
        break

main()



