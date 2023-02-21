//
//  PostViewController.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "SomeTitle"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(buttonPressed(_:)))
    }
    
    @objc func buttonPressed(_ sender: UIBarButtonItem) {
        
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet
        
        present(infoViewController, animated: true)
        
    }
}



