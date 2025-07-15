//
//  ListRepositoryImpl.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 12/7/25.
//

import Foundation
import Combine
import Factory
import APIService

final class ListRepositoryImpl: ListRepository {
    func getCompanies() -> AnyPublisher<[Company], Error> {
        APIServices.default
            .request(ListEndpoint.companies)
            .data(type: [Company].self)
            .eraseToAnyPublisher()
    }
    
    func getUsers() -> AnyPublisher<[User], Error> {
        APIServices.default
            .request(ListEndpoint.users)
            .data(type: [User].self)
            .eraseToAnyPublisher()
    }
    
    func getCustomers() -> AnyPublisher<[Customer], Error> {
        APIServices.default
            .request(ListEndpoint.customers)
            .data(type: [Customer].self)
            .eraseToAnyPublisher()
    }
}

extension Container {
    var listRepository: Factory<ListRepository> {
        Factory(self) {
            ListRepositoryImpl()
        }
    }
}
