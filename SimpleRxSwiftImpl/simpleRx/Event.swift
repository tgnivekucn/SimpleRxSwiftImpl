//
//  Event.swift
//  SimpleRxSwiftImpl
//
//  Created by SomnicsAndrew on 2024/1/10.
//

import Foundation

enum Event<Element> {
    case next(Element)
    case error(Error)
    case completed
}
