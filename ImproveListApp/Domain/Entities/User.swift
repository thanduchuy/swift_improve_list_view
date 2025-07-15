//
//  User.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 15/7/25.
//

import Foundation

struct User: Codable {
    let id: Int?
    let name: String?
    let company: String?
    let username: String?
    let email: String?
    let address: String?
    let zip: String
    let state: String?
    let country: String
    let phone: String?
    let photo: String?
}
