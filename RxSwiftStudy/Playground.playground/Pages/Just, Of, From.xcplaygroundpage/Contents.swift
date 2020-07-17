import UIKit
import RxSwift

let disposeBag = DisposeBag()

// Just, 하나의 값만 그대로 방출하고 싶을 때
Observable.just("😀")
    .subscribe { print($0) }
    .disposed(by: disposeBag)


let orange = "🍊"
let apple = "🍎"
let coconut = "🥥"
let cherry = "🍒"

// Of, 2개 이상 요소 그대로 방출
Observable.of(orange, apple, coconut)
    .subscribe {print($0)}
    .disposed(by: disposeBag)

Observable.of([1,2], [3,4], [5,6]) // 배열 안 숫자마저도 하나씩 빼고 싶을 때 from 사용
.subscribe {print($0)}
.disposed(by: disposeBag)

// From, 배열의 값을 각각으로 방출하고 싶을 때
Observable.from([apple, orange, cherry, coconut])
.subscribe {print($0)}
.disposed(by: disposeBag)
