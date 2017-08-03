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
        super.viewDidLoad()
        
        SetupViews()
    }

    let navBar: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  =  false
        return view
    }()
    
    let navBarBackgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "gradient_background")
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    let accountInfoText: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Account Info"
        text.font = UIFont.systemFont(ofSize: 12)
        text.textColor = .white
        text.textAlignment = NSTextAlignment.center
        return text
    }()

    let mainViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  =  false
        view.backgroundColor = .white
        return view
    }()
    
    let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "avatar")
        iv.layer.cornerRadius = 35
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let addProfileImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    let addProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "add_icon"), for: .normal)
        button.addTarget( self, action: #selector(handleAddProfileImage), for: .touchUpInside)
        return button
    }()
    
    
    let accountNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Account holder's name"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = textAndBackgroundLightRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let accountNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "Account Number"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = textAndBackgroundLightRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountNumber : UILabel = {
        let label = UILabel()
        label.text = "012 119 84563"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileName : UILabel = {
        let label = UILabel()
        label.text = "Akanbi John Doe"
        label.textColor = Utilities.getColorWithHexString("#8A8B8A")
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileDetailContainer : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = textGray.cgColor
        v.layer.borderWidth = 1
        v.layer.cornerRadius = 5
        return v
    }()
    
    func handleAddProfileImage() {
        print("Add profile image clicked")
    }
    
    func handleBack() {
        dismiss(animated: false, completion: nil)
    }
    
    
    func SetupViews(){
        view.addSubview(navBar)
        navBar.addSubview(navBarBackgroundImageView)
        navBar.addSubview(backButton)
        navBar.addSubview(accountInfoText)
   
        view.addSubview(mainViewContainer)
        mainViewContainer.addSubview(profileDetailContainer)
        mainViewContainer.addSubview(profileImage)
        mainViewContainer.addSubview(addProfileImageContainer)
        
        addProfileImageContainer.addSubview(addProfileButton)
        
        mainViewContainer.addSubview(accountNameLabel)
        mainViewContainer.addSubview(accountNumberLabel)
        mainViewContainer.addSubview(accountNumber)
        mainViewContainer.addSubview(profileName)
        

        
        navBar.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        navBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        navBarBackgroundImageView.anchorToTop(top: navBar.topAnchor, left: navBar.leftAnchor, bottom: navBar.bottomAnchor, right: navBar.rightAnchor)
        
        backButton.anchorWithConstantsToTop(top: nil, left: navBar.leftAnchor, bottom: navBar.bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0)
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        accountInfoText.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
        accountInfoText.bottomAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        accountInfoText.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        
        mainViewContainer.anchorToTop(top: navBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        profileImage.centerXAnchor.constraint(equalTo: mainViewContainer.centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: mainViewContainer.topAnchor, constant: 32).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        addProfileImageContainer.anchorWithConstantsToTop(top: nil, left: profileImage.rightAnchor, bottom: profileImage.bottomAnchor, right: nil, topConstant: 0, leftConstant: -20, bottomConstant: 0, rightConstant: 0)
        addProfileImageContainer.widthAnchor.constraint(equalToConstant: 24).isActive = true
        addProfileImageContainer.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addProfileButton.centerXAnchor.constraint(equalTo: addProfileImageContainer.centerXAnchor).isActive = true
        addProfileButton.centerYAnchor.constraint(equalTo: addProfileImageContainer.centerYAnchor).isActive = true
        addProfileButton.widthAnchor.constraint(equalTo: addProfileImageContainer.widthAnchor, constant: -4).isActive = true
        addProfileButton.heightAnchor.constraint(equalTo: addProfileImageContainer.heightAnchor, constant: -4).isActive = true
        
        profileDetailContainer.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 32).isActive = true
        profileDetailContainer.centerXAnchor.constraint(equalTo: mainViewContainer.centerXAnchor).isActive = true
        profileDetailContainer.widthAnchor.constraint(equalTo: mainViewContainer.widthAnchor, constant: -50).isActive = true
        profileDetailContainer.heightAnchor.constraint(equalToConstant: 350).isActive = true
    
        accountNameLabel.topAnchor.constraint(equalTo: profileDetailContainer.topAnchor, constant: 20).isActive = true
        accountNameLabel.leftAnchor.constraint(equalTo: profileDetailContainer.leftAnchor, constant: 20).isActive = true
        accountNameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountNameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        profileName.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 4).isActive = true
        profileName.leftAnchor.constraint(equalTo: profileDetailContainer.leftAnchor, constant: 20).isActive = true
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
                    iv.image = UIImage(named: "check_icon")
                    //iv.backgroundColor = .green
                    //iv.layer.cornerRadius = 9
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
                    label.text = "Personal Information"
                    label.textColor = Utilities.getColorWithHexString("#8A8B8A")
                    label.font = UIFont.boldSystemFont(ofSize: 14)
                    label.translatesAutoresizingMaskIntoConstraints = false
                    return label
                }()
                
                let divider : UIView = {
                    let v = UIView()
                    v.translatesAutoresizingMaskIntoConstraints = false
                    v.backgroundColor = textGray
                
                    return v
                }()
                
                v.addSubview(extraDetailImage)
                v.addSubview(extraDetailDescription)
                v.addSubview(extraDetailForward)
                v.addSubview(divider)
                
                
                extraDetailForward.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                extraDetailForward.rightAnchor.constraint(equalTo: v.rightAnchor, constant: -20).isActive = true
                extraDetailForward.widthAnchor.constraint(equalToConstant: 8).isActive = true
                extraDetailForward.heightAnchor.constraint(equalToConstant: 8).isActive = true
                
                
                extraDetailImage.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                extraDetailImage.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 20).isActive = true
                extraDetailImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
                extraDetailImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
                
                extraDetailDescription.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                extraDetailDescription.leftAnchor.constraint(equalTo: extraDetailImage.rightAnchor, constant:10).isActive = true
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

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}




