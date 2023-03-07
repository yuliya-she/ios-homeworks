//
//  ProfileViewController.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    // MARK: - Lifecycle
    
    override func viewWillLayoutSubviews () {
        self.view.addSubview(self.profileHeaderView)
        profileHeaderView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    //MARK: - Constraints
    
    func setupUI() {
        view.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
}
