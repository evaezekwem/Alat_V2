//
//  LoginController.swift
//  Alat_V2
//
//  Created by Zone 3 on 7/28/17.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit


class LoginController : UIViewController{

    override func viewDidLoad() {
        setupViews()
    }
    
    let emailTv: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Email Address"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.backgroundColor = nil
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSForegroundColorAttributeName: UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)])
        textField.textAlignment = .left
        return textField
    }()
    
    let emailTvDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        return view
    }()
    
    
    let passwordTv: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = " Password "
        text.font = UIFont.systemFont(ofSize: 12)
        text.isSecureTextEntry = true
        text.backgroundColor = nil
        text.textColor = .white
        text.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSForegroundColorAttributeName: UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)])
        text.textAlignment = .left
        return text
    }()
    
    let passwordTvDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gradient_background")
        return imageView
    }()

    let descriptionText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Welcome Back..."
        text.font = UIFont.systemFont(ofSize: 38)
        text.isEditable = false
        text.backgroundColor = nil
        text.textColor = .white
        text.textAlignment = .left
        return text
    }()
    
    let rightIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "phone")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let leftIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Alat-icon-white")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
 , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        return button
    }()
    
    func handleLogin() {
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let contentController = UINavigationController(rootViewController: homeController)
        
        present(contentController, animated: false, completion: nil)
        
        print("Login clicked")
    }

    func handleForgotPassword() {
        print("forgot password clicked")
    }
    
    func setupViews(){
        view.addSubview(backgroundImageView)
        view.addSubview(passwordTv)

        view.addSubview(passwordTvDivider)
        view.addSubview(emailTvDivider)
        view.addSubview(emailTv)
        
        view.addSubview(descriptionText)
        view.addSubview(rightIconImageView)
        view.addSubview(leftIconImageView)
        view.addSubview(loginButton)
        view.addSubview(forgotButton)


        
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        leftIconImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        leftIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        leftIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leftIconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        rightIconImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48).isActive = true
        rightIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        rightIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rightIconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionText.topAnchor.constraint(equalTo: leftIconImageView.bottomAnchor, constant: 48).isActive = true
        descriptionText.heightAnchor.constraint(equalToConstant: 180).isActive = true
        descriptionText.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        emailTv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTv.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailTv.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailTv.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48).isActive = true
        
        emailTvDivider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTvDivider.topAnchor.constraint(equalTo: emailTv.bottomAnchor, constant: 2).isActive = true
        emailTvDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailTvDivider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48).isActive = true
        
        
        passwordTv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTv.topAnchor.constraint(equalTo: emailTvDivider.bottomAnchor, constant: 48).isActive = true
        passwordTv.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordTv.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48).isActive = true
        
        passwordTvDivider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTvDivider.topAnchor.constraint(equalTo: passwordTv.bottomAnchor, constant: 2).isActive = true
        passwordTvDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        passwordTvDivider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48).isActive = true
        
        forgotButton.leftAnchor.constraint(equalTo: passwordTv.leftAnchor).isActive = true
        forgotButton.topAnchor.constraint(equalTo: passwordTv.bottomAnchor,constant: 4).isActive = true
        forgotButton.heightAnchor.constraint(equalToConstant: 12).isActive = true
        forgotButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTv.bottomAnchor, constant: 72).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.widthAnchor.constraint(equalTo: passwordTvDivider.widthAnchor).isActive = true
        

        
    
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}
