struct Counter:
    var count: Int

    fn __init__(inout self):
        self.count = 0

    fn __init__(inout self, start: Int):
        self.count = start

    fn __copyinit__(inout self, other: Counter):
        self.count = other.count

    fn __add__(self, other: Counter) -> Counter:
        return Counter(self.count + other.count)

    fn __iadd__(inout self, other: Counter):
        self = self + other


fn swap(inout one: Counter, inout two: Counter):
    let tmp = one
    one = two
    two = tmp

fn main():
    var c1 = Counter(42)
    var c2 = Counter(1)
    c1 += c2
    print(c1.count, c2.count)
    swap(c1, c2)
    print(c1.count, c2.count)