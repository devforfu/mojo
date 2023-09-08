struct Complex:
    var re: Float32
    var im: Float32

    fn __init__(inout self, x: Float32):
        self.re = x
        self.im = 0.0

    fn __init__(inout self, r: Float32, i: Float32):
        self.re = r
        self.im = i

    fn __add__(self, other: Complex) -> Complex:
        return Complex(self.re + other.re, self.im + other.im)

    fn __sub__(self, other: Complex) -> Complex:
        return Complex(self.re - other.re, self.im - other.im)

    fn print(self):
        print_no_newline("(")
        print_no_newline(self.re)
        print_no_newline(",", self.im)
        print_no_newline(")\n")


fn main():
    let c1 = Complex(1.)
    let c2 = Complex(-2, 3)
    let c3 = c1 + c2
    let c4 = c1 - c2
    c1.print()
    c2.print()
    c3.print()
    c4.print()
