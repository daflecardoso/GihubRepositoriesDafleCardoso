//
//  GithubIssue.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation

enum IssueState: String, Decodable {
    case open
    case close
    
    var description: String {
        switch self {
        case .open:
            return "ABERTO"
        case .close:
            return "FECHADO"
        }
    }
}

struct GithubIssue: Decodable {
    let id: Int
    let number: Int
    let title: String
    let body: String
    let createdAt: Date
    let user: GithubUser
    let state: IssueState
    
    enum CodingKeys: String, CodingKey {
        case id, title, body, user, state, number
        case createdAt = "created_at"
    }
    
    var dateFormatted: String {
        return self.createdAt.ddMMyyyyHHmmss()
    }
    
    var issueURL: String {
        return "https://github.com/apple/swift/pull/\(self.number)"
    }
}

struct GithubUser: Decodable {
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
