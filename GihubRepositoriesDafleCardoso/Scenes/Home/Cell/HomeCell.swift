//
//  HomeCell.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func set(with item: GithubIssue) {
        self.issueTitleLabel.text = item.title
        self.statusLabel.text = item.state.description
    }
}
