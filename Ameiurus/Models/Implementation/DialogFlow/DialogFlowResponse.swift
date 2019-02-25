//
//  DialogFlowResponse.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 20/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

struct DialogFlowResponse: Codable {
    var id: String
    var lang: String
    var result: DialogFlowResult?
    var resolvedQuery: String?
    var score: Int?
    var source: String?
    var sessionId: String
    var status: DialogFlowStatus?
    var timestamp: String
}
