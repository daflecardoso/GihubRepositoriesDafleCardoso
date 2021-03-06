//
//  CustomLoadingView.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import UIKit

class CustomLoadingView: UIView {
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        self.setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.layer.cornerRadius = 12
        
        let indicator = UIActivityIndicatorView()
        self.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        indicator.style = .whiteLarge
        self.addConstraints([
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
