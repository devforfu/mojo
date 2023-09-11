struct UniquePointer:
    var ptr: Int

    fn __init__(inout self, ptr: Int):
        self.ptr = ptr

    fn __moveinit__(inout self, owned existing: Self):
        self.ptr = existing.ptr

    fn __del__(owned self):
        self.ptr = 0


fn main():
    let p1 = UniquePointer(101)
    let p2 = p1^
    # this doesn't compile: the value was moved
    # print(p1.ptr)
    debug_assert(p2.ptr == 101, "unexpected moved value")