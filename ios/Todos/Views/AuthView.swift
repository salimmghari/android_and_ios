import SwiftUI

struct AuthView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            AppTitle(
                title: "Todos"
            )
            AppField(
                value: "",
                placeholder: "PIN",
                onChange: { value in
                    if value == "123456" {
                        self.presentationMode
                            .wrappedValue
                            .dismiss()
                    }
                }
            )
        }
        .padding()
    }
}
