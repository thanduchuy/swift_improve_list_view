//
//  Customer.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 15/7/25.
//

import Foundation

struct Address: Codable {
    let street: String?
    let city: String?
    let country: String?
    let zipcode: String?
}

struct Customer: Codable {
    let id: Int?
    let username: String?
    let password: String?
    let name: String?
    let email: String?
    let phone: String?
    let createdAt: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, username, password, name, email, phone
        case createdAt = "created_at"
    }
}
