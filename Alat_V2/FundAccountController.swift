//
//  FundAccountController.swift
//  Alat_V2
//
//  Created by Eva on 30/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class FundAccountController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

//      MARK: NavBar Items
    let navBarContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gradient_background")
        return imageView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    let fundAccountText: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Fund Account"
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = .white
        text.textAlignment = NSTextAlignment.center
        return text
    }()
    
    lazy var rightNavBarIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "identityIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleProfile), for: .touchUpInside)
        return button
    }()
    
    let currentBalanceText: UILabel = {
        let text = UILabel()
        text.text = "Current Balance"
        text.font = UIFont.systemFont(ofSize: 10)
        text.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        text.textAlignment = NSTextAlignment.left
        return text
    }()

    let leftBalanceText: UILabel = {
        let text = UILabel()
        text.text = "N 00."
        text.font = UIFont.systemFont(ofSize: 34)
        text.textColor = .white
        text.textAlignment = NSTextAlignment.left
       return text
    }()

    let rightBalanceText: UILabel = {
        let text = UILabel()
        text.text = "00"
        text.font = UIFont.systemFont(ofSize: 18)
        text.textColor = .white
        text.textAlignment = NSTextAlignment.left
        return text
    }()
   
    
//      MARK: Creating container for controller tabs
    let containerForSquareTabs: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = textGray
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var leftNavBarSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = otherComponentsRed
        view.layer.cornerRadius = 7.5
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLeftSquareClicked)))
        return view
    }()
    
    lazy var centerNavBarSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7.5
        view.backgroundColor = .gray
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCenterSquareClicked)))
        return view
    }()

    lazy var rightNavBarSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7.5
        view.backgroundColor = .gray
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRightSquareClicked)))
        return view
    }()


    
//      MARK: Creating individual controlled containers
    let containerForAllControlledElements: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let containerForItemsControlledByLeftNavBarSquare: UIView = {
        let view = UIView()
//        view.backgroundColor = .red
        return view
    }()
    
    let containerForItemsControlledByCenterNavBarSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let containerForItemsControlledByRightNavBarSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    
    //      MARK: Creating items controlled by left NavBarSquare
    let leftNavBarUserInputContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        return view
    }()
    
    let amountText: UILabel = {
        let text = UILabel()
        text.text = "Amount (N)"
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = textAndBackgroundRed
        text.textAlignment = NSTextAlignment.left
        return text
    }()


    let amountInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = textGray
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.layer.borderColor = textGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        return textField
    }()

    let sourceText: UILabel = {
        let text = UILabel()
        text.text = "Source"
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = textAndBackgroundRed
        text.textAlignment = NSTextAlignment.left
        return text
    }()
    
    let sourcePickerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "  Select the source of the fund"
        textField.textColor = textGray
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.layer.borderColor = textGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        return textField
    }()

    lazy var sourcePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    lazy var fundButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = otherComponentsRed
        button.setTitle("Fund", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleFund), for: .touchUpInside)
        return button
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the container for holding all navBar items to main view
        view.addSubview(navBarContainer)
        
//      MARK: Adds all navBar items to the navBar container
        navBarContainer.addSubview(backgroundImageView)
        navBarContainer.addSubview(backButton)
        navBarContainer.addSubview(fundAccountText)
        navBarContainer.addSubview(rightNavBarIconButton)
        navBarContainer.addSubview(currentBalanceText)
        navBarContainer.addSubview(leftBalanceText)
        navBarContainer.addSubview(rightBalanceText)
        
        //Adds the container for holding controller square tabs
        view.addSubview(containerForSquareTabs)
        containerForSquareTabs.addSubview(leftNavBarSquare)
        containerForSquareTabs.addSubview(centerNavBarSquare)
        containerForSquareTabs.addSubview(rightNavBarSquare)
        
        //Adds the container for holding all various navBarControlledContainers to main view
        view.addSubview(containerForAllControlledElements)
        
        //Adds all the various navBarSquares to a single container
        containerForAllControlledElements.addSubview(containerForItemsControlledByLeftNavBarSquare)
        containerForAllControlledElements.addSubview(containerForItemsControlledByCenterNavBarSquare)
        containerForAllControlledElements.addSubview(containerForItemsControlledByRightNavBarSquare)
        
//      MARK: Adds all components controlled by leftNavBarSquare to appropriate views
        containerForItemsControlledByLeftNavBarSquare.addSubview(leftNavBarUserInputContainer)
        leftNavBarUserInputContainer.addSubview(amountText)
        leftNavBarUserInputContainer.addSubview(amountInputTextField)
        leftNavBarUserInputContainer.addSubview(sourceText)
        leftNavBarUserInputContainer.addSubview(sourcePickerTextField)
        containerForItemsControlledByLeftNavBarSquare.addSubview(fundButton)


//      MARK: Calls autolayout functions for menu bar items
        setupNavBarContainer()
        setupBackgroundImageView()
        setupBackButton()
        setupFundAccountText()
        setupRightNavBarIconButton()
        setupCurrentBalanceText()
        setupLeftBalanceText()
        setupRightBalanceText()
        
//      MARK: Calls autolayout functions for navBarSquares
        setupContainerForSquareTabs()
        setupLeftNavBarSquare()
        setupCenterNavBarSquare()
        setupRightNavBarSquare()
        
//      MARK: Calls autolayout functions for all view containers
        setupContainerForAllControlledElements()
        setupContainerForItemsControlledByLeftNavBarSquare()
        setupContainerForItemsControlledByCenterNavBarSquare()
        setupContainerForItemsControlledByRightNavBarSquare()
        
//      MARK: Calls autolayout functions for all components in containerForItemsControlledByLeftNavBarSquare
        setupLeftNavBarUserInputContainer()
        setupAmountText()
        setupAmountInputTextField()
        setupSourceText()
        setupSourcePickerTextField()
        setupFundButton()
        
        hideUneededSubviews()
    }

    func handleFund() {
        print("fund clicked")
    }
    
    func handleLeftSquareClicked() {
        leftNavBarSquare.backgroundColor = otherComponentsRed
        centerNavBarSquare.backgroundColor = .gray
        rightNavBarSquare.backgroundColor = .gray
        
        containerForItemsControlledByLeftNavBarSquare.isHidden = false
        containerForItemsControlledByCenterNavBarSquare.isHidden = true
        containerForItemsControlledByRightNavBarSquare.isHidden = true
        
    }
    
    func handleCenterSquareClicked() {
        leftNavBarSquare.backgroundColor = .gray
        centerNavBarSquare.backgroundColor = otherComponentsRed
        rightNavBarSquare.backgroundColor = .gray
        
        containerForItemsControlledByLeftNavBarSquare.isHidden = true
        containerForItemsControlledByCenterNavBarSquare.isHidden = false
        containerForItemsControlledByRightNavBarSquare.isHidden = true
    }
    
    func handleRightSquareClicked() {
        leftNavBarSquare.backgroundColor = .gray
        centerNavBarSquare.backgroundColor = .gray
        rightNavBarSquare.backgroundColor = otherComponentsRed
        
        containerForItemsControlledByLeftNavBarSquare.isHidden = true
        containerForItemsControlledByCenterNavBarSquare.isHidden = true
        containerForItemsControlledByRightNavBarSquare.isHidden = false
    }
    
    func handleProfile() {
        print("profile button clicked")
    }
    
    func handleBack() {
        dismiss(animated: false, completion: nil)
    }
    
    func hideUneededSubviews() {
        containerForItemsControlledByCenterNavBarSquare.isHidden = true
        containerForItemsControlledByRightNavBarSquare.isHidden = true
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
    
    func setupFundAccountText() {
        fundAccountText.centerXAnchor.constraint(equalTo: navBarContainer.centerXAnchor).isActive = true
        fundAccountText.anchorWithConstantsToTop(top: navBarContainer.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        fundAccountText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        fundAccountText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupRightNavBarIconButton() {
        rightNavBarIconButton.anchorWithConstantsToTop(top: navBarContainer.topAnchor, left: nil, bottom: nil, right: navBarContainer.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 20)
        rightNavBarIconButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        rightNavBarIconButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setupCurrentBalanceText() {
        currentBalanceText.anchorWithConstantsToTop(top: nil, left: navBarContainer.leftAnchor, bottom: leftBalanceText.topAnchor, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 0)
        currentBalanceText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        currentBalanceText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupLeftBalanceText() {
        leftBalanceText.anchorWithConstantsToTop(top: nil, left: navBarContainer.leftAnchor, bottom: navBarContainer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 20, rightConstant: 0)
    }
    
    func setupRightBalanceText() {
        rightBalanceText.anchorWithConstantsToTop(top: nil, left: leftBalanceText.rightAnchor, bottom: navBarContainer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 25, rightConstant: 0)

    }
    
//      MARK: Adding constraint for controller tabs
    
    func setupContainerForSquareTabs() {
        containerForSquareTabs.anchorToTop(top: navBarContainer.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        
        containerForSquareTabs.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLeftNavBarSquare() {
        leftNavBarSquare.leftAnchor.constraint(equalTo: containerForSquareTabs.leftAnchor, constant: 30).isActive = true
        leftNavBarSquare.centerYAnchor.constraint(equalTo: containerForSquareTabs.centerYAnchor).isActive = true
        leftNavBarSquare.widthAnchor.constraint(equalTo: leftNavBarSquare.heightAnchor).isActive = true
        leftNavBarSquare.heightAnchor.constraint(equalTo: containerForSquareTabs.heightAnchor, constant: -30).isActive = true
    }
    
    func setupCenterNavBarSquare() {
        centerNavBarSquare.centerXAnchor.constraint(equalTo: containerForSquareTabs.centerXAnchor).isActive = true
        centerNavBarSquare.centerYAnchor.constraint(equalTo: containerForSquareTabs.centerYAnchor).isActive = true
        centerNavBarSquare.widthAnchor.constraint(equalTo: centerNavBarSquare.heightAnchor).isActive = true
        centerNavBarSquare.heightAnchor.constraint(equalTo: containerForSquareTabs.heightAnchor, constant: -30).isActive = true
        
    }
    
    func setupRightNavBarSquare() {
        rightNavBarSquare.rightAnchor.constraint(equalTo: containerForSquareTabs.rightAnchor, constant: -30).isActive = true
        rightNavBarSquare.centerYAnchor.constraint(equalTo: containerForSquareTabs.centerYAnchor).isActive = true
        rightNavBarSquare.widthAnchor.constraint(equalTo: rightNavBarSquare.heightAnchor).isActive = true
        rightNavBarSquare.heightAnchor.constraint(equalTo: containerForSquareTabs.heightAnchor, constant: -30).isActive = true
    }
    
//      MARK: Adding constraint for individual containers
    
    func setupContainerForAllControlledElements() {
        containerForAllControlledElements.anchorToTop(top: containerForSquareTabs.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setupContainerForItemsControlledByLeftNavBarSquare() {
        containerForItemsControlledByLeftNavBarSquare.anchorToTop(top: containerForAllControlledElements.topAnchor, left: containerForAllControlledElements.leftAnchor, bottom: containerForAllControlledElements.bottomAnchor, right: containerForAllControlledElements.rightAnchor)
    }
    
    func setupContainerForItemsControlledByCenterNavBarSquare() {
        containerForItemsControlledByCenterNavBarSquare.anchorToTop(top: containerForAllControlledElements.topAnchor, left: containerForAllControlledElements.leftAnchor, bottom: containerForAllControlledElements.bottomAnchor, right: containerForAllControlledElements.rightAnchor)
        
    }
    
    func setupContainerForItemsControlledByRightNavBarSquare() {
        containerForItemsControlledByRightNavBarSquare.anchorToTop(top: containerForAllControlledElements.topAnchor, left: containerForAllControlledElements.leftAnchor, bottom: containerForAllControlledElements.bottomAnchor, right: containerForAllControlledElements.rightAnchor)
    }
    
    
    
//      MARK: Adding constraint for all components in containerForItemsControlledByLeftNavBarSquare    setupLeftNavBarUserInputContainer()
    func setupLeftNavBarUserInputContainer() {
        leftNavBarUserInputContainer.centerXAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarSquare.centerXAnchor).isActive = true
        leftNavBarUserInputContainer.topAnchor.constraint(equalTo: containerForSquareTabs.bottomAnchor, constant: 20).isActive = true
        leftNavBarUserInputContainer.widthAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarSquare.widthAnchor, constant: -60).isActive = true
        leftNavBarUserInputContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    
    func setupAmountText() {
        amountText.anchorToTop(top: leftNavBarUserInputContainer.topAnchor, left: leftNavBarUserInputContainer.leftAnchor, bottom: nil, right: nil)
        //amountText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //amountText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupAmountInputTextField() {
        amountInputTextField.anchorWithConstantsToTop(top: amountText.bottomAnchor, left: leftNavBarUserInputContainer.leftAnchor, bottom: nil, right: leftNavBarUserInputContainer.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        amountInputTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSourceText() {
        sourceText.anchorWithConstantsToTop(top: nil, left: leftNavBarUserInputContainer.leftAnchor, bottom: sourcePickerTextField.topAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0)
    }
    
    func setupSourcePickerTextField() {
        sourcePickerTextField.anchorToTop(top: nil, left: leftNavBarUserInputContainer.leftAnchor, bottom: leftNavBarUserInputContainer.bottomAnchor, right: leftNavBarUserInputContainer.rightAnchor)
        sourcePickerTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupFundButton() {
        fundButton.centerXAnchor.constraint(equalTo: containerForItemsControlledByLeftNavBarSquare.centerXAnchor).isActive = true
        fundButton.topAnchor.constraint(equalTo: leftNavBarUserInputContainer.bottomAnchor, constant: 30).isActive = true
        fundButton.widthAnchor.constraint(equalTo: leftNavBarUserInputContainer.widthAnchor).isActive = true
        fundButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


    
//    let sourcesForFundingAccount = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Title"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected")
    }
    
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
