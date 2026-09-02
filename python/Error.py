
def main():
    x = get_init()
    print(f"x is {x}")

def get_init():
    while True:

        try:
           return   int(input("what is x: "))
        except ValueError:
            pass
        # pass catches the error and just print nothing




main()
