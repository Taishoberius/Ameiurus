//
//  DialogFlowApi.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 05/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation
import Alamofire

public struct DialogFlowApi: Api {
    public var endpoints: [String : Endpoint] = [:]
    public var baseUrl: String
    public var accessToken: String
    var version: DialogFlowVersion
    var lang: LanguageTag
    let sessionId = UUID().uuidString
    let queryEndpoint: DialogFlowEndpoint

    public init(version: DialogFlowVersion, accessToken: String, lang: LanguageTag) {
        self.accessToken = accessToken
        self.version = version
        self.baseUrl = "https://api.dialogflow.com/\(version.rawValue)/"
        self.lang = lang
        let query = DialogFlowQuery.init(lang: lang.rawValue, sessionId: sessionId, query: "")
        self.queryEndpoint = DialogFlowEndpoint.init(parameters: query, method: .post, url: "query")
    }

    public func call(endpoint: Endpoint, callback: @escaping (BotResponse) -> Void) {
        Alamofire.request(baseUrl + endpoint.url, method: endpoint.method, parameters: endpoint.parameters.toJson(), encoding: JSONEncoding.default, headers: ["Authorization" : "Bearer \(accessToken)"])
            .responseJSON { (response) in
                print(self.baseUrl + endpoint.url)
                switch response.result {
                case .failure(let error):
                    callback(BotResponse.init(type: .failure, response: error.localizedDescription))
                    break
                case .success:
                    guard let data = response.data else {
                        callback(BotResponse.init(type: .failure, response: "no data found"))
                        return
                    }
                    let decoder = JSONDecoder()
                    let obj = try! decoder.decode(DialogFlowResponse.self, from: data)
                    var res = obj.result?.speech ?? ""
                    if res == "" {
                        res = "🥴🤔"
                    }
                    callback(BotResponse.init(type: .success, response: res))
                    break
                }
        }
    }
}
