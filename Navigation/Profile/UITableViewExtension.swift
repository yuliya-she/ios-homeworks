//
//  UITableViewExtension.swift
//  Navigation
//
//  Created by мас on 31.03.23.
//

import Foundation
import UIKit

extension UITableView {
    func setAndLayout(headerView: ProfileHeaderView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UITableView.layoutFittingCompressedSize)
    }
}
