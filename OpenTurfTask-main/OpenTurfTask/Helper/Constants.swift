

import Foundation
import UIKit
import SwiftUI




let baseURL = "http://sjdev.salesjump.in/server/native_Db_V13.php"
let JSON_CONVERSION_ERROR = "Json conversion error found."
let DEVICE = UIDevice.current.model.uppercased()


let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height


func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}
