import SwiftUI

struct AppButton: View {
    var icon: String
    var color: Color
    var onClick: () -> Void
        
    init(
        icon: String,
        color: Color,
        onClick: @escaping () -> Void
    ) {
        self.icon = icon
        self.color = color
        self.onClick = onClick
    }
    
    var body: some View {
        Button(
            action: self.onClick
        ) {
            Image(
                systemName: self.icon
            )
        }
        .padding()
        .foregroundColor(Color("SecondaryColor"))
        .background(self.color)
        .cornerRadius(50)
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
