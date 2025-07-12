//
//  ViewModelType.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine

public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output
}

extension ViewModel {
    public func checkIfDataIsEmpty<T: Collection>(trigger: Driver<Bool>, items: Driver<T>) -> Driver<Bool> {
        return Publishers
            .CombineLatest(trigger, items)
            .map { loading, items -> Bool in
                if loading { return false }
                return items.isEmpty
            }
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}
