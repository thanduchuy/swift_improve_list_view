//
//  ListRepository.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 12/7/25.
//

import Foundation
import Combine

protocol ListRepository {
    func getCompanies() -> AnyPublisher<[Company], Error>
    func getUsers() -> AnyPublisher<[User], Error>
    func getCustomers() -> AnyPublisher<[Customer], Error>
}
