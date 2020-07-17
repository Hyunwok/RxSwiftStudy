import UIKit
import RxSwift

let disposeBag = DisposeBag()

let array = [1,2,3,4,5,6,7,8,9,10]

Observable.from(array)
    
    .filter { $0 > 5 }
    .subscribe { print($0) }
    .disposed(by: disposeBag)
