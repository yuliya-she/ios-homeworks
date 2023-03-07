//
//  FeedViewController.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class FeedViewController: UIViewController {

    // MARK: - Subviews
    
    var post = Post(title: "My post")
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Go to post", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
    }
    
    // MARK: - Actions
       
   @objc func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
    
    //MARK: - Constraints
    
   private func setupSubviews () {
       self.view.addSubview(self.button)
       let _ = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
