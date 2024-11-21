import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: Int
    var username: String
    var password: String
    var passwordConfirmation: String
    var created_at: String
    var updated_at: String
}

struct Token: Codable {
    var token: String
}

class UserManager {
    func signup() -> Void {}
    
    func login() -> Void {}
    
    func logout() -> Void {}
}
