from memory.unsafe import Pointer

struct HeapArray:
    var data: Pointer[Int]
    var size: Int
    var cap: Int

    fn __init__(inout self):
        self.cap = 16
        self.size = 0
        self.data = Pointer[Int].alloc(self.cap)

    fn __init__(inout self, size: Int, val: Int):
        self.cap = size * 2
        self.size = size
        self.data = Pointer[Int].alloc(self.cap)
        for i in range(self.size):
            self.data.store(i, val)
    
    fn __copyinit__(inout self, arr: HeapArray):
        HeapArray.__init__(self, arr.size, arr.cap)
        for i in range(self.size):
            self.data.store(i, arr.data.load(i))

    fn __del__(owned self):
        self.data.free()

    fn dump(self):
        print_no_newline("[")
        for i in range(self.size):
            if i > 0:
                print_no_newline(", ")
            print_no_newline(self.data.load(i))
        print("]")


fn main():
    let a = HeapArray(3, 1)
    let b = a
    b.data.store(1, 999)
    a.dump()
    b.dump()
