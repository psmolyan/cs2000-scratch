#level intermediate

fruits = ["apple", "banana", "pear", "orange"]

#getting values from a list
fruits[1] # banana

#get all the fruits that are 5 letters or less
list(filter(lambda fruit: len(fruit) <= 5, fruits))

#convert all the fruits to uppercase
list(map(lambda f: f.upper(), fruits))

#data
@dataclass #this is called a decorator (the @symbol)
class Fruit:
    name : str
    color : str

apple = Fruit("apple", "red")

#excercises
int_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

list(map(lambda n: n * n, int_list))

def all_even(nums: list) -> list:
    """returns a lost of all words capitalized"""
    return list(filter(lambda n: n%2 == 0, nums))
all_even(int_list)

words_list = ["hello", "world", "python"]

def capitalize_all(words: list) -> list:
    """returns a list of all words capitalized"""
    return list(map(lambda word: word.upper(), words))
capitalize_all(words_list)

list(map(lambda word: len(word), words_list))

# says that map gives an iterator not a list, its items are worked out as they are read and can only be ready once

@dataclass
class Book:
    title : str
    author: str
    pages : int

