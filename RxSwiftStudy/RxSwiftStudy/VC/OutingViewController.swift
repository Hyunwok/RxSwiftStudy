import UIKit
import RxSwift
import RxCocoa

class OutingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func pushToDetailOuting(_ sender: UIButton) {
        self.navigationController?.pushViewController((storyboard?.instantiateViewController(identifier: "DetailOuting"))!, animated: true)
    }
}
