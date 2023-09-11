fn division(a: Float32, b: Float32) raises -> Float32:
    if b == 0:
        raise Error("zero division")
    return a / b


fn main():
    let num = 1
    for value in range(3):
        print("dividing", num, "by", value)
        try:
            print(division(num, value))
        except e:
            print("  error:", e.value)
