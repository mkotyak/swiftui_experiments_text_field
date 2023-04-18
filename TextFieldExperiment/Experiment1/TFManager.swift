import Foundation

class TFManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > 15 && oldValue.count <= 15 {
                text = oldValue
            }
        }
    }
}

