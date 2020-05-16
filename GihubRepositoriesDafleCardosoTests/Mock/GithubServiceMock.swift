//
//  GithubServiceMock.swift
//  GihubRepositoriesDafleCardosoTests
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import RxSwift
@testable import GihubRepositoriesDafleCardoso

class GithubServiceMock: GithubServiceContract {
    
    private let mockType: MockType
    
    init(with mockType: MockType) {
        self.mockType = mockType
    }
    
    func issues() -> Single<[GithubIssue]> {
        switch self.mockType {
        case .success:
            return Single.just([
                GithubIssue(id: 1,
                            number: 1234,
                            title: "Title",
                            body: "Description",
                            createdAt: Date(),
                            user: GithubUser(avatarUrl: "https://avatars3.githubusercontent.com/u/17835512?v=4"),
                            state: .open),
                GithubIssue(id: 2,
                            number: 1234,
                            title: "Title",
                            body: "Description",
                            createdAt: Date(),
                            user: GithubUser(avatarUrl: "https://avatars3.githubusercontent.com/u/17835512?v=4"),
                            state: .close)
            ])
        case .successWith(let jsonFile):
            let items: [GithubIssue]? = jsonFile.toObject()
            return Single.just(items ?? [])
        case .error:
            return Single.error(ServiceError.invalidResponse)
        case .empty:
            return Single.just([])
        }
    }
}
