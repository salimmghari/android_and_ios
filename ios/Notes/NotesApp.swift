import SwiftUI

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

struct AppPreview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
