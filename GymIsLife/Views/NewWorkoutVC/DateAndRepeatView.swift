//
//  DatePickerView.swift
//  GymIsLife
//
//  Created by Dyadichev on 12.04.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.tintColor = .specialGreen
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    lazy var repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: StackView
    
    var dateStackView = UIStackView()
    var repeatStackView = UIStackView()
    
    // MARK: Private Function
    
    private func setupViews() {
        
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel,
                                                       datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(dateStackView)
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                         repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(repeatStackView)
    }
}

// MARK: - SetConstraints

extension DateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15)
        ])
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor,constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15)
        ])
    }
}
