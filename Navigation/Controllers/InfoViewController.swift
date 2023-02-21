//
//  InfoViewController.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        
        return button
    }()
    
    lazy var goAlert: UIButton = {
        let button2 = UIButton()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("goAlert", for: .normal)
        return button2
    }()
    
    let action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        print("OK")
    }
    
    let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
        print("Cancel")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        view.addSubview(actionButton)
        view.addSubview(goAlert)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            actionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        NSLayoutConstraint.activate([
            goAlert.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            goAlert.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            goAlert.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                             constant: 30.0),
            goAlert.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        goAlert.addTarget(self, action: #selector(addAlert(_:)), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func addAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        alertController.addAction(action)
        alertController.addAction(action2)
        
        present(alertController, animated: true)
    }
}
