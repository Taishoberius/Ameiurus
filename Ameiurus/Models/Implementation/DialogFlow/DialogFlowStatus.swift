//
//  DialogFlowStatus.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 20/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

struct DialogFlowStatus: Codable {
    var code: Int?
    var errorDetails: String?
    var errorType: String?
}
