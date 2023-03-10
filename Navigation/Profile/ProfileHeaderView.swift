//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by мас on 01.03.23.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    // MARK: - Subviews
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Piones")
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 60
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "Flowers"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textColor = UIColor.black
        name.numberOfLines = 2
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Waiting for somebody..."
        status.font = UIFont.systemFont(ofSize: 14)
        status.textColor = UIColor.systemGray
        status.numberOfLines = 3
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var button: UIButton = {
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
    
    private lazy var textField: UITextField = {
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
    
    @objc func buttonPressed() {
        if statusText != nil {
            status.text = statusText
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if textField.text != nil {
            statusText = textField.text!
        }
    }
    
    //MARK: - Constraints
    
    private func setupUI() {
        backgroundColor = .lightGray
        addSubview(imageView)
        addSubview(name)
        addSubview(status)
        addSubview(button)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
       
            name.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            name.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
       
            status.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20),
            status.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            status.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -18),
       
            button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 74),
            button.heightAnchor.constraint(equalToConstant: 50),
   
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 15),
            textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20)
        ])
    }
}
