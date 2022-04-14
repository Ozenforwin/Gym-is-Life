//
//  CalendarCell.swift
//  GymIsLife
//
//  Created by Dyadichev on 05.04.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let dayOfweekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfdayLabel: UILabel = {
       let label = UILabel()
        label.text = "14"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override var isSelected: Bool {
        
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                layer.cornerRadius = 10
                dayOfweekLabel.textColor = .specialBlack
                numberOfdayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfweekLabel.textColor = .white
                numberOfdayLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        
        addSubview(dayOfweekLabel)
        addSubview(numberOfdayLabel)
    }
    
    // Функция настройки календаря, далее мы добавляем ее в нашу ячейку.
    func cellConfigure(weekArray: [[String]], indexPath: IndexPath) {
        numberOfdayLabel.text = weekArray[1][indexPath.item]
        dayOfweekLabel.text = weekArray[0][indexPath.item]
    }
    
    //MARK: - SetConstraints
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dayOfweekLabel.topAnchor.constraint(equalTo: topAnchor,constant: 12),
            dayOfweekLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            numberOfdayLabel.topAnchor.constraint(equalTo: dayOfweekLabel.bottomAnchor,constant: 2),
            numberOfdayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
