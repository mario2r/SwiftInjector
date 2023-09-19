class DependencyManager {
    private let myDependency: MyDependency
    
    init() {
        self.myDependency = MyDependency()
        addDependencies()
    }
    
    private func addDependencies() {
        let resolver = Resolver.shared
        resolver.add(myDependency)
    }
}
