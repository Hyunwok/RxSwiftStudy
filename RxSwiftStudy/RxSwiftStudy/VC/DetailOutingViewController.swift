import UIKit
import DLRadioButton
import TextFieldEffects


class DetailOutingViewController: UIViewController, UITextFieldDelegate {
    
    let text = IsaoTextField(frame: CGRect(x: 100, y: 300, width: 100, height: 40))
    
    
    
    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet var asdasd: DLRadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "외출 신청"
        self.view.addSubview(text)
        text.activeColor = .cyan
        text.inactiveColor = .gray
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisa(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        if textField.isSelected {
            textField.textColor = .brown
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .cyan
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.textColor = .gray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
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
import Foundation
import UIKit

class CustomTextField: UITextField{
    var change: Bool = false {
        didSet {
            textColor = change ? .yellow : .black
            backgroundColor = change ? .blue : .white
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //Border
        self.layer.cornerRadius = 15.0;
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        
        //Background
        self.backgroundColor = UIColor(white: 1, alpha: 0.0)
        
        //Text
        self.textColor = UIColor.white
        self.textAlignment = NSTextAlignment.center
    }
    
}
