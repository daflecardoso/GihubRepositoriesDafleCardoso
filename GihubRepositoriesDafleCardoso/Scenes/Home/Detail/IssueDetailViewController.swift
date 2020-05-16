//
//  IssueDetailViewController.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import UIKit

class IssueDetailViewController: BaseViewController {
    
    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var issueDescriptionLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var issueDateLabel: UILabel!
    @IBOutlet weak var seeOnWebButton: UIButton!
    
    override var baseViewModel: BaseViewModelContract? {
        return self.viewModel
    }
    
    private let viewModel: IssueDetailViewModel
    
    init(viewModel: IssueDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        let issue = self.viewModel.issue
        self.issueTitleLabel.text = issue.title
        self.issueDescriptionLabel.text = issue.body
        self.userImageView.loadFrom(url: issue.user.avatarUrl)
        self.issueDateLabel.text = issue.dateFormatted
        self.seeOnWebButton
            .rx
            .tap
            .bind { [unowned self] in
                guard let url = URL(string: issue.issueURL) else {
                    return
                }
                self.present(self.coordinator.makeIssueWebViewController(url: url))
        }.disposed(by: disposeBag)
    }
}
