//
//  DialogFlowResult.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 20/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

struct DialogFlowResult: Codable {
    var action: String?
    var actionIncomplete: Bool?
    var speech: String?
    var contexts: [DialogFlowContext?]?
}
