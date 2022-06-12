//
//  AddPlaceViewController.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 08/06/22.
//

import UIKit

class AddPlaceViewController: UIViewController {
    
    let backButton: UIButton = {
        let theButton = UIButton()
        theButton.translatesAutoresizingMaskIntoConstraints = false
        theButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        theButton.backgroundColor = UIColor(named: "customGrey")
        theButton.tintColor = .systemGray2
        theButton.layer.cornerRadius = 8
        return theButton
    }()
    
    let navTitle: UILabel = {
        let theTitle = UILabel()
        theTitle.translatesAutoresizingMaskIntoConstraints = false
        theTitle.text = "Add Place"
        theTitle.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        return theTitle
    }()
    
    let tableView: UITableView = {
        let theTableView = UITableView()
        theTableView.translatesAutoresizingMaskIntoConstraints = false
        //theTableView.backgroundColor = .green
        return theTableView
    }()
    
    let doneButton: UIButton = {
        let theButton = UIButton()
        theButton.translatesAutoresizingMaskIntoConstraints = false
        theButton.backgroundColor = UIColor(named: "colorPallete")
        theButton.setTitle("Done", for: .normal)
        theButton.layer.cornerRadius = 12
        return theButton
    }()
    
    let sectionTitle = ["Place Name", "Category", "Notification", "Must Bring Items"]
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "textFieldCell")
        tableView.register(GreenButtonTableViewCell.self, forCellReuseIdentifier: "greenButtonCell")
        tableView.register(CollectionItemsTableViewCell.self, forCellReuseIdentifier: "collectionCell")
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    
        setUpTableView()
        
        setAutoLayoutBackButton()
        setAutoLayoutNavTitle()
        setAutoLayoutTableView()
        setAutoLayoutDoneButton()
        
        
    }
    
        
    func setAutoLayoutBackButton() {
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
    }
    
    func setAutoLayoutNavTitle() {
        view.addSubview(navTitle)
        navTitle.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        navTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        navTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setAutoLayoutTableView() {
        view.addSubview(tableView)
        view.addSubview(doneButton)

        tableView.topAnchor.constraint(equalTo: navTitle.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        tableView.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -20).isActive = true

    }
    
    func setAutoLayoutDoneButton() {
        doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = false
        doneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalTo: tableView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddPlaceViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldTableViewCell
        let greenButtonCell = tableView.dequeueReusableCell(withIdentifier: "greenButtonCell", for: indexPath) as! GreenButtonTableViewCell
        let collectionCell = tableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as! CollectionItemsTableViewCell
        
        if indexPath.section == 0 {
            return textFieldCell
        } else if indexPath.section == 1 {
            greenButtonCell.greyViewSideButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            greenButtonCell.greyViewMainLabel.text = "Work"
            greenButtonCell.sideButton.setImage(UIImage(systemName: "plus"), for: .normal)
            return greenButtonCell
        } else if indexPath.section == 2{
            greenButtonCell.greyViewSideButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
            greenButtonCell.sideButton.setTitle("Repeat", for: .normal)
            greenButtonCell.greyViewMainLabel.text = "01:50 PM"
            greenButtonCell.sideButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            return greenButtonCell
        } else {
            collectionCell.collectionView.delegate = self
            collectionCell.collectionView.dataSource = self
            //collectionCell.collectionView.backgroundColor = .green
            return collectionCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let headerTitle = UILabel(frame: CGRect(x: 5, y: 5, width: tableView.frame.width, height: headerView.frame.height - 10))
        let editButton = UIButton(type: .system)
        
        editButton.frame = CGRect(x: headerTitle.frame.minX + 140, y: 5, width: tableView.frame.width, height: headerView.frame.height - 10)
    
        headerView.addSubview(headerTitle)
        headerView.addSubview(editButton)
        //headerView.backgroundColor = .brown
        
        //Header Title
        headerTitle.text = sectionTitle[section]
        headerTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        if section == 3 {
            //Edit Button
            editButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            editButton.tintColor = UIColor(named: "customDarkGreen")
            editButton.setTitle("Edit", for: .normal)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
}

extension AddPlaceViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemsCollectionViewCell
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 40)
    }
    
    
}
