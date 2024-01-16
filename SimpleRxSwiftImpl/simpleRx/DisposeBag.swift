//
//  DisposeBag.swift
//  SimpleRxSwiftImpl
//
//  Created by SomnicsAndrew on 2024/1/16.
//

import Foundation

class DisposeBag {
    private var disposables = [Disposable]()

    func insert(_ disposable: Disposable) {
        self.disposables.append(disposable)
    }

    private func dispose() -> [Disposable] {
        let disposables = self.disposables
        self.disposables.removeAll(keepingCapacity: false)
        return disposables
    }

    deinit {
        self.dispose()
    }
}
