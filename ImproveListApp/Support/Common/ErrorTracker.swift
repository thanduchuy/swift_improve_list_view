//
//  ErrorTracker.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 12/7/25.
//

import Combine

public typealias ErrorTracker = PassthroughSubject<Error, Never>

extension Publisher {
    public func trackError(_ errorTracker: ErrorTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                errorTracker.send(error)
            }
        })
        .eraseToAnyPublisher()
    }
}
