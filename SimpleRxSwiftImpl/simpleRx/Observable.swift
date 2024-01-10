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
