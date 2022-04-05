//
//  CalendarView.swift
//  GymIsLife
//
//  Created by Dyadichev on 05.04.2022.
//

import UIKit

class CalendarView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
    
}
