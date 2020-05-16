//
//  HomeViewController.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override var baseViewModel: BaseViewModelContract? {
        return self.viewModel
    }
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel.fetch()
    }
    
    private func setup() {
        self.setupTableView()
    }
    
    func setupTableView() {
        self.title = "Swift issues"
        self.tableView.register(cellType: HomeCell.self)
        self.viewModel
            .issues
            .drive(self.tableView.rx.items(cellIdentifier: HomeCell.className,
                                           cellType: HomeCell.self)) { _, item, cell in
                                            cell.set(with: item)
        }.disposed(by: disposeBag)
        
        Observable.zip(self.tableView.rx.modelSelected(GithubIssue.self),
                       self.tableView.rx.itemSelected)
            .subscribe(onNext: { [unowned self] issue, indexPath in
                self.tableView.deselectRow(at: indexPath, animated: true)
                self.push(self.coordinator.makeIssueDetailViewController(issue: issue))
            }).disposed(by: disposeBag)
    }
}
