//
//  WeatherLabel.swift
//  GymIsLife
//
//  Created by Dyadichev on 05.04.2022.
//

import Foundation
import UIKit

class WeatherView: UIView {
    
    private let weatherImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Sun"))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleText: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = .robotoMedium16()
        label.textColor = .specialBlack
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondText: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода чтобы позаниматься на улице"
        label.textColor = .gray
        label.font = .robotoMedium12()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        backgroundColor = .white
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherImage)
        addSubview(titleText)
        addSubview(secondText)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleText.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            titleText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            titleText.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
        NSLayoutConstraint.activate([
            secondText.topAnchor.constraint(equalTo: titleText.bottomAnchor,constant: 5),
            secondText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            secondText.trailingAnchor.constraint(equalTo: weatherImage.trailingAnchor,constant: -79),
            secondText.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -13)
            
        ])
        
        NSLayoutConstraint.activate([
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
        
        ])
    }
}
