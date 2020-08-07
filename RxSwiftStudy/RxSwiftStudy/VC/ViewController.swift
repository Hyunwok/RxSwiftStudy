import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let loginModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var loginIdTxtField: UITextField!
    @IBOutlet weak var loginPwTxtField: UITextField!
    @IBOutlet weak var enableLbl: UILabel!
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginIdTxtField.becomeFirstResponder()
        loginIdTxtField.rx.text.map { $0 ?? "" }.bind(to: loginModel.idPublishSubject).disposed(by: disposeBag)
        loginPwTxtField.rx.text.map { $0 ?? "" }.bind(to: loginModel.pwPublishSubject).disposed(by: disposeBag)
        
        loginModel.isValid().bind(to: LoginBtn.rx.isEnabled).disposed(by: disposeBag)
        loginModel.isValid().map{$0 ? 1 : 0.5}.bind(to: LoginBtn.rx.alpha).disposed(by: disposeBag)
        
        loginModel.isValid().subscribe(onNext:{ [weak self] text in
            self?.enableLbl.text = text ? "Able" : "Enable"
            self?.enableLbl.textColor = text ? .green : .red
        }).disposed(by: disposeBag)
    }
    
    @IBAction func getLogin(_ sender: UIButton) {
        print("tabbed")
    }
}

