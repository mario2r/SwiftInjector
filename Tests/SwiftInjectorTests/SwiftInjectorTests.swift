import XCTest

@testable import SwiftInjector

final class SwiftInjectorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var dummyClass = DummyController()
        print(dummyClass.perform()) // prints: This is a demo

        InjectedValues[\.dummyProvider] = DummyProviderMock()
        print(dummyClass.perform()) // prints: This is a mock demo

        dummyClass.dummyProvider = DummyProvider()
        print(dummyClass.perform()) // prints: This is a demo
    }
}

// MARK: - Provider
protocol DummyProtocol {
    func dummy()
}

struct DummyProvider: DummyProtocol {
    func dummy() {
        print("This is a demo")
    }
}

struct DummyProviderMock: DummyProtocol {
    func dummy() {
        print("This is a mock demo")
    }
}

// MARK: - Injector
private struct DummyProviderKey: InjectionKey {
    static var currentValue: DummyProtocol = DummyProvider()
}

extension InjectedValues {
    var dummyProvider: DummyProtocol {
        get { Self[DummyProviderKey.self] }
        set { Self[DummyProviderKey.self] = newValue }
    }
}

// MARK: - MainClass
struct DummyController {
    @Injected(\.dummyProvider) var dummyProvider: DummyProtocol

    func perform() {
        dummyProvider.dummy()
    }
}
