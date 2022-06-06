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
    
    let label: UILabel = {
        let theLabel = UILabel()
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.numberOfLines = 2
        theLabel.font = UIFont(name: "PT Sans-Bold", size: 21)
        
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
    
    func setAutoLayoutCalendar() {
        view.addSubview(calendarCollectionView)
        calendarCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func setAutoLayoutImage() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setAutoLayoutLabel() {
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setAutoLayoutButton() {
        view.addSubview(addButton)
        //addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

}

