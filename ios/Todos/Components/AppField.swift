import SwiftUI

struct AppField: View {
    @State private var value: String
    var placeholder: String
    var onChange: (String) -> Void

    init(
        value: String,
        placeholder: String,
        onChange: @escaping (String) -> Void
    ) {
        self._value = State(
            initialValue: value
        )
        self.placeholder = placeholder
        self.onChange = onChange
    }
    
    var body: some View {
        TextField(
            self.placeholder,
            text: $value,
            onEditingChanged: { _ in
                self.onChange(value)
            }
        )
            .padding()
            .frame(
                maxWidth: .infinity
            )
            .background(Color("SecondaryColor"))
            .foregroundColor(Color("PrimaryColor"))
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
