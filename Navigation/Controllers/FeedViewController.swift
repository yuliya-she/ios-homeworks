//
//  FeedViewController.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "My post")
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Go to post", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.view.addSubview(self.button)
        
    }
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
}
