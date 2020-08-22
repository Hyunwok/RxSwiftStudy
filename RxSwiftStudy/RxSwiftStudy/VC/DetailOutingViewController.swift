import UIKit
import RxSwift
import TextFieldEffects


class DetailOutingViewController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var textField: IsaoTextField!
    @IBOutlet weak var reasonTextField: IsaoTextField!
    @IBOutlet weak var timeTextField: IsaoTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "외출 신청"

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisa(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)        
    }

}
