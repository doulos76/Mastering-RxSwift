//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift

/*:
 # Observables
 */


//: ## Observable
//: - Observable, Observable Sequeence, Sequence 이라고 불림
//: - Event 전달 (Next, Error, Completed)
//: - Emisstion : Next Event 전달
//: - Notification : Error, Completed Event 전달
//: - Error event : error 발생시 전달
//: - Completed  event 전달 : 완료시 전달
//: Observer - Subscriber

//: ### Marble Diagram
//: 화살표는 시간의 흐름이고 각각의 원은 event
//: 완료시 (|)
//: 에러 발생시 (X)

// ----------(0)--------(1)-------(2)------------>
// ----------(0)--------(1)-------(2)-----|------>
// ----------(0)--------(1)-------(2)-----X------>

// #1 : create 연산자를 생성하여 Observable  생성

Observable<Int>.create { (observer) -> Disposable in
  observer.on(.next(0))
  observer.onNext(1)
  
  observer.onCompleted()
  return Disposables.create()
}

Observable<String>.create { (observer) -> Disposable in
  observer.on(.next("Hello"))
  observer.onNext("RxSwift")
  observer.onCompleted()
  return Disposables.create()
}

// #2 : 미리 정의된 규칙에 따라서 생성

let disposeBag = DisposeBag()

Observable.from([0, 1])
  .subscribe { print($0) }
  .disposed(by: disposeBag)
