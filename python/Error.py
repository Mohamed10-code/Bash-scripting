
def main():
    x = get_init()
    print(f"x is {x}")

def get_init():
    while True:

        try:
            x = int(input("what is x: "))
        except ValueError:
            print("x is not integer ")
        else:
            break 



main()
