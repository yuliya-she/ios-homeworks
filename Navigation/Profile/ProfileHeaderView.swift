//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by мас on 01.03.23.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    // MARK: - Subviews
    
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Piones")
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 60
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Flowers"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textColor = UIColor.black
        name.numberOfLines = 2
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.text = "Waiting for somebody..."
        status.font = UIFont.systemFont(ofSize: 14)
        status.textColor = UIColor.systemGray
        status.numberOfLines = 3
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    
    private var statusText: String? = String()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    @objc func buttonPressed() {
        if statusText != nil {
            statusLabel.text = statusText!
        }
    }
    
    
    //MARK: - Constraints
    
    private func setupUI() {
        backgroundColor = .lightGray
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 30),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -20),
            
            setStatusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)
        ])
    }
}
