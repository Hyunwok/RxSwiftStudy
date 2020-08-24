import Foundation
import UIKit

extension UIViewController {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .cyan
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.textColor = .gray
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.textColor = .cyan
        return true
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillDisa(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
}
