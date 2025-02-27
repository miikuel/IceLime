class UserInputError(Exception):
    pass

def validate_book(content):
    if int(content[3]) > 2024:
        raise UserInputError("This year hasn't come yet")
    if int(content[3]) < 0:
        raise UserInputError("You can't input a negative year")

    for i in range(3):
        if content[i] == "":
            raise UserInputError("You cannot have empty fields")

def validate_article(content):
    if int(content[4]) > 2024:
        raise UserInputError("This year hasn't come yet")
    if int(content[4]) < 0:
        raise UserInputError("You can't input a negative year")

    for i in range(4):
        if content[i] == "":
            raise UserInputError("You cannot have empty fields")

def validate_inproceeding(content):
    if int(content[4]) > 2024:
        raise UserInputError("This year hasn't come yet")
    if int(content[4]) < 0:
        raise UserInputError("You can't input a negative year")

    for i in range(4):
        if content[i] == "":
            raise UserInputError("You cannot have empty fields")

def validate_update(reference):
    if int(reference[3]) > 2024:
        raise UserInputError("This year hasn't come yet")
    if int(reference[3]) < 0:
        raise UserInputError("You can't input a negative year")

    for i in range(4):
        if reference[i] == "":
            raise UserInputError("You cannot have empty fields")
