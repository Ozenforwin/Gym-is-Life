//
//  RepsOrTimerView.swift
//  GymIsLife
//
//  Created by Dyadichev on 12.04.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.font = .robotoMedium16()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countSetsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .specialGreen
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let chooseRepeatLabel = UILabel(text: "Choose repeat or timer")
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.font = .robotoMedium16()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countRepsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .specialGreen
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Timer"
        label.font = .robotoMedium16()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 600
        slider.minimumTrackTintColor = .specialGreen
        slider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // SLIDER
    
    @objc func setsSliderChanged() {
        
        countSetsLabel.text = "\(Int(setsSlider.value))"
        
    }
    
    @objc func repsSliderChanged() {
        
        countRepsLabel.text = "\(Int(repsSlider.value))"
        
        setNegative(label: timerLabel, numberLabel: countTimerLabel, slider: timerSlider)
        
        setActive(label: repsLabel, numberLabel: countRepsLabel, slider: repsSlider)
    }
    
    @objc func timerSliderChanged() {
        
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return ((secs % 3600) / 60, (secs % 3600) % 60)}(Int(timerSlider.value))
        
        //        if sec != 0 {
        //            countTimerLabel.text = "\(min) min \(sec) sec"
        //        } else {
        //            countTimerLabel.text = "\(min) min"
        //        }
        
        countTimerLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min")
        
        setNegative(label: repsLabel, numberLabel: countRepsLabel, slider: repsSlider)
        
        setActive(label: timerLabel, numberLabel: countTimerLabel, slider: timerSlider)
        
    }
    
    private func setActive(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
    }
    
    private func setNegative(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        numberLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
    
    //STACK VIEW
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    
    private func setupViews() {
        
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(chooseRepeatLabel)
        
        addSubview(setsSlider)
        addSubview(repsSlider)
        addSubview(timerSlider)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,countSetsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(setsStackView)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,countRepsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(repsStackView)
        
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,countTimerLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(timerStackView)
    }
}


// MARK: -SetConstraints

extension RepsOrTimerView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor,constant: 23),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 14),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -14)
        ])
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor,constant: 16),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 14),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -14)
        ])
        NSLayoutConstraint.activate([
            chooseRepeatLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseRepeatLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor,constant: 32)
        ])
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: chooseRepeatLabel.bottomAnchor,constant: 5),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 14),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -14)
        ])
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor,constant: 19),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 14),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -14)
        ])
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor,constant: 24),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 14),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -14)
        ])
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor,constant: 19),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 14),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -14)
        ])
    }
}
