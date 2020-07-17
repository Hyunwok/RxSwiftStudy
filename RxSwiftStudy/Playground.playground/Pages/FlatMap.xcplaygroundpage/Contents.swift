import UIKit
import RxSwift

let disposeBag = DisposeBag()

let a = PublishSubject(value: 1)
let b = PublishSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

subject
    .flatMap { $0.asObserver()}
    .subscribe { print($0)}
    .disposed(by: disposeBag)

subject.onNext(a)
subject.onNext(b)
