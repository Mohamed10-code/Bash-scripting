
name = input("what is your name: ")

match name:
    case "farah" | "koko":
        print("house-1")
    case "yare":
        print("house-2")
    case "dalka":
        print("house-3")
    case _:
        print("Where is your house")
