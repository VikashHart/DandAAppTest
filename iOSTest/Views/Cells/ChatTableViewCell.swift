//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_login")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .textBlack
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var bodyContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.chatWhite.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.textColor = .textBlack
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: "ChatCell")
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = UIColor.clear
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupViews() {
        setupAvatarImageView()
        setupHeaderLabel()
        setupBodyContainerView()
        setupBodyLabel()
    }

    // All Constraints Go Here.

    private func setupAvatarImageView() {
        addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
            ])
    }

    private func setupHeaderLabel() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            headerLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7),
            headerLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -36)
            ])
    }

    private func setupBodyContainerView() {
        addSubview(bodyContainerView)
        NSLayoutConstraint.activate([
            bodyContainerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 4),
            bodyContainerView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7),
            bodyContainerView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -36),
            bodyContainerView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
            ])
    }

    private func setupBodyLabel() {
        bodyContainerView.addSubview(bodyLabel)
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: bodyContainerView.topAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: bodyContainerView.leadingAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: bodyContainerView.trailingAnchor, constant: -8),
            bodyLabel.bottomAnchor.constraint(equalTo: bodyContainerView.bottomAnchor, constant: -8)
            ])
    }

    // MARK: - Public
    func setCellData(message: MessageModel) {
        DispatchQueue.global().async {
            if let url = URL(string: message.avatar_url) {
                do {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.avatarImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        headerLabel.text = message.name
        bodyLabel.text = message.message
    }
}
