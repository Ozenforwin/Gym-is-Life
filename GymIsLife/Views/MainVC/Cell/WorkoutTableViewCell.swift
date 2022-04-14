//
//  WorkoutTableViewCell.swift
//  GymIsLife
//
//  Created by Dyadichev on 05.04.2022.
//

import Foundation
import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let imageWorkoutLabel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Workout")
        imageView.backgroundColor = .specialBackground
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let workoutName: UILabel = {
        let label = UILabel()
        label.text = "Pull Ups"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps: 10"
        label.textColor = UIColor(red: 0.318, green: 0.318, blue: 0.314, alpha: 1)
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets: 4"
        label.textColor = UIColor(red: 0.318, green: 0.318, blue: 0.314, alpha: 1)
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startButtonWorkout: UIButton = {
        let button = UIButton(type: .system)
        button.addShadowOnView()
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        button.setTitle("START", for: .normal)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialGreen
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelStackView = UIStackView()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startButtonPressed() {
        
        print("START")
    }
    
    private func setupViews() {
        
        backgroundColor = .specialBackground
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        addSubview(imageWorkoutLabel)
        addSubview(workoutName)
        contentView.addSubview(startButtonWorkout)
        
        labelStackView = UIStackView(arrangedSubviews: [repsLabel,setsLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(labelStackView)
    }
    
    
    //MARK: - SetConstraints
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0)
        ])
        NSLayoutConstraint.activate([
            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            imageWorkoutLabel.topAnchor.constraint(equalTo: workoutBackgroundView.topAnchor, constant: 10),
            imageWorkoutLabel.leadingAnchor.constraint(equalTo: workoutBackgroundView.leadingAnchor, constant: 10),
            imageWorkoutLabel.trailingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: -10),
            imageWorkoutLabel.bottomAnchor.constraint(equalTo: workoutBackgroundView.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            workoutName.leadingAnchor.constraint(equalTo: imageWorkoutLabel.trailingAnchor,constant: 20),
            workoutName.topAnchor.constraint(equalTo: topAnchor,constant: 5)
        ])
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: workoutName.bottomAnchor,constant: 0),
            labelStackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor,constant: 10)
        ])
        NSLayoutConstraint.activate([
            startButtonWorkout.topAnchor.constraint(equalTo: labelStackView.bottomAnchor,constant: 5),
            startButtonWorkout.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor,constant: 10),
            startButtonWorkout.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor,constant: -10),
            startButtonWorkout.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
}
