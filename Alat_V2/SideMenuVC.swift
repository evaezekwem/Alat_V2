//
//  SideMenuVC.swift
//  Zone
//
//  Created by Zone 3 on 6/22/17.
//  Copyright © 2017 Zone 3. All rights reserved.
//

import UIKit


class SideMenuVC : UICollectionViewController, UICollectionViewDelegateFlowLayout{

    
    
    var sections = ["Fund Account","Transfer Money","Make Payment","Goals","Refer Friends", "Settings"]
    let icons: [UIImage] = [UIImage(named: "fund_account_icon")!, UIImage(named: "transfer_money_icon")!,UIImage(named: "make_payment_icon")!,UIImage(named: "goals_icon")!,UIImage(named: "refer_friends_icon")!,UIImage(named: "settings_icon")!]
    
    let segues = [["addCardController", "myCardsController", "changePasswordController"], ["ReportProblemController", "rateUsController", "settingsController", "aboutUsController"], ["shareController", "helpController", "logoutController"]]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = Utilities.getColorWithHexString("#494A49")
        collectionView?.alwaysBounceHorizontal = false
        collectionView?.register(MenuCell.self, forCellWithReuseIdentifier: "menucell")
        
        collectionView?.register(ProfileMenuHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headercell")

    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menucell", for: indexPath) as! MenuCell
        
        
        cell.menuLabel.text = sections[indexPath.row]
        cell.menuIcon.image = icons[indexPath.row]
       // cell.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nvc = self.mainNavigationController()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 46.5)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headercell", for: indexPath) as! ProfileMenuHeader
            return header
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width: view.frame.width, height: 240)
        }else{
            return CGSize(width: view.frame.width, height: 0)
        }
    }
    
    

    func mainNavigationController() -> DLHamburguerNavigationController {
        return DLHamburguerNavigationController(rootViewController: HomeController(collectionViewLayout : UICollectionViewFlowLayout()))

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }


}



class MenuCell : UICollectionViewCell{


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = Utilities.getColorWithHexString("#494A49")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let menuIcon : UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "phone")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = Utilities.getColorWithHexString("#8A8B8A")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let menuLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let divider : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = Utilities.getColorWithHexString("#8A8B8A")
        return v
    }()
    
    
    func setupViews(){
        addSubview(menuIcon)
        addSubview(menuLabel)
        addSubview(divider)

        
        menuIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        menuIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        menuIcon.widthAnchor.constraint(equalToConstant: 18).isActive = true
        menuIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        menuLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        menuLabel.leftAnchor.constraint(equalTo: menuIcon.rightAnchor, constant: 16).isActive = true
        menuLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        menuLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
    
        
        divider.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        divider.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        divider.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    
    }

}

class ProfileMenuHeader : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Utilities.getColorWithHexString("#494A49")
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "avatar")
        iv.layer.cornerRadius = 24
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    let lastSeen : UILabel = {
        let label = UILabel()
        label.text = "last login 4th August 2017 1:13am"
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileName : UILabel = {
        let label = UILabel()
        label.text = "Ayo Freeborn"
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.systemFont(ofSize: 18)
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
        
        addSubview(profileName)
        addSubview(lastSeen)
        addSubview(profileImage)
        addSubview(divider)

        
        
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        profileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 48).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        profileName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 8).isActive = true
        profileName.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 8).isActive = true
        profileName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2/3).isActive = true
        //profileName.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        lastSeen.topAnchor.constraint(equalTo: profileName.bottomAnchor).isActive = true
        lastSeen.leftAnchor.constraint(equalTo: profileName.leftAnchor).isActive = true
        lastSeen.rightAnchor.constraint(equalTo: profileName.rightAnchor).isActive = true
        lastSeen.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        divider.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        divider.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        divider.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
       
        
        
    }
    
    
}
