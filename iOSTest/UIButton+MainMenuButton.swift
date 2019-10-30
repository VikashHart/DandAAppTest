//
//  UIButton+MainMenuButton.swift
//  iOSTest
//
//  Created by C4Q on 10/26/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import UIKit

extension UIButton {
    static func getMainMenuButton(imageString: String, titleString: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageString)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.setTitle(titleString, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.textBlack, for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        if let imageview = button.imageView {
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: (imageview.frame.size.width) + 16, bottom: 0, right: 0)
        }
        button.layer.opacity = 0.8
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func getBlueButton(titleString: String) -> UIButton {
        let button = UIButton()
        button.setTitle(titleString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor.appBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
