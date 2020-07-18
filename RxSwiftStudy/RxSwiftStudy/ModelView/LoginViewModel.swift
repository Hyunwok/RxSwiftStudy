import UIKit
import RxSwift

class LoginViewModel {
    let idPublishSubject = PublishSubject<String>()
    let pwPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable
            .combineLatest(idPublishSubject, pwPublishSubject.asObservable())
            .map { username, password in
                return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
