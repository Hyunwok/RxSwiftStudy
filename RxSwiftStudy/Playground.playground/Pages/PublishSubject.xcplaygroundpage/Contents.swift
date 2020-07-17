import UIKit
import RxSwift

enum MyError: Error {
    case error
}
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("전달되지 않을 onNext")

let ob1 = subject.subscribe { print("지금부터 구독 시작", $0)}
ob1.disposed(by: disposeBag)

subject.onNext("PublishSubject는 subscribe 전에 onNext는 전달해주지 않음, 구독 이후에 것만 전달해줌")

//subject.onCompleted()
subject.onError(MyError.error)

let ob2 = subject.subscribe {print("2번째 옵저버로 completed 이후에는 onNext 불가")}
ob2.disposed(by: disposeBag)


