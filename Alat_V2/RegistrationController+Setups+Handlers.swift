//
//  RegistrationController+Components+Handlers.swift
//  Alat_V2
//
//  Created by Eva on 28/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

extension RegistrationController {
    
    //      MARK: ACTION HANDLERS
    
    //Handlers for NavBar components
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleLeftNavCircleClicked() {
        containerForItemsControlledByLeftNavBarCircle.isHidden = false
        containerForItemsControlledByCenterNavBarCircle.isHidden = true
        containerForItemsControlledByRightNavBarCircle.isHidden = true
        
        leftNavBarOuterCircleView.image = UIImage(named: "left_minigradient_background")
        leftNavBarInnerCircleView.image = UIImage(named: "white_background")
        leftNavBarCircleImageView.image = UIImage(named: "left-navbarImage-color")
        
        centerNavBarOuterCircleView.image = UIImage(named: "white_background")
        centerNavBarInnerCircleView.image = UIImage(named: "center_minigradient_background")
        centerNavBarCircleImageView.image = UIImage(named: "center-navbarImage-white")
        
        rightNavBarOuterCircleView.image = UIImage(named: "white_background")
        rightNavBarInnerCircleView.image = UIImage(named: "right_minigradient_background")
        rightNavBarCircleImageView.image = UIImage(named: "right-navbarImage-white")
        
    }
    
    func handleCenterNavCircleClicked() {
        containerForItemsControlledByCenterNavBarCircle.isHidden = false
        containerForItemsControlledByLeftNavBarCircle.isHidden = true
        containerForItemsControlledByRightNavBarCircle.isHidden = true
        
        leftNavBarOuterCircleView.image = UIImage(named: "white_background")
        leftNavBarInnerCircleView.image = UIImage(named: "left_minigradient_background")
        leftNavBarCircleImageView.image = UIImage(named: "left-navbarImage-white")
        
        centerNavBarOuterCircleView.image = UIImage(named: "center_minigradient_background")
        centerNavBarInnerCircleView.image = UIImage(named: "white_background")
        centerNavBarCircleImageView.image = UIImage(named: "center-navbarImage-color")
        
        rightNavBarOuterCircleView.image = UIImage(named: "white_background")
        rightNavBarInnerCircleView.image = UIImage(named: "right_minigradient_background")
        rightNavBarCircleImageView.image = UIImage(named: "right-navbarImage-white")
        
    }
    
    func handleRightNavCircleClicked() {
        containerForItemsControlledByRightNavBarCircle.isHidden = false
        containerForItemsControlledByLeftNavBarCircle.isHidden = true
        containerForItemsControlledByCenterNavBarCircle.isHidden = true
        
        leftNavBarOuterCircleView.image = UIImage(named: "white_background")
        leftNavBarInnerCircleView.image = UIImage(named: "left_minigradient_background")
        leftNavBarCircleImageView.image = UIImage(named: "left-navbarImage-white")
        
        centerNavBarOuterCircleView.image = UIImage(named: "white_background")
        centerNavBarInnerCircleView.image = UIImage(named: "center_minigradient_background")
        centerNavBarCircleImageView.image = UIImage(named: "center-navbarImage-white")
        
        rightNavBarOuterCircleView.image = UIImage(named: "right_minigradient_background")
        rightNavBarInnerCircleView.image = UIImage(named: "white_background")
        rightNavBarCircleImageView.image = UIImage(named: "right-navbarImage-color")
        
    }
    
    
    
    //Handlers for LeftNavBarCircle
    func handleSkipBVN(){
        print("skip button pressed")
    }
    
    func handleCantRememberBVN() {
        print("forgot my bvn")
    }
    
    
    func handleLogin() {
        
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let contentController = UINavigationController(rootViewController: homeController)
        let menuVC = SideMenuVC(collectionViewLayout: UICollectionViewFlowLayout())
        let rootViewController = RootVC(contentViewController: contentController, menuViewController: menuVC)
        
        present(rootViewController, animated: false, completion: nil)
        
        
    }
    
    
    func handleCenterNavNext() {
        handleRightNavCircleClicked()
        centerNavBarCheckImageView.isHidden = false
    }
    
    
    func createDatePicker() {
        //creates a tool bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //creates a "Done" button on toolbar to be clicked when user is done picking date
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(handleDonePickingDate))
        toolbar.setItems([doneButton], animated: true)
        
        datePickerTextField.inputAccessoryView = toolbar
        datePickerTextField.inputView = birthDayDatePicker
        
        //set minimum and maximum dates
        
    }
    
    func createPickerView(){
        //creates a tool bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //creates a "Done" button on toolbar to be clicked when user is done picking date
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(handleDonePickingQuestion))
        toolbar.setItems([doneButton], animated: true)
        
        securityQuestionTextField.inputAccessoryView = toolbar
        securityQuestionTextField.inputView = securityQuestionPicker
    }
    
    func handleDonePickingQuestion() {
        self.view.endEditing(true)
    }
    
    func handleDonePickingDate() {
        //formats date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .none
        
        datePickerTextField.text = dateFormatter.string(from: birthDayDatePicker.date)
        self.view.endEditing(true)
    }
    
    func handleNext() {
        handleCenterNavCircleClicked()
        
        leftNavBarCheckImageView.isHidden = false
        
    }
    
    
    
    
    func hideUneededSubviews() {
        containerForItemsControlledByCenterNavBarCircle.isHidden = true
        containerForItemsControlledByRightNavBarCircle.isHidden = true
    }
    
    
    
    
    
    //      MARK: SETTING AUTOLAYOUT CONSTRAINTS
    
    //Adding constraints for NavBar
    func setupNavBarContainer() {
        
        navBarContainer.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        navBarContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navBarContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4, constant: 10).isActive = true
    }
    
    func setupBackgroundImageView() {
        backgroundImageView.anchorToTop(top: navBarContainer.topAnchor, left: navBarContainer.leftAnchor, bottom: navBarContainer.bottomAnchor, right: navBarContainer.rightAnchor)
    }
    
    func setupBackButton() {
        backButton.anchorWithConstantsToTop(top: navBarContainer.topAnchor, left: navBarContainer.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLeftNavBarOuterCircleView() {
        leftNavBarOuterCircleView.anchorWithConstantsToTop(top: nil, left: navBarContainer.leftAnchor, bottom: navBarContainer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 30, rightConstant: 0)
        leftNavBarOuterCircleView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        leftNavBarOuterCircleView.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    func setupLefttNavBarInnerCircleView() {
        leftNavBarInnerCircleView.centerXAnchor.constraint(equalTo: leftNavBarOuterCircleView.centerXAnchor).isActive = true
        leftNavBarInnerCircleView.centerYAnchor.constraint(equalTo: leftNavBarOuterCircleView.centerYAnchor).isActive = true
        leftNavBarInnerCircleView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        leftNavBarInnerCircleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupLeftNavBarCircleImageView() {
        leftNavBarCircleImageView.centerXAnchor.constraint(equalTo: leftNavBarInnerCircleView.centerXAnchor).isActive = true
        leftNavBarCircleImageView.centerYAnchor.constraint(equalTo: leftNavBarInnerCircleView.centerYAnchor).isActive = true
        leftNavBarCircleImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        leftNavBarCircleImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setupLeftNavBarCheckImageView() {
        leftNavBarCheckImageView.anchorWithConstantsToTop(top: nil, left: nil, bottom: leftNavBarOuterCircleView.bottomAnchor, right: leftNavBarOuterCircleView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -21)
        leftNavBarCheckImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftNavBarCheckImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupCenterNavBarOuterCircleView() {
        centerNavBarOuterCircleView.centerXAnchor.constraint(equalTo: navBarContainer.centerXAnchor).isActive = true
        centerNavBarOuterCircleView.anchorWithConstantsToTop(top: nil, left: nil, bottom: navBarContainer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 0)
        centerNavBarOuterCircleView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        centerNavBarOuterCircleView.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    func setupCenterNavBarInnerCircleView() {
        centerNavBarInnerCircleView.centerXAnchor.constraint(equalTo: centerNavBarOuterCircleView.centerXAnchor).isActive = true
        centerNavBarInnerCircleView.centerYAnchor.constraint(equalTo: centerNavBarOuterCircleView.centerYAnchor).isActive = true
        centerNavBarInnerCircleView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        centerNavBarInnerCircleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupCenterNavBarCircleImageView() {
        centerNavBarCircleImageView.centerXAnchor.constraint(equalTo: centerNavBarInnerCircleView.centerXAnchor).isActive = true
        centerNavBarCircleImageView.centerYAnchor.constraint(equalTo: centerNavBarInnerCircleView.centerYAnchor).isActive = true
        centerNavBarCircleImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        centerNavBarCircleImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setupCenterNavBarCheckImageView() {
        centerNavBarCheckImageView.anchorWithConstantsToTop(top: nil, left: nil, bottom: centerNavBarOuterCircleView.bottomAnchor, right: centerNavBarOuterCircleView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -21)
        centerNavBarCheckImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        centerNavBarCheckImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupRightNavBarOuterCircleView() {
        rightNavBarOuterCircleView.anchorWithConstantsToTop(top: nil, left: nil, bottom: navBarContainer.bottomAnchor, right: navBarContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 30)
        rightNavBarOuterCircleView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        rightNavBarOuterCircleView.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    func setupRightNavBarInnerCircleView() {
        rightNavBarInnerCircleView.centerXAnchor.constraint(equalTo: rightNavBarOuterCircleView.centerXAnchor).isActive = true
        rightNavBarInnerCircleView.centerYAnchor.constraint(equalTo: rightNavBarOuterCircleView.centerYAnchor).isActive = true
        rightNavBarInnerCircleView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        rightNavBarInnerCircleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    func setupRightNavBarCircleImageView() {
        rightNavBarCircleImageView.centerXAnchor.constraint(equalTo: rightNavBarInnerCircleView.centerXAnchor).isActive = true
        rightNavBarCircleImageView.centerYAnchor.constraint(equalTo: rightNavBarInnerCircleView.centerYAnchor).isActive = true
        rightNavBarCircleImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        rightNavBarCircleImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setupConnectingLineView() {
        connectingLineView.anchorWithConstantsToTop(top: nil, left: leftNavBarOuterCircleView.rightAnchor, bottom: navBarContainer.bottomAnchor, right: rightNavBarOuterCircleView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 53, rightConstant: 0)
        connectingLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    
    //      MARK: Adding constraint for individual containers
    
    func setupContainerForAllControlledElements() {
        containerForAllControlledElements.anchorToTop(top: navBarContainer.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setupContainerForItemsControlledByLeftNavBarCircle() {
        containerForItemsControlledByLeftNavBarCircle.anchorToTop(top: containerForAllControlledElements.topAnchor, left: containerForAllControlledElements.leftAnchor, bottom: containerForAllControlledElements.bottomAnchor, right: containerForAllControlledElements.rightAnchor)
    }
    
    func setupContainerForItemsControlledByCenterNavBarCircle() {
        containerForItemsControlledByCenterNavBarCircle.anchorToTop(top: containerForAllControlledElements.topAnchor, left: containerForAllControlledElements.leftAnchor, bottom: containerForAllControlledElements.bottomAnchor, right: containerForAllControlledElements.rightAnchor)
        
    }
    
    func setupContainerForItemsControlledByRightNavBarCircle() {
        containerForItemsControlledByRightNavBarCircle.anchorToTop(top: containerForAllControlledElements.topAnchor, left: containerForAllControlledElements.leftAnchor, bottom: containerForAllControlledElements.bottomAnchor, right: containerForAllControlledElements.rightAnchor)
    }
    
    
    //      MARK: Adding constraints to items in the container controlled by leftNavBarCircle
    func setupLeftNavBarUserInputContainer() {
        leftNavBarUserInputContainer.centerXAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarCircle.centerXAnchor).isActive = true
        leftNavBarUserInputContainer.centerYAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarCircle.centerYAnchor, constant: -35).isActive = true
        leftNavBarUserInputContainer.widthAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarCircle.widthAnchor, constant: -70).isActive = true
        leftNavBarUserInputContainer.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    func setupTitleTextLabel() {
        titleTextLabel.anchorWithConstantsToTop(top: containerForItemsControlledByLeftNavBarCircle.topAnchor, left: containerForItemsControlledByLeftNavBarCircle.leftAnchor, bottom: nil, right: nil, topConstant: 35, leftConstant: 35, bottomConstant: 0, rightConstant: 0)
        titleTextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupSkipBVNButton() {
        skipBVNButton.anchorWithConstantsToTop(top: containerForItemsControlledByLeftNavBarCircle.topAnchor, left: nil, bottom: nil, right: containerForItemsControlledByLeftNavBarCircle.rightAnchor, topConstant: 35, leftConstant: 0, bottomConstant: 0, rightConstant: 35)
        skipBVNButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        skipBVNButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupUserBVNInputTextField() {
        userBVNInputTextField.anchorToTop(top: leftNavBarUserInputContainer.topAnchor, left: leftNavBarUserInputContainer.leftAnchor, bottom: nil, right: leftNavBarUserInputContainer.rightAnchor)
        userBVNInputTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupUserBVNSeparator() {
        userBVNSeparator.anchorWithConstantsToTop(top: userBVNInputTextField.bottomAnchor, left: leftNavBarUserInputContainer.leftAnchor, bottom: nil, right: leftNavBarUserInputContainer.rightAnchor, topConstant: 2, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        userBVNSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupDatePickerTextField() {
        datePickerTextField.anchorWithConstantsToTop(top: nil, left: leftNavBarUserInputContainer.leftAnchor, bottom: datePickerSeparator.topAnchor, right: leftNavBarUserInputContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        datePickerTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupDatePickerSeparator() {
        datePickerSeparator.anchorToTop(top: nil, left: leftNavBarUserInputContainer.leftAnchor, bottom: leftNavBarUserInputContainer.bottomAnchor, right: leftNavBarUserInputContainer.rightAnchor)
        datePickerSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupCantRememberBVNButton() {
        
        cantRememberBVNButton.anchorWithConstantsToTop(top: leftNavBarUserInputContainer.bottomAnchor, left: leftNavBarUserInputContainer.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: -5, bottomConstant: 0, rightConstant: 0)
        cantRememberBVNButton.widthAnchor.constraint(equalTo: leftNavBarUserInputContainer.widthAnchor, multiplier: 0.6).isActive = true
        cantRememberBVNButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func setupNextButton() {
        nextButton.centerXAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarCircle.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarCircle.bottomAnchor, constant: -60).isActive = true
        nextButton.widthAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarCircle.widthAnchor, constant: -70).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    //      MARK: Adding constraints to items in the container controlled by centerNavBarCircle
    func setupScrollView() {
        
        scrollView.anchorToTop(top: containerForItemsControlledByCenterNavBarCircle.topAnchor, left: containerForItemsControlledByCenterNavBarCircle.leftAnchor, bottom: nil, right: containerForItemsControlledByCenterNavBarCircle.rightAnchor)
        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
    }
    
    func setupCenterNavUserInputContainer() {
        centerNavUserInputContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        centerNavUserInputContainer.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        centerNavUserInputContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -70).isActive = true
        centerNavUserInputContainer.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -70).isActive = true
    }
    
    func setupRegistrationTitleLabel() {
        registrationTitleLabel.anchorToTop(top: centerNavUserInputContainer.topAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: nil)
        registrationTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        registrationTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupEmailTextField() {
        emailTextField.anchorWithConstantsToTop(top: registrationTitleLabel.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        emailTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupEmailSeparator(){
        emailSeparator.anchorToTop(top: emailTextField.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor)
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.anchorWithConstantsToTop(top: emailSeparator.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        passwordTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupPasswordSeparator() {
        passwordSeparator.anchorToTop(top: passwordTextField.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor)
        passwordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupConfirmPasswordTextField() {
        confirmPasswordTextField.anchorWithConstantsToTop(top: passwordSeparator.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupConfirmPasswordSeparator() {
        confirmPasswordSeparator.anchorToTop(top: confirmPasswordTextField.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor)
        confirmPasswordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupSecurityQuestionTextField() {
        securityQuestionTextField.anchorWithConstantsToTop(top: confirmPasswordSeparator.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        securityQuestionTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupSecurityQuestionSeparator() {
        securityQuestionSeparator.anchorToTop(top: securityQuestionTextField.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor)
        securityQuestionSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupSecurityAnswerTextField() {
        securityAnswerTextField.anchorWithConstantsToTop(top: securityQuestionSeparator.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        securityAnswerTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupSecurityAnswerSeparator() {
        securityAnswerSeparator.anchorToTop(top: securityAnswerTextField.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor)
        securityAnswerSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupCenterNavNextButton() {
        centerNavNextButton.anchorWithConstantsToTop(top: securityAnswerSeparator.bottomAnchor, left: centerNavUserInputContainer.leftAnchor, bottom: nil, right: centerNavUserInputContainer.rightAnchor, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        centerNavNextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSecurityQuestionRightView() {
        securityQuestionRightView.anchorToTop(top: securityQuestionTextField.topAnchor, left: nil, bottom: securityQuestionTextField.bottomAnchor, right: securityQuestionTextField.rightAnchor)
        securityQuestionRightView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        securityQuestionRightView.heightAnchor.constraint(equalTo: securityQuestionTextField.heightAnchor).isActive = true
    }
    
    func setupDownArrowImageView() {
        downArrowImageView.anchorToTop(top: securityQuestionRightView.topAnchor, left: securityQuestionRightView.leftAnchor, bottom: securityQuestionRightView.bottomAnchor, right: securityQuestionRightView.rightAnchor)
    }
    
    
    //      MARK: Adding constraints to items in the container controlled by rightNavBarCircle
    func setupRightNavBarUserInputContainer() {
        rightNavBarUserInputContainer.centerXAnchor.constraint(equalTo: containerForItemsControlledByRightNavBarCircle.centerXAnchor).isActive = true
        rightNavBarUserInputContainer.centerYAnchor.constraint(equalTo: containerForItemsControlledByRightNavBarCircle.centerYAnchor, constant: -50).isActive = true
        rightNavBarUserInputContainer.widthAnchor.constraint(equalTo: containerForItemsControlledByRightNavBarCircle.widthAnchor, constant: -70).isActive = true
        rightNavBarUserInputContainer.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
    }
    
    func setupLoginTextLabel() {
        loginTextLabel.anchorWithConstantsToTop(top: containerForItemsControlledByRightNavBarCircle.topAnchor, left: containerForItemsControlledByRightNavBarCircle.leftAnchor, bottom: nil, right: nil, topConstant: 35, leftConstant: 35, bottomConstant: 0, rightConstant: 0)
        loginTextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupRightNavEmailLabel() {
        rightNavEmailLabel.anchorToTop(top: rightNavBarUserInputContainer.topAnchor, left: rightNavBarUserInputContainer.leftAnchor, bottom: nil, right: rightNavBarUserInputContainer.rightAnchor)
        rightNavEmailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func setupRightNavEmailTextField() {
        rightNavEmailTextField.anchorToTop(top: rightNavEmailLabel.bottomAnchor, left: rightNavBarUserInputContainer.leftAnchor, bottom: nil, right: rightNavBarUserInputContainer.rightAnchor)
        rightNavEmailTextField.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
    }
    
    func setupRightNavEmailSeparator() {
        rightNavEmailSeparator.anchorWithConstantsToTop(top: rightNavEmailTextField.bottomAnchor, left: rightNavBarUserInputContainer.leftAnchor, bottom: nil, right: rightNavBarUserInputContainer.rightAnchor, topConstant: 2, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        rightNavEmailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupRightNavPasswordLabel() {
        rightNavPasswordLabel.anchorWithConstantsToTop(top: nil, left: rightNavBarUserInputContainer.leftAnchor, bottom: rightNavPasswordTextField.topAnchor, right: rightNavBarUserInputContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        rightNavPasswordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func setupRightNavPasswordTextField() {
        rightNavPasswordTextField.anchorWithConstantsToTop(top: nil, left: rightNavBarUserInputContainer.leftAnchor, bottom: rightNavPasswordSeparator.topAnchor, right: rightNavBarUserInputContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        rightNavPasswordTextField.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    func setupRightNavPasswordSeparator() {
        rightNavPasswordSeparator.anchorToTop(top: nil, left: rightNavBarUserInputContainer.leftAnchor, bottom: rightNavBarUserInputContainer.bottomAnchor, right: rightNavBarUserInputContainer.rightAnchor)
        rightNavPasswordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: containerForItemsControlledByRightNavBarCircle.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: containerForItemsControlledByRightNavBarCircle.bottomAnchor, constant: -60).isActive = true
        loginButton.widthAnchor.constraint(equalTo: containerForItemsControlledByRightNavBarCircle.widthAnchor, constant: -70).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
}
