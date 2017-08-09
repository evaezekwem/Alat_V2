//
//  ViewController.swift
//  Alat_V2
//
//  Created by Eva on 26/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    let loadingScreenWhiteBg = RedOnWhiteBgViewController()
    let loadingScreenRedBg = WhiteOnRedBgViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(showRedLoadingScreen), with: self, afterDelay: 2)
        
        //        perform(#selector(showHomePage), with: self, afterDelay: 0)
        //        showHomePage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        present(loadingScreenWhiteBg, animated: false, completion: nil)
    }
    
    func showRedLoadingScreen() {
        present(loadingScreenRedBg, animated: false, completion: nil)
        return
        //        dismiss(animated: false, completion: nil)
        //        print("loading screen showed after 3 secs")
    }
    
}
