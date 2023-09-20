# Dependency Injection in Swift

Dependency injection (DI) is a software design pattern that implements Inversion of Control (IoC) for resolving dependencies. In the pattern, Injector helps your app split into loosely-coupled components, which can be developed, tested and maintained more easily. Injector is powered by the Swift generic type system and first class functions to define dependencies of your app simply and fluently.

## Requirements
- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## Installation

### Swift Package Manager
in ```Package.swift``` add the following:

```
dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/Injector/Injector.git", from: "1.0.0")
],
targets: [
    .target(
        name: "MyProject",
        dependencies: [..., "Injector"]
    )
    ...
]
```

### Basic Usage

Create a new key for our network provider to conform to this protocol. Do not forget to mark this definition as private to ensure the exposure while performing dependency injection.
```
private struct YourDependencyProviderKey: InjectionKey {
    static var currentValue: YourDependencyProtocol = YourDependency()
}
```
We can do this as we’re going to expose the actual key path to use in the property wrapper using an extension on a new type called InjectedValues:

```
extension InjectedValues {
    var yourDependency: YourDependencyProtocol {
        get { Self[YourDependencyProviderKey.self] }
        set { Self[YourDependencyProviderKey.self] = newValue }
    }
}
```


