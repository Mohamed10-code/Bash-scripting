

#This code show how you can use dict in python and for loop
students = {
    "harry": "house-1",
    "hermone": "house-2",
    "farah": "house-3",
    "ron": "house-4",

}


for student in students:
    print(student, students[student], sep=" | ")
