//
//  ListUseCase.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 12/7/25.
//

import Combine
import Factory

protocol ListUseCaseType {
    func getCompanies() -> AnyPublisher<[Company], Error>
    func getCustomers() -> AnyPublisher<[Customer], Error>
    func getUsers() -> AnyPublisher<[User], Error>
}

struct ListUseCase: ListUseCaseType {
    @Injected(\.listRepository) var listRepository
    
    
    func getCompanies() -> AnyPublisher<[Company], Error> {
        listRepository.getCompanies()
    }
    
    func getCustomers() -> AnyPublisher<[Customer], Error> {
        listRepository.getCustomers()
    }
    
    func getUsers() -> AnyPublisher<[User], Error> {
        listRepository.getUsers()
    }
}

extension Container {
    var listUseCase: Factory<ListUseCaseType> {
        Factory(self) {
            ListUseCase()
        }
    }
}
