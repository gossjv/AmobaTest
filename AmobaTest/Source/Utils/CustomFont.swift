//
//  CustomFont.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 27/02/2022.
//

import UIKit


struct CustomFont {
    
    
    static func setFontBebasNeue(fontSize: CGFloat) -> UIFont {
        let size = fontSize * (UIScreen.main.bounds.width / 320)
        let font = UIFont(name: "BebasNeue-Regular", size: size)
        return font ?? UIFont()
    }
    
    static func setFontSofiaProRegular(fontSize: CGFloat) -> UIFont {
        let size = fontSize * (UIScreen.main.bounds.width / 320)
        let font = UIFont(name: "SofiaProRegular", size: size)
        return font ?? UIFont()
    }
}
