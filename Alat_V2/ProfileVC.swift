//
//  ProfileVC.swift
//  Alat_V2
//
//  Created by Zone 3 on 7/29/17.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit


class ProfileVC : UIViewController{


    override func viewDidLoad() {
        view.backgroundColor = .white
        SetupViews()
    }


    let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "avatar")
        iv.layer.cornerRadius = 32
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let accountNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Account Holder Name"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let accountNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "Account Number"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountNumber : UILabel = {
        let label = UILabel()
        label.text = "01211984563"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileName : UILabel = {
        let label = UILabel()
        label.text = "Adeyemi Adeobospa"
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileDetailContainer : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    
    
    
    
    
    func SetupViews(){
        view.addSubview(profileDetailContainer)
        view.addSubview(profileImage)
        view.addSubview(accountNameLabel)
        view.addSubview(accountNumberLabel)
        view.addSubview(accountNumber)
        view.addSubview(profileName)
        

        
        
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 64).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        profileDetailContainer.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 32).isActive = true
        profileDetailContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileDetailContainer.widthAnchor.constraint(equalToConstant: 280).isActive = true
        profileDetailContainer.heightAnchor.constraint(equalToConstant: 350).isActive = true
    
        accountNameLabel.topAnchor.constraint(equalTo: profileDetailContainer.topAnchor, constant: 12).isActive = true
        accountNameLabel.leftAnchor.constraint(equalTo: profileDetailContainer.leftAnchor, constant: 8).isActive = true
        accountNameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountNameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        profileName.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 4).isActive = true
        profileName.leftAnchor.constraint(equalTo: profileDetailContainer.leftAnchor, constant: 8).isActive = true
        profileName.widthAnchor.constraint(equalToConstant: 300).isActive = true
        profileName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        accountNumberLabel.topAnchor.constraint(equalTo: profileName.topAnchor, constant: 32).isActive = true
        accountNumberLabel.leftAnchor.constraint(equalTo: profileName.leftAnchor).isActive = true
        accountNumberLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountNumberLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        accountNumber.topAnchor.constraint(equalTo: accountNumberLabel.bottomAnchor, constant: 4).isActive = true
        accountNumber.leftAnchor.constraint(equalTo: accountNumberLabel.leftAnchor).isActive = true
        accountNumber.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountNumber.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        var containerTopAnchor : NSLayoutYAxisAnchor = accountNumber.bottomAnchor
        
        for i in 1...3{
            let extraDetailContainer : UIView = {
                let v = UIView()
                v.translatesAutoresizingMaskIntoConstraints = false
                v.backgroundColor = .white
                
                let extraDetailImage : UIImageView = {
                    let iv = UIImageView()
                    iv.image = UIImage(named: "")
                    iv.backgroundColor = .green
                    iv.layer.cornerRadius = 9
                    iv.layer.masksToBounds = true
                    iv.translatesAutoresizingMaskIntoConstraints = false
                    return iv
                }()
                
                let extraDetailForward : UIImageView = {
                    let iv = UIImageView()
                    iv.image = UIImage(named: "forward")?.withRenderingMode(.alwaysTemplate)
                    iv.tintColor = .lightGray
                    iv.translatesAutoresizingMaskIntoConstraints = false
                    return iv
                }()
                
                let extraDetailDescription : UILabel = {
                    let label = UILabel()
                    label.text = "Adeyemi Adeobospa"
                    label.textColor = Utilities.getColorWithHexString("#8A8B8A")
                    label.font = UIFont.boldSystemFont(ofSize: 14)
                    label.translatesAutoresizingMaskIntoConstraints = false
                    return label
                }()
                
                let divider : UIView = {
                    let v = UIView()
                    v.translatesAutoresizingMaskIntoConstraints = false
                    v.backgroundColor = Utilities.getColorWithHexString("#8A8B8A")
                    return v
                }()
                
                v.addSubview(extraDetailImage)
                v.addSubview(extraDetailDescription)
                v.addSubview(extraDetailForward)
                v.addSubview(divider)
                
                
                extraDetailForward.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                extraDetailForward.rightAnchor.constraint(equalTo: v.rightAnchor, constant: -8).isActive = true
                extraDetailForward.widthAnchor.constraint(equalToConstant: 12).isActive = true
                extraDetailForward.heightAnchor.constraint(equalToConstant: 12).isActive = true
                
                
                extraDetailImage.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                extraDetailImage.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 8).isActive = true
                extraDetailImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
                extraDetailImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
                
                extraDetailDescription.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                extraDetailDescription.leftAnchor.constraint(equalTo: extraDetailImage.rightAnchor, constant:2).isActive = true
                extraDetailDescription.widthAnchor.constraint(equalToConstant: 200).isActive = true
                extraDetailDescription.heightAnchor.constraint(equalToConstant: 16).isActive = true
                
                divider.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
                divider.leftAnchor.constraint(equalTo: v.leftAnchor).isActive = true
                divider.rightAnchor.constraint(equalTo: v.rightAnchor).isActive = true
                divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
                return v
            }()

            profileDetailContainer.addSubview(extraDetailContainer)
            
            let tAnch = extraDetailContainer.topAnchor.constraint(equalTo: containerTopAnchor, constant: 48)
            tAnch.isActive = true
            extraDetailContainer.leftAnchor.constraint(equalTo: profileDetailContainer.leftAnchor).isActive = true
            extraDetailContainer.rightAnchor.constraint(equalTo: profileDetailContainer.rightAnchor).isActive = true
            extraDetailContainer.heightAnchor.constraint(equalToConstant: 64).isActive = true
            if i != 1{
                tAnch.constant = 0
            }
            if i == 3{
                
            }
            containerTopAnchor = extraDetailContainer.bottomAnchor
        }
        
    }


}




