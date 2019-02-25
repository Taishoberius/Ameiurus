//
//  BotResponse.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 07/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

public struct BotResponse {
    var type: BotResponseType
    var response: String

    enum BotResponseType {
        case success
        case failure
    }
}
