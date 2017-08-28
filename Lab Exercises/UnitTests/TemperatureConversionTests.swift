import XCTest
@testable import Lab_Exercises

func foobar() -> () {
    print("Foobar!")
}

fileprivate typealias Foo = Int

class TemperatureConversionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        print()
    }
    
    override func tearDown() {
        print()
        super.tearDown()
    }

    func testFoo() {
        let foo: Foo = 1
        print(foo)
        print("Foo!")
        foobar()
    }
    
    func testBar() {
        print("Bar!")
    }
}
