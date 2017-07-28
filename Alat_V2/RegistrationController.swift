//
//  RegistrationController.swift
//  Alat_V2
//
//  Created by Eva on 26/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let securityQuestions = ["1. Security Question 1","2. Security Question 2","3. Security Question 3","3. Security Question 3","4. Security Question 4","5. Security Question 5"]

//      MARK: NavBar Items
    let navBarContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gradient_background")
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
    
    let leftNavBarOuterCircleView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "left_minigradient_background")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 23
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var leftNavBarInnerCircleView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "white_background")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLeftNavCircleClicked)))
        return imageView

    }()

    
    lazy var leftNavBarCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "left-navbarImage-color")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLeftNavCircleClicked)))
        return imageView
    }()
    
    let centerNavBarOuterCircleView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "white_background")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 23
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var centerNavBarInnerCircleView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "center_minigradient_background")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCenterNavCircleClicked)))
        return imageView
        
    }()
    
    
    lazy var centerNavBarCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "center-navbarImage-white")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCenterNavCircleClicked)))
        return imageView
    }()
    
    let rightNavBarOuterCircleView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "white_background")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 23
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var rightNavBarInnerCircleView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "right_minigradient_background")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRightNavCircleClicked)))
        return imageView
        
    }()
    
    
    lazy var rightNavBarCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "right-navbarImage-white")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRightNavCircleClicked)))
        return imageView
    }()
    
    let connectingLineView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
//      MARK: Creating individual containers
    let containerForAllControlledElements: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let containerForItemsControlledByLeftNavBarCircle: UIView = {
       let view = UIView()
        return view
    }()

    let containerForItemsControlledByCenterNavBarCircle: UIView = {
        let view = UIView()
        return view
    }()
    
    let containerForItemsControlledByRightNavBarCircle: UIView = {
        let view = UIView()
        return view
    }()
    
    let leftNavBarUserInputContainer: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    
//      MARK: Creating items controlled by left NavBarCircle
    
    let titleTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Identification"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return label
    }()
    
    lazy var skipBVNButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Skip BVN", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(handleSkipBVN), for: .touchUpInside)
        return button
    }()
    
    let userBVNInputTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your 14 digits BVN"
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let userBVNSeparator: UIView = {
        let view = UIView()
         view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()

    
    lazy var cantRememberBVNButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I can't remember my BVN", for: .normal)
        button.setTitleColor(UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1), for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(handleCantRememberBVN), for: .touchUpInside)
        return button
    }()
    
    //creates a textfield to hold the date picker
    let datePickerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Select your date of Birth"
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let birthDayDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        return datePicker
    }()
    
    let datePickerSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()

    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    
//      MARK: Creating items controlled by center NavBarCircle
    
    lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = true
        scroll.isUserInteractionEnabled = true
        scroll.isMultipleTouchEnabled  = true
        scroll.bounces = true
        scroll.keyboardDismissMode = UIScrollViewKeyboardDismissMode(rawValue: 2)!
        scroll.delegate = self
        return scroll
    }()
    
    let centerNavUserInputContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    let registrationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registration"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email address"
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let emailSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let passwordSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()

    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let confirmPasswordSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()

    
    let securityQuestionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Security Question"
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let securityQuestionRightView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let downArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "down_arrow_color")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    lazy var securityQuestionPicker: UIPickerView = {
       let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    let securityQuestionSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()

    
    let securityAnswerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Answer to Security Question"
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let securityAnswerSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()
    
    lazy var centerNavNextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCenterNavNext), for: .touchUpInside)
        return button
    }()



//      MARK: Creating items controlled by right NavBarCircle
    
    
    let rightNavBarUserInputContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let loginTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return label
    }()
    
    let rightNavEmailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email address"
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    let rightNavEmailSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()
    
    let rightNavPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()


    
    let rightNavPasswordSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1)
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()



    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets the length of the scrollView in the centerNavBar container
        scrollView.contentSize = CGSize(width: 300, height: 1200)
        
        //Adds the container for holding all navBar items to main view
        view.addSubview(navBarContainer)
        
//      MARK: Adds all navBar items to the navBar container
        navBarContainer.addSubview(backgroundImageView)
        navBarContainer.addSubview(connectingLineView)
        navBarContainer.addSubview(backButton)
        navBarContainer.addSubview(leftNavBarOuterCircleView)
        leftNavBarOuterCircleView.addSubview(leftNavBarInnerCircleView)
        leftNavBarInnerCircleView.addSubview(leftNavBarCircleImageView)
        navBarContainer.addSubview(centerNavBarOuterCircleView)
        centerNavBarOuterCircleView.addSubview(centerNavBarInnerCircleView)
        centerNavBarInnerCircleView.addSubview(centerNavBarCircleImageView)
        navBarContainer.addSubview(rightNavBarOuterCircleView)
        rightNavBarOuterCircleView.addSubview(rightNavBarInnerCircleView)
        rightNavBarInnerCircleView.addSubview(rightNavBarCircleImageView)
        
        //Adds the container for holding all various navBarControlledContainers to main view
        view.addSubview(containerForAllControlledElements)
        
        //Adds all the various navbarCircles to a single container
        containerForAllControlledElements.addSubview(containerForItemsControlledByLeftNavBarCircle)
        containerForAllControlledElements.addSubview(containerForItemsControlledByCenterNavBarCircle)
        containerForAllControlledElements.addSubview(containerForItemsControlledByRightNavBarCircle)
        
//      MARK: Adds all components controlled by leftNavBarCircle (Identification page) to appropriate views
        containerForItemsControlledByLeftNavBarCircle.addSubview(leftNavBarUserInputContainer)
        containerForItemsControlledByLeftNavBarCircle.addSubview(titleTextLabel)
        containerForItemsControlledByLeftNavBarCircle.addSubview(skipBVNButton)
        leftNavBarUserInputContainer.addSubview(userBVNInputTextField)
        leftNavBarUserInputContainer.addSubview(userBVNSeparator)
        leftNavBarUserInputContainer.addSubview(cantRememberBVNButton)
        leftNavBarUserInputContainer.addSubview(datePickerSeparator)
        leftNavBarUserInputContainer.addSubview(datePickerTextField)
        containerForItemsControlledByLeftNavBarCircle.addSubview(nextButton)
        
//      MARK: Adds all components controlled by centerNavBarCircle (Registration page) to appropriate views
        containerForItemsControlledByCenterNavBarCircle.addSubview(scrollView)
        scrollView.addSubview(centerNavUserInputContainer)
        centerNavUserInputContainer.addSubview(registrationTitleLabel)
        centerNavUserInputContainer.addSubview(emailTextField)
        centerNavUserInputContainer.addSubview(emailSeparator)
        centerNavUserInputContainer.addSubview(passwordTextField)
        centerNavUserInputContainer.addSubview(passwordSeparator)
        centerNavUserInputContainer.addSubview(confirmPasswordTextField)
        centerNavUserInputContainer.addSubview(confirmPasswordSeparator)
        centerNavUserInputContainer.addSubview(securityQuestionTextField)
        centerNavUserInputContainer.addSubview(securityQuestionSeparator)
        centerNavUserInputContainer.addSubview(securityAnswerTextField)
        centerNavUserInputContainer.addSubview(securityAnswerSeparator)
        centerNavUserInputContainer.addSubview(centerNavNextButton)
        securityQuestionTextField.addSubview(securityQuestionRightView)
        securityQuestionRightView.addSubview(downArrowImageView)
        
        
//      MARK: Adds all components controlled by rightNavBarCircle (Login page) to appropriate views
        containerForItemsControlledByRightNavBarCircle.addSubview(rightNavBarUserInputContainer)
        containerForItemsControlledByRightNavBarCircle.addSubview(loginTextLabel)
        containerForItemsControlledByRightNavBarCircle.addSubview(rightNavEmailTextField)
        containerForItemsControlledByRightNavBarCircle.addSubview(rightNavEmailSeparator)
        containerForItemsControlledByRightNavBarCircle.addSubview(rightNavPasswordTextField)
        containerForItemsControlledByRightNavBarCircle.addSubview(rightNavPasswordSeparator)
        containerForItemsControlledByRightNavBarCircle.addSubview(loginButton)
        
        
//      MARK: Calls autolayout functions for menu bar items
        setupNavBarContainer()
        setupBackgroundImageView()
        setupBackButton()
        setupLeftNavBarOuterCircleView()
        setupLefttNavBarInnerCircleView()
        setupLeftNavBarCircleImageView()
        setupCenterNavBarOuterCircleView()
        setupCenterNavBarInnerCircleView()
        setupCenterNavBarCircleImageView()
        setupRightNavBarOuterCircleView()
        setupRightNavBarInnerCircleView()
        setupRightNavBarCircleImageView()
        setupConnectingLineView()
        
//      MARK: Calls autolayout functions for all view containers
        setupContainerForAllControlledElements()
        setupContainerForItemsControlledByLeftNavBarCircle()
        setupContainerForItemsControlledByCenterNavBarCircle()
        setupContainerForItemsControlledByRightNavBarCircle()
        
//      MARK: Calls autolayouts to components inside containerControlledByLeftNavBarCircle
        setupLeftNavBarUserInputContainer()
        setupTitleTextLabel()
        setupSkipBVNButton()
        setupUserBVNInputTextField()
        setupUserBVNSeparator()
        setupCantRememberBVNButton()
        setupDatePickerSeparator()
        setupDatePickerTextField()
        setupNextButton()
        
//      MARK: Calls autoLayouts to components insde containerControlledByCenterNavBarCircle
        setupScrollView()
        setupCenterNavUserInputContainer()
        setupRegistrationTitleLabel()
        setupEmailTextField()
        setupEmailSeparator()
        setupPasswordTextField()
        setupPasswordSeparator()
        setupConfirmPasswordTextField()
        setupConfirmPasswordSeparator()
        setupSecurityQuestionTextField()
        setupSecurityQuestionSeparator()
        setupSecurityAnswerTextField()
        setupSecurityAnswerSeparator()
        setupCenterNavNextButton()
        setupSecurityQuestionRightView()
        setupDownArrowImageView()
        
//      MARK: Calls autoLayout to components inside containerControlledByCenterNavBarCircle
        setupRightNavBarUserInputContainer()
        setupLoginTextLabel()
        setupRightNavEmailTextField()
        setupRightNavEmailSeparator()
        setupRightNavPasswordTextField()
        setupRightNavPasswordSeparator()
        setupLoginButton()
        
        
        createDatePicker()
        createPickerView()
        hideUneededSubviews()
        
    }
    
    
    
    
    
    //Implementing PickerView Delegate functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return securityQuestions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return securityQuestions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        securityQuestionTextField.text = securityQuestions[row]
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}

