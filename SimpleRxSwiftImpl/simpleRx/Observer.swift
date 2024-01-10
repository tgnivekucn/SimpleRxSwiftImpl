//
//  Observer.swift
//  SimpleRxSwiftImpl
//
//  Created by SomnicsAndrew on 2024/1/10.
//

import Foundation

class Observer<T> {
    private var closure: ((Event<T>) -> Void)?

    init(closure: ((Event<T>) -> Void)? = nil) {
        self.closure = closure
    }
    
    func on(_ event: Event<T>) {
        self.closure?(event)
    }
}
