import SwiftUI

struct Todo: View {
    var value: String
    var onChange: (String) -> Void
    var onClick: () -> Void
    var new: Bool
    
    init(
        value: String,
        onChange: @escaping (String) -> Void,
        onClick: @escaping () -> Void,
        new: Bool = false
    ) {
        self.value = value
        self.onChange = onChange
        self.onClick = onClick
        self.new = new
    }
    
    var body: some View {
        HStack() {
            AppField(
                value: self.value,
                placeholder: "Todo",
                onChange: { value in
                    self.onChange(value)
                }
            )
            if self.new {
                AppButton(
                    icon: "plus.circle.fill",
                    color: Color("SuccessColor"),
                    onClick: self.onClick
                )
            } else {
                AppButton(
                    icon: "trash.fill",
                    color: Color("DangerColor"),
                    onClick: self.onClick
                )
            }
        }
        .padding()
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
