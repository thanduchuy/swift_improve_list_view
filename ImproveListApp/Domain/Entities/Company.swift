//
//  Company.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 12/7/25.
//

import Foundation

struct Company: Codable {
    let id: Int?
    let name: String?
    let address: String?
    let zip: String?
    let country: String?
    let employeeCount: Int?
    let industry: String
    let marketCap: Int?
    let domain: String
    let logo: String?
    let ceoName: String?
}
