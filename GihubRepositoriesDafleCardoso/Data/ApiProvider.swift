//
//  ApiProvider.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import Moya

class ApiProvider<Target: TargetType>: MoyaProvider<Target> {
    
    init() {
        let configuration = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let plugin = NetworkLoggerPlugin(configuration: configuration)
        super.init(plugins: [plugin])
    }
    
    init(stub: Bool) {
        let configuration = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let plugin = NetworkLoggerPlugin(configuration: configuration)
        super.init(stubClosure: MoyaProvider.delayedStub(0.1), plugins: [plugin])
    }
}
