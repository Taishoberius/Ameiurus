//
//  Ameiurus.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 23/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

public class Ameiurus {
    public var api: Api
    public var chatEndpoint: Endpoint
    private var apiType: ApiType
    public var botUI: BotUI = BotUI()

    public init(api: Api, chatEndpoint: Endpoint) {
        self.api = api
        self.chatEndpoint = chatEndpoint
        self.apiType = .other
    }

    public init(api: DialogFlowApi) {
        self.api = api
        self.chatEndpoint = api.queryEndpoint
        self.apiType = .dialogflow
    }

    public func ask(model: JSONModel, response: @escaping (BotResponse) -> Void) {
        chatEndpoint.parameters = model
        api.call(endpoint: chatEndpoint) {
            response($0)
        }
    }

    public func ask(text: String, response: @escaping (BotResponse) -> Void) throws {
        guard
            apiType == .dialogflow,
            let api = api as? DialogFlowApi
        else {
            throw AmeiurusError.invalidApiTypeError
        }

        chatEndpoint.parameters = DialogFlowQuery(lang: api.lang.rawValue, sessionId: api.sessionId, query: text)
        api.call(endpoint: chatEndpoint) {
            response($0)
        }
    }

    public func instantiateBotChat() -> ChatViewController {
        return ChatViewController.instantiateBotChat(ameiurus: self)
    }
}

public enum AmeiurusError: Error {
    case invalidApiTypeError
}
