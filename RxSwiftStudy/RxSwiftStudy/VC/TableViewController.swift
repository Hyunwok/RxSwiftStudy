import RxSwift
import UIKit
import RxCocoa

class TableViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let personArray = [
        Person(name: "양재훈", age: 17),
        Person(name: "정유일", age: 17),
        Person(name: "건웅킹", age: 33),
        Person(name: "성희티쳐", age: 30),
        Person(name: "윤지훈", age: 17),
        Person(name: "승호형님", age: 18)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let observable : Observable<[Person]> = Observable.just(personArray)
        observable.bind(to: tableView.rx.items(cellIdentifier: "cell")) { _, person, cell in
            if let cellToUse = cell as? TableViewCell {
                cellToUse.lbl1?.text = person.name
                cellToUse.lbl2?.text = "\(person.age)"
            }
        }.disposed(by: disposeBag)
    }
}


extension TableViewController {
    struct Person {
        let name: String
        let age: Int
    }
}
