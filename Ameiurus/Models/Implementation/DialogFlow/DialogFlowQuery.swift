//
//  DialogFlowQuery.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 05/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

struct DialogFlowQuery: Codable, JSONModel {
    let lang: String
    let sessionId: String
    let query: String

    func toJson() -> [String : Any] {
        return [
            "lang": lang,
            "sessionId": sessionId,
            "query": query
        ]
    }
}
