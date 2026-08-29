

# This code tries x and if it fails ValueErro (and it calls error handling)
try:
    x = int(input("what is x: "))
except ValueErro:
    print("x is integer ")
else:
    print(f"x is {x}")
