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
        //theImageView.backgroundColor = .black
        return theImageView
    }()
    
    let monthLabel: UILabel = {
        let theMonthLabel = UILabel()
        theMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        theMonthLabel.font = UIFont.systemFont(ofSize: 18)
        theMonthLabel.text = ""
        return theMonthLabel
    }()
    
    let monthChevron: UIButton = {
        let chevron = UIButton()
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        chevron.tintColor = .black
        return chevron
    }()
    
    let monthStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
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
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let calendar = Calendar(identifier: .gregorian)
    private let calendarHelper = CalendarHelper()
    private let date = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: "dateCell")
        
        setAutoLayoutCalendar()
        setAutoLayoutImage()
        setAutoLayoutLabel()
        setAutoLayoutButton()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
        
        // Set Width to have 7 Items in a row -> Calendar Collection View
        let layout = UICollectionViewFlowLayout()
        let numWeekDays = 7.0
        let itemWidth = calendarCollectionView.bounds.size.width / numWeekDays
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: itemWidth, height: calendarCollectionView.bounds.size.height)
        calendarCollectionView.collectionViewLayout = layout
    }
    
    
    @objc func addButtonPressed() {
        print("Add button Pressed!")
    }
    
    @objc func changeMonthPressed() {
        print("Change month pressed!")
    }
        
    func setAutoLayoutCalendar() {
        monthLabel.text = calendarHelper.getMonthString(date: date) + " " + calendarHelper.getYearString(date: date)
        monthStack.addArrangedSubview(monthLabel)
        monthStack.addArrangedSubview(monthChevron)
        view.addSubview(monthStack)
        view.addSubview(calendarCollectionView)
        
        monthChevron.addTarget(self, action: #selector(changeMonthPressed), for: .touchUpInside)
        
        monthStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        monthStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        monthStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        monthStack.heightAnchor.constraint(equalTo: calendarCollectionView.heightAnchor, multiplier: 0.3).isActive = true

        calendarCollectionView.topAnchor.constraint(equalTo: monthStack.bottomAnchor, constant: 10).isActive = true
        calendarCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        calendarCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        calendarCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    func setAutoLayoutImage() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: calendarCollectionView.topAnchor, constant: 130).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
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
        addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        addButton.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.15).isActive = true
        addButton.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.15).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

}

extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCollectionViewCell
        cell.dateLabel.text = ""
        cell.dayLabel.text = ""
        return cell
    }
    

}
