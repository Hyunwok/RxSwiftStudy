
//: A UIKit based Playground for presenting user interface

import UIKit
import RxSwift

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("전달되지 않을 onNext")

let ob1 = subject.subscribe { print("지금부터 구독 시작", $0)}
ob1.disposed(by: disposeBag)

subject.onNext("PublishSubject는 subscribe 전에 onNext는 전달해주지 않음, 구독 이후에 것만 전달해줌")
