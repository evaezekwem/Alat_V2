//
//  AccountOverviewController.swift
//  Alat_V2
//
//  Created by Eva on 31/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class AccountOverviewController: UIViewController {
    
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
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "menu_icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleMenu), for: .touchUpInside)
        return button
    }()
    
    let accountOverviewText: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Account Overview"
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
    
    let notificationIndicator: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 68/255, green: 219/255, blue: 94/255, alpha: 1)
        view.layer.cornerRadius = 5
        return view
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
    
    lazy var downArrowImage: UIImageView = {
       let ImageView = UIImageView()
        ImageView.image = UIImage(named: "arrow_down")
        ImageView.contentMode = .scaleAspectFit
        ImageView.isUserInteractionEnabled = true
        ImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handledownArrowClicked)))
        return ImageView
    }()
    
    lazy var upArrowImage: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(named: "arrow_up")
        ImageView.contentMode = .scaleAspectFit
        ImageView.isHidden = true
        ImageView.isUserInteractionEnabled = true
        ImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleUpArrowClicked)))
        return ImageView
    }()

    
    
//      MARK: Main view 
    let mainViewContainer: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let mainView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    let mainViewLarge: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    
    let mainViewCenterImage: UIImageView = {
        let ImageView = UIImageView()
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.image = UIImage(named: "fund_transfer_icon")
        ImageView.contentMode = .scaleAspectFit
        return ImageView
    }()
    
    let noTransactionText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "You currently don't have any transaction to display."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = textGray
        text.textAlignment = NSTextAlignment.center
        return text
    }()
    
    let mainViewCenterImageLarge: UIImageView = {
        let ImageView = UIImageView()
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.image = UIImage(named: "fund_transfer_icon")
        ImageView.contentMode = .scaleAspectFit
        return ImageView
    }()
    
    let noTransactionTextLarge: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "You currently don't have any transaction to display."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = textGray
        text.textAlignment = NSTextAlignment.center
        return text
    }()

    let dropDownView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    let dropDownBackgroundImage: UIImageView = {
        let ImageView = UIImageView()
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.image = UIImage(named: "gradient_background")
        return ImageView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds the container for holding all navBar items to main view
        view.addSubview(navBarContainer)
        
//      MARK: Adds all navBar items to the navBar container
        navBarContainer.addSubview(backgroundImageView)
        navBarContainer.addSubview(menuButton)
        navBarContainer.addSubview(accountOverviewText)
        navBarContainer.addSubview(rightNavBarIconButton)
        navBarContainer.addSubview(notificationIndicator)
        navBarContainer.addSubview(currentBalanceText)
        navBarContainer.addSubview(leftBalanceText)
        navBarContainer.addSubview(rightBalanceText)
        navBarContainer.addSubview(downArrowImage)
        navBarContainer.addSubview(upArrowImage)
        
//      MARK: Adds mainview and mainview items to view hierachy
        view.addSubview(mainViewContainer)
        mainViewContainer.addSubview(dropDownView)
        dropDownView.addSubview(dropDownBackgroundImage)
        
        mainViewContainer.addSubview(mainViewLarge)
        mainViewLarge.addSubview(mainViewCenterImageLarge)
        mainViewLarge.addSubview(noTransactionTextLarge)
        
        mainViewContainer.addSubview(mainView)
        mainView.addSubview(mainViewCenterImage)
        mainView.addSubview(noTransactionText)
        
       
        
        
        
        
////      MARK: Adds all items in dropdownViews to view hierachy


//      MARK: Calls autolayout functions for menu bar items
        setupNavBarContainer()
        setupBackgroundImageView()
        setupMenuButton()
        setupAccountOverviewText()
        setupRightNavBarIconButton()
        setupNotificationIndicator()
        setupCurrentBalanceText()
        setupLeftBalanceText()
        setupRightBalanceText()
        setupDownArrowImage()
        setupUpArrowImage()
        
        
        setupMainViewContainer()
        
//      MARK: Calls autolayout functions for dropDown menu items
        setupDropDownView()
        setupDropDownBackgroundImage()
        
        setupLargeMainView()
        setupLargeMainViewCenterImage()
        setupLargeNoTransactionText()
        
        setupMainView()
        setupMainViewCenterImage()
        setupNoTransactionText()
        
        

    
        

        
    }
    
    func handleUpArrowClicked() {
        downArrowImage.isHidden = false
        upArrowImage.isHidden = true
        
        dropDownView.isHidden = true
        
        mainViewLarge.isHidden = false
        mainView.isHidden = true
    
    }
    
    func handledownArrowClicked() {
        downArrowImage.isHidden = true
        upArrowImage.isHidden = false
        
        dropDownView.isHidden = false
        
        mainViewLarge.isHidden = true
        mainView.isHidden = false
        
    }
    
    func handleMenu() {
        print("Menu clicked")
    }
    
    
    func handleProfile() {
        print("profile button clicked")
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
    
    func setupMenuButton() {
        menuButton.anchorWithConstantsToTop(top: navBarContainer.topAnchor, left: navBarContainer.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0)
        menuButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupAccountOverviewText() {
        accountOverviewText.centerXAnchor.constraint(equalTo: navBarContainer.centerXAnchor).isActive = true
        accountOverviewText.anchorWithConstantsToTop(top: navBarContainer.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        accountOverviewText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        accountOverviewText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupRightNavBarIconButton() {
        rightNavBarIconButton.anchorWithConstantsToTop(top: navBarContainer.topAnchor, left: nil, bottom: nil, right: navBarContainer.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 20)
        rightNavBarIconButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        rightNavBarIconButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setupNotificationIndicator() {
        notificationIndicator.rightAnchor.constraint(equalTo: rightNavBarIconButton.rightAnchor, constant: 2.5).isActive = true
        notificationIndicator.topAnchor.constraint(equalTo: rightNavBarIconButton.topAnchor, constant: -0.2).isActive = true
        notificationIndicator.widthAnchor.constraint(equalToConstant: 10).isActive = true
        notificationIndicator.heightAnchor.constraint(equalToConstant: 10).isActive = true
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
    
    func setupDownArrowImage() {
        downArrowImage.anchorWithConstantsToTop(top: nil, left: nil, bottom: navBarContainer.bottomAnchor, right: navBarContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 20)
        downArrowImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        downArrowImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupUpArrowImage() {
        upArrowImage.anchorWithConstantsToTop(top: nil, left: nil, bottom: navBarContainer.bottomAnchor, right: navBarContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 20)
        upArrowImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        upArrowImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
//      MARK: Adding constraints for mainView
    func setupMainViewContainer() {
        mainViewContainer.anchorToTop(top: navBarContainer.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    //  MARK: Adds constraint for dropDown view.
    func setupDropDownView() {
        dropDownView.anchorWithConstantsToTop(top: mainViewContainer.topAnchor, left: mainViewContainer.leftAnchor, bottom: nil, right: mainViewContainer.rightAnchor, topConstant: 0.5, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        dropDownView.heightAnchor.constraint(equalTo: mainViewContainer.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    func setupDropDownBackgroundImage() {
        dropDownBackgroundImage.anchorToTop(top: dropDownView.topAnchor, left: dropDownView.leftAnchor, bottom: dropDownView.bottomAnchor, right: dropDownView.rightAnchor)
        dropDownBackgroundImage.widthAnchor.constraint(equalTo: dropDownView.widthAnchor).isActive = true
        dropDownBackgroundImage.heightAnchor.constraint(equalTo: dropDownView.heightAnchor).isActive = true
    }

    
    func setupMainView() {
        mainView.centerXAnchor.constraint(equalTo: mainViewContainer.centerXAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: mainViewContainer.bottomAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: mainViewContainer.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: mainViewContainer.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func setupMainViewCenterImage() {
        mainViewCenterImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        mainViewCenterImage.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -20).isActive = true
        mainViewCenterImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        mainViewCenterImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupNoTransactionText() {
        noTransactionText.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        noTransactionText.topAnchor.constraint(equalTo: mainViewCenterImage.bottomAnchor, constant: 20).isActive = true
        noTransactionText.widthAnchor.constraint(equalTo: mainView.widthAnchor,constant: -80).isActive = true
        noTransactionText.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupLargeMainView() {
        mainViewLarge.leftAnchor.constraint(equalTo: mainViewContainer.leftAnchor).isActive = true
        mainViewLarge.topAnchor.constraint(equalTo: mainViewContainer.topAnchor).isActive = true
        mainViewLarge.bottomAnchor.constraint(equalTo: mainViewContainer.bottomAnchor).isActive = true
        mainViewLarge.widthAnchor.constraint(equalTo: mainViewContainer.widthAnchor).isActive = true
    }
    
    func setupLargeMainViewCenterImage() {
        mainViewCenterImageLarge.centerXAnchor.constraint(equalTo: mainViewLarge.centerXAnchor).isActive = true
        mainViewCenterImageLarge.centerYAnchor.constraint(equalTo: mainViewLarge.centerYAnchor, constant: -20).isActive = true
        mainViewCenterImageLarge.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mainViewCenterImageLarge.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
    func setupLargeNoTransactionText() {
        noTransactionTextLarge.centerXAnchor.constraint(equalTo: mainViewLarge.centerXAnchor).isActive = true
        noTransactionTextLarge.topAnchor.constraint(equalTo: mainViewCenterImageLarge.bottomAnchor, constant: 20).isActive = true
        noTransactionTextLarge.widthAnchor.constraint(equalTo: mainViewLarge.widthAnchor,constant: -40).isActive = true
        noTransactionTextLarge.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    
  
}
