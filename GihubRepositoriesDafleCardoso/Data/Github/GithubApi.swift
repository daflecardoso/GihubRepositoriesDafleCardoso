//
//  GithubApi.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 14/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import Moya

enum GithubApi {
    case issues
}

extension GithubApi: TargetType {
    
    var baseURL: URL {
        return Enviroment.baseUrl.url
    }
    
    var path: String {
        switch self {
        case .issues:
            return "/repos/apple/swift/issues"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .issues:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .issues:
            return Bundle.main.dataFromJsonFile(name: "mock_issues_response_sucess_moya")
        }
    }
    
    var task: Task {
        switch self {
        case .issues:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
