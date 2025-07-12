//
//  ListEndpoint.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 12/7/25.
//

import Foundation
import APIService

enum ListEndpoint {
    case companies
}

extension ListEndpoint: Endpoint {
    var base: String? {
        "https://fake-json-api.mock.beeceptor.com"
    }
    
    var path: String? {
        switch self {
        case .companies:
            return "/companies"
        default:
            return ""
        }
    }
}
