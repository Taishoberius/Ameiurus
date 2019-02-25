//
//  Endpoint.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 07/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation
import Alamofire

public protocol Endpoint {
    var url: String { get set }
    var parameters: JSONModel { get set }
    var method: HTTPMethod { get set }
}
