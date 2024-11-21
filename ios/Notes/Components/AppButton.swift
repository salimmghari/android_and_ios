import SwiftUI

struct AppButton: View {
    var title: String
    var color: Color
    var onClick: () -> Void
        
    init(
        title: String,
        color: Color = Color("PrimaryColor"),
        onClick: @escaping () -> Void
    ) {
        self.title = title
        self.color = color
        self.onClick = onClick
    }
    
    var body: some View {
        Button(
            action: self.onClick
        ) {
            Text(self.title)
                .foregroundColor(Color("SecondaryColor"))
        }
        .frame(
            maxWidth: .infinity
        )
        .padding()
        .background(self.color)
        .cornerRadius(6)
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
