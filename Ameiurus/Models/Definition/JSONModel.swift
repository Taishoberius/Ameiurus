//
//  JSONModel.swift
//  Ameiurus-melas
//
//  Created by David Linhares on 07/02/2019.
//  Copyright © 2019 David Linhares. All rights reserved.
//

import Foundation

public protocol JSONModel {
    func toJson() -> [String : Any]
}
