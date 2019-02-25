//
//  DialogFlowMetadata.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 20/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

struct DialogFlowMetadata: Codable {
    var intentId: String
    var intentName: String
    var webhookForSlotFillingUsed: String
    var webhookResponseTime: Int
    var webhookUsed: String
}
