//
//  ViewController.swift
//  GymIsLife
//
//  Created by Dyadichev on 04.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let identifierTableView = "identifierTableView"
    
    //MARK: UIKit
    
    private let userPhotoImageView: UIImageView = {
        let image = UIImageView()
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
    
    private let workoutTodayText: UILabel = {
        let label = UILabel()
        label.text = "Workout today"
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let noWorkoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noWorkout")
        //        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.isHidden = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
        
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: identifierTableView)
    }
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    // MARK: - Buttons
    
    @objc func addButtonPressed() {
        
        let newWorkoutVC = NewWorkoutViewController()
        newWorkoutVC.modalPresentationStyle = .fullScreen
        newWorkoutVC.modalTransitionStyle = .flipHorizontal
        present(newWorkoutVC, animated: true)
    }
    
    let weatherView = WeatherView()
    let calendarView = CalendarView()
    
    // MARK: Private func
    
    private func setDelegates() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupViews() {
        
        view.backgroundColor = .specialBackground
        
        view.addSubview(weatherView)
        view.addSubview(tableView)
        
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(nameLabel)
        view.addSubview(addButton)
        view.addSubview(workoutTodayText)
        view.addSubview(noWorkoutImageView)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierTableView, for: indexPath) as! WorkoutTableViewCell
        var content = cell.defaultContentConfiguration()
        //        content.secondaryText = "Ячейка \(indexPath.row)"
        //        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
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
        NSLayoutConstraint.activate([
            workoutTodayText.topAnchor.constraint(equalTo: addButton.bottomAnchor,constant: 14),
            workoutTodayText.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            workoutTodayText.widthAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: workoutTodayText.bottomAnchor,constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
        ])
        NSLayoutConstraint.activate([
            noWorkoutImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            noWorkoutImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            noWorkoutImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            noWorkoutImageView.topAnchor.constraint(equalTo: workoutTodayText.bottomAnchor, constant: 0)
        ])
    }
}
