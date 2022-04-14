//
//  NewWorkoutViewController.swift
//  GymIsLife
//
//  Created by Dyadichev on 09.04.2022.
//

import Foundation
import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.bounces = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel = UILabel(text: "Name")
    private let dateAndRepeatLabel = UILabel(text: "Date and repeat")
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        // Отключает границу textField
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        // Позволяет сделать так чтобы ввод текста начинался с отступом от левого края, грубо говоря мы добавляем прозрачную view
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        // Говорим чтобы прозрачная вью которую создали выше отображалась всегда
        textField.leftViewMode = .always
        // Добавляет кнопку (крестик) в textField который позволяет очистить текст по нажатию
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.backgroundColor = .specialGreen
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
        addTaps()
    }
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private func setupViews() {
        
        view.backgroundColor = .specialBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(newWorkoutLabel)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(closeButton)
        scrollView.addSubview(dateAndRepeatLabel)
        scrollView.addSubview(dateAndRepeatView)
        scrollView.addSubview(repsOrTimerLabel)
        scrollView.addSubview(repsOrTimerView)
        scrollView.addSubview(saveButton)
        
    }
    
    private func setDelegates() {
        nameTextField.delegate = self
    }
    
    //MARK: - Buttons
    
    @objc private func closeButtonPressed() {
        
        dismiss(animated: true)
    }
    
    @objc private func saveButtonPressed() {
        
        if dateAndRepeatView.repeatSwitch.isOn {
            print("1")
        } else {
            print("2")
        }
    }
    
    // Позволяет скрывать клавиатуру по тапу на экран в любом месте
    
    private func addTaps() {
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc private func hideKeyBoard() {
        
        view.endEditing(true)
        
    }
    
}

//MARK: TextField delegates

extension NewWorkoutViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Метод который скрывает клавиатуру по нажатию на кнопку GO
        nameTextField.resignFirstResponder()
    }
    
    
}

//MARK: - SetConstraints

extension NewWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -22)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor,constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21),
            nameTextField.heightAnchor.constraint(equalToConstant: 39)
        ])
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 14),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32)
        ])
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor,constant: 3),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 94)
        ])
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor,constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32)
        ])
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor,constant: 3),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 370)
        ])
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -22),
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor,constant: 25),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -23)
        ])
    }
}
