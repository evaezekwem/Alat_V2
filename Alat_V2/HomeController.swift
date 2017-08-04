//
//  HomeController.swift
//  Alat_V2
//
//  Created by Zone 3 on 7/29/17.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        collectionView?.backgroundColor = .white
        let contactImage = UIImage(named: "identityIcon")?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: contactImage, style: .plain, target: self, action: #selector(handleProfileIconClicked))
        
        let menuImage = UIImage(named: "menu_icon")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(handleMenuPressed))
        
        navigationItem.title = "Account OverView"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.green
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "gradient_background"), for: .default)
        navigationController?.navigationBar.layer.borderColor = nil
        
        
        
        collectionView?.alwaysBounceVertical = false
        
        
        collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: "homeCell")
        collectionView?.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "homeHead")
    }
    
    

    
    func handleProfileIconClicked(){
        let profileVC = ProfileVC()
        
        present(profileVC, animated: false, completion: nil)
        
        print("Profile Image Clicked")
    }
    
    func handleMenuPressed(){
        
        self.findHamburguerViewController()?.showMenuViewController()

        
//        
//        let homeController = AccountOverviewController()
//        let contentController = UINavigationController(rootViewController: homeController)
//        let menuVC = SideMenuVC(collectionViewLayout: UICollectionViewLayout())
//        let rootViewController = RootVC(contentViewController: contentController, menuViewController: menuVC)
//        
//        present(rootViewController, animated: true, completion: nil)
        
        print("Menu clicked")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nvc = self.mainNavigationController()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
        if indexPath.row == 0 {
            cell.transactionlabel.isHidden = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 96)
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "homeHead", for: indexPath) as! HomeHeader
            return header
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func mainNavigationController() -> DLHamburguerNavigationController {
        return DLHamburguerNavigationController(rootViewController: HomeController(collectionViewLayout : UICollectionViewFlowLayout()))
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    
}



class HomeCell : UICollectionViewCell{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let container : UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.cornerRadius = 5
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let transactionType : UILabel = {
        let label = UILabel()
        label.text = "Payment"
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let transactionlabel : UILabel = {
        let label = UILabel()
        label.text = "Transactions"
        label.textColor = Utilities.getColorWithHexString("#C23724")
        label.font = UIFont.systemFont(ofSize: 16)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let transactionAmount : UILabel = {
        let label = UILabel()
        label.text = "₦230,000"
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let transactionOn : UILabel = {
        let label = UILabel()
        label.text = "off"
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    func setupViews(){
        addSubview(container)
        addSubview(transactionAmount)
        addSubview(transactionType)
        addSubview(transactionOn)
        addSubview(transactionlabel)
        
        
        transactionlabel.heightAnchor.constraint(equalToConstant : 12).isActive = true
        transactionlabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: -4).isActive = true
        transactionlabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 4/5).isActive = true
        transactionlabel.bottomAnchor.constraint(equalTo: container.topAnchor,  constant : -12).isActive = true
        
        container.heightAnchor.constraint(equalToConstant : 60).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 4/5).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor,  constant : -4).isActive = true
        
        transactionAmount.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4).isActive = true
        transactionAmount.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 8).isActive = true
        transactionAmount.widthAnchor.constraint(equalToConstant: 200).isActive = true
        transactionAmount.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        transactionType.bottomAnchor.constraint(equalTo: transactionAmount.topAnchor, constant: -4).isActive = true
        transactionType.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 8).isActive = true
        transactionType.widthAnchor.constraint(equalToConstant: 200).isActive = true
        transactionType.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        transactionOn.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8).isActive = true
        transactionOn.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -4).isActive = true
        transactionOn.widthAnchor.constraint(equalToConstant: 36).isActive = true
        transactionOn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        
        
    }
    
    
    
}

class HomeHeader : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = Utilities.getColorWithHexString("#C23724")
        backgroundView = UIImageView(image: UIImage(named: "gradient_background"))
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    let totalBalance : UILabel = {
        let label = UILabel()
        label.text = "₦920,000.00"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerDescription : UILabel = {
        let label = UILabel()
        label.text = "Total Amount"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let divider : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    
    
    func setupViews(){
        
        addSubview(headerDescription)
        addSubview(totalBalance)
        addSubview(divider)
        
        
        headerDescription.bottomAnchor.constraint(equalTo: totalBalance.topAnchor, constant: -4).isActive = true
        headerDescription.leftAnchor.constraint(equalTo: totalBalance.leftAnchor).isActive = true
        headerDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2/3).isActive = true
        headerDescription.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        totalBalance.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        totalBalance.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        totalBalance.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
        totalBalance.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        divider.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        divider.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        divider.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
    }
    
    
}
