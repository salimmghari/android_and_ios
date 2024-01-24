import SwiftUI

struct AppField: View {
    var label: String
    @State private var value: String
    var placeholder: String
    var onChange: (String) -> Void
    var multiLines: Bool

    init(
        label: String,
        value: String,
        placeholder: String,
        onChange: @escaping (String) -> Void,
        multiLines: Bool = false
    ) {
        self.label = label
        self._value = State(
            initialValue: value
        )
        self.placeholder = placeholder
        self.onChange = onChange
        self.multiLines = multiLines
    }
    
    var body: some View {
        VStack () {
            Text(self.label)
                .foregroundColor(Color("PrimaryColor"))
                .padding(
                    .vertical,
                    8
                )
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            if self.multiLines {
                ZStack(
                    alignment: .topLeading
                ) {
                    TextEditor(
                        text: $value
                    )
                        .frame(
                            minHeight: 200.0,
                            maxHeight: 200.0
                        )
                        .padding()
                        .background(Color("SecondaryColor"))
                        .foregroundColor(Color("PrimaryColor"))
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
                        .onChange(of: value) { newValue in
                            self.onChange(newValue)
                        }
                    if value.isEmpty {
                        Text(self.placeholder)
                            .foregroundColor(Color.gray)
                            .padding()
                            .padding(
                                .top,
                                8
                            )
                            .padding(
                                .leading,
                                5
                            )
                    }
                }
            } else {
                TextField(
                    self.placeholder,
                    text: $value,
                    onEditingChanged: { _ in
                        self.onChange(value)
                    }
                )
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding()
                    .background(Color("SecondaryColor"))
                    .foregroundColor(Color("PrimaryColor"))
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
        
    }
}
