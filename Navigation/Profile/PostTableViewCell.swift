//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by мас on 01.04.23.
//

import Foundation
import UIKit

final class PostTableViewCell: UITableViewCell {
    
    static let id  = "PostTableViewCell_ReuseID"
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var flowerImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .systemGray
        return textField
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var viewsLabel:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        setupConstraints()
        addSubviews()
        tuneView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        isHidden = false
        isSelected = false
        isHighlighted = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard let view = selectedBackgroundView else {
            return
        }

        contentView.insertSubview(view, at: 0)
        selectedBackgroundView?.isHidden = !selected
    }
    
    func update(_ model: Post) {
        authorLabel.text = model.author
        flowerImageView.image = model.image
        descriptionTextField.text = model.description
        likesLabel.text = String(model.likes)
        viewsLabel.text = String(model.views)
    }
    
    private func tuneView() {
        contentView.backgroundColor = .systemBlue
        accessoryType = .none
    }

    private func addSubviews() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(flowerImageView)
        contentView.addSubview(descriptionTextField)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            flowerImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            flowerImageView.heightAnchor.constraint(equalTo: flowerImageView.widthAnchor),
            flowerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flowerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            descriptionTextField.topAnchor.constraint(equalTo: flowerImageView.bottomAnchor),
            descriptionTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.widthAnchor.constraint(equalToConstant: 30),
            likesLabel.heightAnchor.constraint(equalToConstant: 20),

            viewsLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.widthAnchor.constraint(equalToConstant: 30),
            viewsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
