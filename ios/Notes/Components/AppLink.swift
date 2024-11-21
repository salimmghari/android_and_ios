import SwiftUI

struct AppLink: View {
    var title: String
    var onClick: () -> Void
        
    init(
        title: String,
        onClick: @escaping () -> Void
    ) {
        self.title = title
        self.onClick = onClick
    }

    var body: some View {
        Text(self.title)
            .fontWeight(
                .light
            )
            .foregroundColor(Color("InfoColor"))
            .padding()
            .onTapGesture {
                self.onClick()
            }
    }
}
