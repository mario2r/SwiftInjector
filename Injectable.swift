protocol Injectable {}

struct Inject<T: Injectable> {
    let wrappedValue: T
}
