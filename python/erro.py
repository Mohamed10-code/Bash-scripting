

# This code tries x and if it fails x it will try  ValueErro (and it calls error handling)
try:
    x = int(input("what is x: "))
except ValueErro:
    print("x is integer ")
else:
    print(f"x is {x}")
