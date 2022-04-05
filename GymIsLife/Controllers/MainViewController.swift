//
//  ViewController.swift
//  GymIsLife
//
//  Created by Dyadichev on 04.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    //MARK: UIKit
    
    private let userPhotoImageView: UIImageView = {
        let image = UIImageView()
        //        image.layer.cornerRadius = image.frame.width / 2
        image.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.white.cgColor
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Vladimir Dyadichev"
        label.font = .robotoMedium24()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let calendarView: UIView = {
//        let view = UIView()
//
//        return view
//    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
    
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.setTitle("Add workout", for: .normal)
        button.tintColor = .specialDarkGreen
        button.backgroundColor = .specialYellow
        button.setImage(UIImage(named: "Plus"), for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .robotoMedium12()
        button.imageEdgeInsets = UIEdgeInsets(top: 0,
                                              left: 20,
                                              bottom: 15,
                                              right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 50,
                                              left: -40,
                                              bottom: 0,
                                              right: 0)
        button.addShadowOnView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    // MARK: - Buttons

    @objc func addButtonPressed() {
        
        print("add")
        
        
    }
    
    
    let weatherView = WeatherView()
    let calendarView = CalendarView()
    
    // MARK: Private func
    
    private func setupViews() {
        
        view.backgroundColor = .specialBackground
        
        view.addSubview(weatherView)
        
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(nameLabel)
        view.addSubview(addButton)
        
        
    }
}

// MARK: - SetConstraints

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor,constant: -7),
            nameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor,constant: 20)
        ])
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 69)
        ])
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor,constant: 6),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            addButton.heightAnchor.constraint(equalToConstant: 80),
            addButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor,constant: 6),
            weatherView.leadingAnchor.constraint(equalTo: addButton.trailingAnchor,constant: 12),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80)
        
        ])
    }
}
