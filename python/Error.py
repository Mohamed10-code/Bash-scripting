def main():
    x = get_int("what is x: ")
    print(f"x is {x}")
    
def get_int(prompt):  # prompt is just placeholder 
    while True:
        try:
                return  int(input(prompt))
                break
        except ValueError:
                pass
        # pass catches the error and just print nothing



main()
