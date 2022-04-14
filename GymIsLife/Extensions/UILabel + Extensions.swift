//
//  UILabel + Extensions.swift
//  GymIsLife
//
//  Created by Dyadichev on 12.04.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}
