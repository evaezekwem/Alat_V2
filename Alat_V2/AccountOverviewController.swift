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
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
}
