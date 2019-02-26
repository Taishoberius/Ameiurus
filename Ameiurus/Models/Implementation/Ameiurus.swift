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
    public var onAsk: ((String, @escaping (BotResponse) -> Void) -> Void)?

    public init(api: Api, chatEndpoint: Endpoint) {
        self.api = api
        self.chatEndpoint = chatEndpoint
        self.apiType = .other
        self.onAsk = onAskFunction
    }

    public init(api: DialogFlowApi) {
        self.api = api
        self.chatEndpoint = api.queryEndpoint
        self.apiType = .dialogflow
        self.onAsk = onAskFunction
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

    private func onAskFunction(text: String, botResponse: @escaping (BotResponse) -> Void) {
        try! ask(text: text, response: {
            botResponse($0)
        })
    }
}

public enum AmeiurusError: Error {
    case invalidApiTypeError
}
