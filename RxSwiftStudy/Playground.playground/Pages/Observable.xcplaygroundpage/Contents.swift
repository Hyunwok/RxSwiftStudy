import UIKit
import RxSwift

let observer = Observable<Int>.create { (observer) in
    observer.on(.next($0)) // onNext를 두가지 형태로 보낼 수 있다
    observer.onNext(1)
    
    observer.onCompleted() // completed를 보내면 그 옵저버는 사라진다
    
    return Disposables.create()
}

Observable.from([0,1]) // 간단한 것들은 꼭 Create 만이 아닌 다른 것으로도 만들 수 있다
