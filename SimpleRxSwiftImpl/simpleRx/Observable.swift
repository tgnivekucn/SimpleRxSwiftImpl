//
//  Observable.swift
//  SimpleRxSwiftImpl
//
//  Created by SomnicsAndrew on 2024/1/10.
//

import Foundation

class Observable<T> {
    private var observers: [Observer<T>] = []

    func subscribe(observer: Observer<T>) {
        observers.append(observer)
    }

    func subscribe(onNext: ((Event<T>) -> Void)? = nil,
                   onError: ((Event<Error>) -> Void)? = nil,
                   onCompleted: (() -> Void)? = nil) {
        let observer = Observer<T> { event in
            switch event {
            case .next(let val):
                print("next event, val: \(val)")
                break
            case .error(let error):
                print("error event, error: \(error)")
                break
            case .completed:
                print("completed event")
                break
            }
        }
        subscribe(observer: observer)
    }

    func onNext(val: T) {
        observers.forEach { $0.on(.next(val)) }
    }

    func onError(error: Error) {
        observers.forEach { $0.on(.error(error)) }
    }

    func onCompleted() {
        observers.forEach { $0.on(.completed) }
    }
}
