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
