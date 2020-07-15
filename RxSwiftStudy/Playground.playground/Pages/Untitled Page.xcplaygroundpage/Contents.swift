//: A UIKit based Playground for presenting user interface

import UIKit
import RxSwift


let a = Variable(1)
let b = Variable(2)

let c = Observable.combineLatest(a.asObservable(), b.asObservable()) { $0 + $1 }
    .filter{ $0 > 0 }
    .map { "\($0) is abc"}
c.subscribe(onNext: { print($0) })
