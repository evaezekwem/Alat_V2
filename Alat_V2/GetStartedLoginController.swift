//
//  GetStartedLoginController.swift
//  Alat_V2
//
//  Created by Eva on 26/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class GetStartedLoginController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gradient_background")
        return imageView
    }()
    
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "phone")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let leftIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Alat-icon-white")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let textAndButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabelText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Let's get started..."
        text.font = UIFont.systemFont(ofSize: 38)
        
        text.isEditable = false
        text.backgroundColor = nil
        text.textColor = .white
        text.textAlignment = .left
        return text
    }()
    
    let descriptionText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Your bank in your hand"
        text.font = UIFont.systemFont(ofSize: 24)
        text.isEditable = false
        text.backgroundColor = nil
        text.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        text.textAlignment = .left
        return text
    }()
    
    let countryCodeTextView: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "+234"
        text.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
        text.font = UIFont.systemFont(ofSize: 24)
        text.backgroundColor = nil
        text.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        text.textAlignment = .right
        return text
    }()
    
    let countryCodeSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        return view
    }()
    
    let userInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "7035643564"
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.backgroundColor = nil
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        textField.textAlignment = .left
        return textField
    }()
    
    let phoneNumberSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.7)
        return view
    }()
    
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Start", for: .normal)
        button.setTitleColor(textAndBackgroundRed , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(backgroundImageView)
        view.addSubview(containerView)
        containerView.addSubview(rightIconImageView)
        containerView.addSubview(leftIconImageView)
        containerView.addSubview(textAndButtonContainer)
        textAndButtonContainer.addSubview(titleLabelText)
        textAndButtonContainer.addSubview(descriptionText)
        textAndButtonContainer.addSubview(countryCodeTextView)
        textAndButtonContainer.addSubview(countryCodeSeparatorView)
        textAndButtonContainer.addSubview(userInputTextField)
        textAndButtonContainer.addSubview(phoneNumberSeparatorView)
        textAndButtonContainer.addSubview(startButton)
        
        //Sets constraints for views
        setupBackgroundImageView()
        setupContainerView()
        setupRightIconImageView()
        setupLeftIconImageView()
        setupTextAndButtonContainer()
        setupTitleLabelText()
        setupDescriptionText()
        setupCountryCodeTextView()
        setupCountryCodeSeparatorView()
        setupUserInputTextField()
        setupPhoneNumberSeparatorView()
        setupStartButton()
    }
    
    func handleStart() {
        let registrationController = RegistrationController()
        present(registrationController, animated: true, completion: nil)
       
    }
    
    func setupBackgroundImageView() {
        
        backgroundImageView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setupContainerView() {
        containerView.anchorToTop(top: backgroundImageView.topAnchor, left: backgroundImageView.leftAnchor, bottom: backgroundImageView.bottomAnchor, right: backgroundImageView.rightAnchor)
    }
    
    func setupRightIconImageView() {
        rightIconImageView.anchorWithConstantsToTop(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, topConstant: 60, leftConstant: 0, bottomConstant: 0, rightConstant: 40)
        rightIconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupLeftIconImageView() {
        leftIconImageView.anchorWithConstantsToTop(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 60, leftConstant: 40, bottomConstant: 0, rightConstant: 0)
        leftIconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        leftIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupTextAndButtonContainer() {
        textAndButtonContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        textAndButtonContainer.topAnchor.constraint(equalTo: leftIconImageView.bottomAnchor, constant: 50).isActive = true
        textAndButtonContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.75).isActive = true
        textAndButtonContainer.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.65).isActive = true
        
    }
    
    func setupTitleLabelText() {
        titleLabelText.leftAnchor.constraint(equalTo: textAndButtonContainer.leftAnchor).isActive = true
        titleLabelText.topAnchor.constraint(equalTo: textAndButtonContainer.topAnchor).isActive = true
        titleLabelText.widthAnchor.constraint(equalTo: textAndButtonContainer.widthAnchor).isActive = true
        titleLabelText.heightAnchor.constraint(equalTo: textAndButtonContainer.heightAnchor, multiplier: 1/4).isActive = true
        
    }
    
    func setupDescriptionText() {
        descriptionText.leftAnchor.constraint(equalTo: textAndButtonContainer.leftAnchor).isActive = true
        descriptionText.topAnchor.constraint(equalTo: titleLabelText.bottomAnchor, constant: 20).isActive = true
        descriptionText.widthAnchor.constraint(equalTo: textAndButtonContainer.widthAnchor).isActive = true
        descriptionText.heightAnchor.constraint(equalTo: textAndButtonContainer.heightAnchor, multiplier: 1/4).isActive = true
    }
    
    func setupCountryCodeTextView() {
        countryCodeTextView.anchorWithConstantsToTop(top: descriptionText.topAnchor, left: textAndButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        countryCodeTextView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        countryCodeTextView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
    }
    
    func setupCountryCodeSeparatorView() {
        countryCodeSeparatorView.anchorWithConstantsToTop(top: countryCodeTextView.bottomAnchor, left: textAndButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        countryCodeSeparatorView.widthAnchor.constraint(equalTo: countryCodeTextView.widthAnchor).isActive = true
        countryCodeSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setupUserInputTextField() {
        
        userInputTextField.anchorWithConstantsToTop(top: descriptionText.topAnchor, left: countryCodeTextView.rightAnchor, bottom: nil, right: nil, topConstant: 101, leftConstant: 5, bottomConstant: 0, rightConstant: 0)
        userInputTextField.widthAnchor.constraint(equalTo: textAndButtonContainer.widthAnchor, multiplier: 0.7).isActive = true
        userInputTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupPhoneNumberSeparatorView() {
        phoneNumberSeparatorView.anchorWithConstantsToTop(top: userInputTextField.bottomAnchor, left: countryCodeSeparatorView.rightAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 5, bottomConstant: 0, rightConstant: 0)
        phoneNumberSeparatorView.widthAnchor.constraint(equalTo: userInputTextField.widthAnchor).isActive = true
        phoneNumberSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setupStartButton() {
        startButton.anchorToTop(top: nil, left: textAndButtonContainer.leftAnchor, bottom: textAndButtonContainer.bottomAnchor, right: nil)
        startButton.widthAnchor.constraint(equalTo: textAndButtonContainer.widthAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}


