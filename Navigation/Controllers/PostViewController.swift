//
//  PostViewController.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "SomeTitle"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        self.createNavItem()
    }
    
    //MARK: - Create Item
    
    private func createNavItem() {
        self.navigationItem.title = titlePost
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(buttonPressed(_:)))
    }
    
    //MARK: - Action
    
    @objc func buttonPressed(_ sender: UIBarButtonItem) {
        let infoViewController = InfoViewController()
        infoViewController.modalTransitionStyle = .flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet
        present(infoViewController, animated: true)
    }
}



