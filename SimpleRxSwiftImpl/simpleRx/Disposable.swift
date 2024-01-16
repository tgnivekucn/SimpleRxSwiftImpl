//
//  Disposable.swift
//  SimpleRxSwiftImpl
//
//  Created by SomnicsAndrew on 2024/1/16.
//

import Foundation

protocol Disposable {
    func dispose()
}

extension Disposable {
    public func disposed(by bag: DisposeBag) {
        bag.insert(self)
    }
}

class NopDisposable: Disposable {
    fileprivate static let noOp: Disposable = NopDisposable()
    func dispose() {}
}

class Disposables {
    func create() -> Disposable { NopDisposable.noOp }
}
