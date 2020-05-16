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
    
    private let enabledMock = ProcessInfo.processInfo.arguments.contains("UITest")
    
    init() {
        let configuration = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let plugin = NetworkLoggerPlugin(configuration: configuration)
        if self.enabledMock {
            super.init(stubClosure: MoyaProvider.delayedStub(0.1), plugins: [plugin])
        } else {
            super.init(plugins: [plugin])
        }
    }
}
