//
//  WhiteOnRedBgViewController.swift
//  Alat_V2
//
//  Created by Eva on 08/08/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class WhiteOnRedBgViewController: UIViewController {
    
    let homePageController = HomePageController()
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "gradient_background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let logoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "white logo with loading bar"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(logoView)
        logoView.addSubview(logoImageView)
        
        
        setupBackgroundImageView()
        setupLogoView()
        setupLogoImageView()
        
        perform(#selector(showHomePage), with: self, afterDelay: 2)
    }
    
    func showHomePage() {
        present(homePageController, animated: false, completion: nil)
        return
    }
    
    func setupBackgroundImageView() {
        backgroundImageView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setupLogoView() {
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 191).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
    }
    
    func setupLogoImageView() {
        logoImageView.anchorToTop(top: logoView.topAnchor, left: logoView.leftAnchor, bottom: logoView.bottomAnchor, right: logoView.rightAnchor)
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}
