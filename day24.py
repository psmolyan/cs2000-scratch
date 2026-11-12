#level intermediate

print("hello world")

def gadget_cost(num_gadgets: int, label: str) -> float:
    """computes cost, at $0.50 per gadget plus $0.05 per character in label"""
    return num_gadgets * (0.50 + (len(label) * 0.05))

def greet(name: str) -> str:
    """produces Hello, name!"""
    return "Hello" + name + "!"
    
def age_message(name: str, age: num) -> str:
    """greeting with name and age"""
    return name + " is " + age + " years old"

def test_greeting() -> None:
    assert age_message("Polina", 18) == "Polina is 18 years old"

def shipping_cost(weight: int) -> int:
    """if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $2"""
    if weight <= 1:
        return 5
    elif weight <= 5:
        return 10
    else:
        return 12
        