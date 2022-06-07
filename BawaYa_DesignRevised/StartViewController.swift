//
//  ViewController.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 02/06/22.
//

import UIKit

class StartViewController: UIViewController {
        
    let imageView: UIImageView = {
        let theImageView = UIImageView()
        let imageName = "startImage"
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.image = UIImage(named: imageName)
        return theImageView
    }()
    
    let monthLabel: UILabel = {
        let theMonthLabel = UILabel()
        theMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        theMonthLabel.font = UIFont(name: "PT Sans", size: 21)
        theMonthLabel.text = "June 2022"
        return theMonthLabel
    }()
    
    let monthChevron: UIImageView = {
        let chevron = UIImageView()
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.image = UIImage(systemName: "chevron.down")
        chevron.tintColor = .black
        return chevron
    }()
    
    let monthStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        //stackView.backgroundColor = .yellow
        return stackView
    }()
    
    let label: UILabel = {
        let theLabel = UILabel()
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.numberOfLines = 2
        theLabel.font = UIFont(name: "PT Sans", size: 21)
        
        theLabel.textAlignment = .center
        theLabel.text = "It’s time to get reminded when you \nare going to some places"
        return theLabel
    }()
    
    let addButton: UIButton = {
        let theButton = UIButton(type: .custom)
        theButton.translatesAutoresizingMaskIntoConstraints = false
        theButton.setImage(UIImage(systemName: "plus"), for: .normal)
        theButton.tintColor = .white
        theButton.backgroundColor = UIColor(named: "colorPallete")
        theButton.clipsToBounds = true
        
        return theButton
    }()
    
    let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = UIColor(named: "colorPallete")
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    private let calendar = Calendar(identifier: .gregorian)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setAutoLayoutCalendar()
        setAutoLayoutImage()
        setAutoLayoutLabel()
        setAutoLayoutButton()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
    }
    
    
    @objc func addButtonPressed() {
        print("Add button Pressed!")
    }
        
    func setAutoLayoutCalendar() {
        monthStack.addArrangedSubview(monthLabel)
        monthStack.addArrangedSubview(monthChevron)
        view.addSubview(monthStack)
        view.addSubview(calendarCollectionView)
        
        monthStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        monthStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        monthStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        monthStack.heightAnchor.constraint(equalTo: calendarCollectionView.heightAnchor, multiplier: 0.3).isActive = true
        
//        monthChevron.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 5).isActive = true
//        //monthChevron.topAnchor.constraint(equalTo: monthLabel.topAnchor).isActive = true
//        //monthChevron.bottomAnchor.constraint(equalTo: monthLabel.bottomAnchor).isActive = true
//        monthChevron.heightAnchor.constraint(equalTo: monthLabel.heightAnchor, multiplier: 0.5).isActive = true
//
//        monthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        monthLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        monthLabel.widthAnchor.constraint(equalTo: calendarCollectionView.widthAnchor, multiplier: 0.25).isActive = true
//        monthLabel.heightAnchor.constraint(equalTo: calendarCollectionView.heightAnchor, multiplier: 0.5).isActive = true

        calendarCollectionView.topAnchor.constraint(equalTo: monthStack.bottomAnchor, constant: 10).isActive = true
        calendarCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        calendarCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        calendarCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setAutoLayoutImage() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: calendarCollectionView.bottomAnchor, constant: 20).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setAutoLayoutLabel() {
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setAutoLayoutButton() {
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        addButton.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.15).isActive = true
        addButton.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.15).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

}

private extension StartViewController {
    
    
}
