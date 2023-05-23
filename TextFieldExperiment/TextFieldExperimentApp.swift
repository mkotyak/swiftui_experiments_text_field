import SwiftUI

@main
struct TextFieldExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(manager: .init())
        }
    }
}
