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
}
