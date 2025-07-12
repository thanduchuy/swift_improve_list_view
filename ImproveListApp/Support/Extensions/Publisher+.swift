//
//  Publisher+.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine

extension Publisher {
    public func sink() -> AnyCancellable {
        return self.sink(receiveCompletion: { _ in }, receiveValue: { _ in })
    }
    
    public func sink(_ handler: @escaping (Output) -> Void, cancelBag: CancelBag) {
        return self.sink(receiveCompletion: { _ in }, receiveValue: handler).store(in: cancelBag)
    }
}
