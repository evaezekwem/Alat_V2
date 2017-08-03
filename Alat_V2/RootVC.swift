//
//  RootVC.swift
//  Zone
//
//  Created by Zone 3 on 1/19/17.
//  Copyright © 2017 Zone 3. All rights reserved.
//

import UIKit

class RootVC: DLHamburguerViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.main.bounds.width / 4 * 3
        desiredMenuViewSize = CGSize(width: width , height: UIScreen.main.bounds.height)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        self.contentViewController  = UINavigationController(rootViewController: homeController)
        self.menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
    }

    

}
