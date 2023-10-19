# Dependency Injection in Swift

Dependency injection (DI) is a software design pattern that implements Inversion of Control (IoC) for resolving dependencies. In the pattern, Injector helps your app split into loosely-coupled components, which can be developed, tested and maintained more easily. Injector is powered by the Swift generic type system and first class functions to define dependencies of your app simply and fluently.

## Requirements
- iOS 16.0+
- Xcode 15.0+
- Swift 5.0+

## Installation

### Swift Package Manager
in ```Package.swift``` add the following:

```
dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/Injector/SwiftInjector.git", from: "1.0.0")
],
targets: [
    .target(
        name: "MyProject",
        dependencies: [..., "SwiftInjector"]
    )
    ...
]
```

## Basic Usage

Implement different functionality for your dependency:

```
protocol YourDependencyProvider {
    func makeYourCall()
}

struct YourDependency: YourDependencyProvider {
    func makeYourCall() {
        // Do stuff
    }
}

struct YourDependencyMock: YourDependencyProvider {
    func makeYourCall() {
        // Do mock stuff
    }
}
```

Create a new key for our network provider to conform to this protocol. Do not forget to mark this definition as private to ensure the exposure while performing dependency injection.

```
private struct YourDependencyProviderKey: InjectionKey {
    static var currentValue: YourDependencyProvider = YourDependency()
}
```

We can do this as we’re going to expose the actual key path to use in the property wrapper using an extension on a new type called InjectedValues:


```
extension InjectedValues {
    var yourDependency: YourDependency {
        get { Self[YourDependencyProviderKey.self] }
        set { Self[YourDependencyProviderKey.self] = newValue }
    }
}
```

After configuring the new dependency injection solution, the final code looks as follows:

```
class NameOfYourClass {
    @Injected(\.yourDependency) var dependency: YourDependency
    
    func makeYourCall() {
        dependency.methodA()
    }
}
```

