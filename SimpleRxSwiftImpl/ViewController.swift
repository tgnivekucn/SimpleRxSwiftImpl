//
//  ViewController.swift
//  SimpleRxSwiftImpl
//
//  Created by SomnicsAndrew on 2024/1/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let observable = Observable<Int>()
        let observer = Observer<Int> { event in
            switch event {
            case .next(let val):
                print("got next event, val is: \(val)")
            case .error(let error):
                print("got error event, error is: \(error)")
            case .completed:
                print("got completed event")
            }
        }
        
        observable.subscribe(observer: observer)
        observable.onNext(val: 1)
        observable.onNext(val: 2)
        observable.onCompleted()
        
        observable.subscribe(onNext: { val in
            print("got next event, val is: \(val)")
        }, onError: { error in
            print("got error event, error is: \(error)")
        }, onCompleted: {
            print("got completed event")
        })
        
        observable.onNext(val: 5)
        observable.onNext(val: 6)
        observable.onCompleted()
    }
}

