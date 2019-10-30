//
//  AnimationView.swift
//  iOSTest
//
//  Created by C4Q on 10/24/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "ic_logo")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 1
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var fadeInOutButton: UIButton = {
        let button = UIButton.getBlueButton(titleString: "FADE OUT")
        return button
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .uiviewWhite
        setupViews()
    }

    private func setupViews() {
        setupLogoImageView()
        setupFadeInButton()
    }

    private func setupLogoImageView() {
        addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            ])
    }

    private func setupFadeInButton() {
        addSubview(fadeInOutButton)
        NSLayoutConstraint.activate([
            fadeInOutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            fadeInOutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            fadeInOutButton.heightAnchor.constraint(equalToConstant: 55),
            fadeInOutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
            ])
    }
}
