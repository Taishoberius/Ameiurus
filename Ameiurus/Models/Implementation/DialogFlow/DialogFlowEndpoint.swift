//
//  DialogFlowEndpoint.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 07/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation
import Alamofire

struct DialogFlowEndpoint: Endpoint {
    var parameters: JSONModel
    var method: HTTPMethod
    var url: String
}
