//
//  OnboardingViewController1.swift
//  Alat_V2
//
//  Created by Eva on 25/08/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class OnboardingViewController1: UIViewController {

    let backgroundImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "onboarding_bg"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let imageAndMessageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .yellow
        return view
    }()
    
    let messageTextView: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 16)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = textAndBackgroundLightRed
        textView.text = "Set up an account anywhere you are in 5 minutes"
        return textView
    }()
    
    let iconImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "onboarding_img_1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let skipButton: UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(textAndBackgroundLightRed, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundImageView)
        view.addSubview(imageAndMessageContainerView)
        imageAndMessageContainerView.addSubview(iconImageView)
        imageAndMessageContainerView.addSubview(messageTextView)
        view.addSubview(skipButton)
        
        
        setupBackgroundImageView()
        setupImageAndMessageContainerView()
        setupMessageTextView()
        setupIconImageView()
        setupSkipButton()

        
    }

    func handleSkip() {
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let contentController = UINavigationController(rootViewController: homeController)
        let menuVC = SideMenuVC(collectionViewLayout: UICollectionViewFlowLayout())
        let rootViewController = RootVC(contentViewController: contentController, menuViewController: menuVC)
        
        present(rootViewController, animated: false, completion: nil)

        
        print("Skipped")
    }
    
    func setupBackgroundImageView() {
        backgroundImageView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 20)
        
//        
//        anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func setupImageAndMessageContainerView() {
        imageAndMessageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageAndMessageContainerView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        imageAndMessageContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        imageAndMessageContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupMessageTextView() {
        messageTextView.topAnchor.constraint(equalTo: imageAndMessageContainerView.topAnchor, constant: 20).isActive = true
        messageTextView.centerXAnchor.constraint(equalTo: imageAndMessageContainerView.centerXAnchor).isActive = true
        messageTextView.widthAnchor.constraint(equalTo: imageAndMessageContainerView.widthAnchor).isActive = true
        messageTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupIconImageView() {
        iconImageView.centerXAnchor.constraint(equalTo: imageAndMessageContainerView.centerXAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: 50).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    func setupSkipButton() {
        skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skipButton.topAnchor.constraint(equalTo: imageAndMessageContainerView.bottomAnchor, constant: 150).isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}
