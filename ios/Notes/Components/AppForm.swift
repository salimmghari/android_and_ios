import SwiftUI

struct AppForm<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            content
        }
        .frame(
            maxWidth: .infinity
        )
        .padding()
        .background(Color("SecondaryColor"))
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(
                cornerRadius: 6
            )
                .stroke(
                    Color("PrimaryColor"),
                    lineWidth: 1
                )
        )
        .shadow(
            color: Color(
                .sRGB,
                red: 149/255,
                green: 157/255,
                blue: 165/255,
                opacity: 0.2
            ),
            radius: 10
        )
    }
}
