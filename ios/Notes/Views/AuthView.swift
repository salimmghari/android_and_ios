import SwiftUI

struct AuthView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    @State private var isNew: Bool = false

    func signup() -> Void {}

    func login() -> Void {}
        
    var body: some View {
        AppLayout() {
            if self.isNew {
                AppForm() {
                    AppTitle(
                        title: "Signup"
                    )
                    AppField(
                        label: "Username:",
                        value: self.newUsername,
                        placeholder: "Your username",
                        onChange: { value in
                            self.newUsername = value
                        }
                    )
                    AppField(
                        label: "Password:",
                        value: self.newPassword,
                        placeholder: "Your password",
                        onChange: { value in
                            self.newPassword = value
                        }
                    )
                    AppField(
                        label: "Confirm Password:",
                        value: self.confirmNewPassword,
                        placeholder: "Confirm your password",
                        onChange: { value in
                            self.confirmNewPassword = value
                        }
                    )
                    AppLink(
                        title: "Login?",
                        onClick: {
                            self.isNew = false
                        }
                    )
                    AppButton(
                        title: "Signup",
                        onClick: signup
                    )
                }
            } else {
                AppForm() {
                    AppTitle(
                        title: "Login"
                    )
                    AppField(
                        label: "Username:",
                        value: self.username,
                        placeholder: "Your username",
                        onChange: { value in
                            self.username = value
                        }
                    )
                    AppField(
                        label: "Password:",
                        value: self.password,
                        placeholder: "Your password",
                        onChange: { value in
                            self.password = value
                        }
                    )
                    AppLink(
                        title: "Signup?",
                        onClick: {
                            self.isNew = true
                        }
                    )
                    AppButton(
                        title: "Login",
                        onClick: login
                    )
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
