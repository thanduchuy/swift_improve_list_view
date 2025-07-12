//
//  Combine+.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine
import Foundation

public typealias Driver<T> = AnyPublisher<T, Never>
public typealias Observable<T> = AnyPublisher<T, Error>
public typealias PublishRelay<T> = PassthroughSubject<T, Never>
public typealias BehaviorRelay<T> = CurrentValueSubject<T, Never>

// MARK: - Driver

public extension Publisher {
    func asDriver() -> Driver<Output> {
        return self.catch { _ in Empty() }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    static func just(_ output: Output) -> Driver<Output> {
        return Just(output).eraseToAnyPublisher()
    }

    static func empty() -> Driver<Output> {
        return Empty().eraseToAnyPublisher()
    }

    func asDriverUnscheduled() -> Driver<Output> {
        self.catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
}

// MARK: - Observable

public extension Publisher {
    func asObservable() -> Observable<Output> {
        mapError { $0 }
            .eraseToAnyPublisher()
    }

    static func just(_ output: Output) -> Observable<Output> {
        Just(output)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    static func empty() -> Observable<Output> {
        return Empty().eraseToAnyPublisher()
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
            .asObservable()
    }

    func withLatestFrom<Other: Publisher, Result>(_ other: Other,
                                                  resultSelector: @escaping (Output, Other.Output) -> Result)
        -> AnyPublisher<Result, Failure> where Other.Failure == Failure {
        let upstream = share()

        return other
            .map { second in upstream.map { resultSelector($0, second) } }
            .switchToLatest()
            .zip(upstream)
            .map(\.0)
            .eraseToAnyPublisher()
    }
}
