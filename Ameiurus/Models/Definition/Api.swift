//
//  Api.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 05/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation
import Alamofire

public protocol Api {
    var baseUrl: String { get set }
    var accessToken: String { get set }
    var endpoints: [String : Endpoint] { get set }
    func call(endpoint: Endpoint, callback: @escaping (BotResponse) -> Void)
}
