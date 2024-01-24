import SwiftUI

struct AppTitle: View {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(self.title)
            .font(
                .title
            )
            .fontWeight(
                .bold
            )
            .foregroundColor(Color("PrimaryColor"))
            .padding()
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
    }
}
