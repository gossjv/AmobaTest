//
//  UIView+AMOBA.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import UIKit

extension UIView {
    // Redondea
    func roundView(view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.bounds.width / 2
        view.layer.borderWidth = 2
    }
    
}

extension UITextField{
    // Agrega imagen a textfield
    func setLeftImage(imageName:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView
        self.leftViewMode = .always
    }
}


extension UITextField {

 /// set icon of 20x20 with left padding of 8px
 func setLeftIcon(_ icon: UIImage) {

    let padding = 20
    let size = 20

    let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
    let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
    iconView.image = icon
    outerView.addSubview(iconView)

    leftView = outerView
    leftViewMode = .always
  }
}
