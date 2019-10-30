//
//  TextField+Padding.swift
//  iOSTest
//
//  Created by C4Q on 10/26/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    static func getLoginTextField(placeholderString: String) -> UITextField {
        let tf = UITextField()
        tf.contentMode = .left
        tf.backgroundColor = .white
        tf.layer.opacity = 0.8
        tf.layer.masksToBounds = true
        tf.layer.cornerRadius = 8
        tf.attributedPlaceholder = NSAttributedString(string: placeholderString, attributes: [.foregroundColor: UIColor.placeholderGray])
        tf.textColor = UIColor.textBlack
        tf.returnKeyType = .done
        tf.keyboardAppearance = .dark
        tf.setLeftPaddingPoints(24)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
}
