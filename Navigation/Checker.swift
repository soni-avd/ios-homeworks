
import UIKit

class Checker {
    
    static let shared = Checker()
    
    private let login = "Major Tom"
    private let password = "Password"

    private init() {}
    
    func checkLoginAndPassword(login: String, password: String) -> Bool {
        if login == self.login, password == self.password {
            return true
        } else {

            print("try again")
            return false
        }
    }

}
