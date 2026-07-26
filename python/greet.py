

def greet(first_name, last_name):
    print(f"Hi {first_name} {last_name}")
    print("welcome abroad")

greet("yare", "farah")



def greet(name):           
    print(f"from the second fucntion:.... {name}")    

greet("dalka")


def get_greeting(name):
    return f" {name}"

message = get_greeting(input("what is your name sir? ")).strip().title()
print(message)
