//
//  OnboardingPageController.swift
//  Alat_V2
//
//  Created by Eva on 25/08/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class OnboardingPageController: UIPageViewController, UIPageViewControllerDataSource , UIPageViewControllerDelegate {

        var pages = [UIViewController]()
        let pageControl = UIPageControl()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.dataSource = self
            self.delegate = self
            let initialPage = 0
            let page1 = OnboardingViewController1()
            let page2 = OnboardingViewController2()
            let page3 = OnboardingViewController3()
            
            // add the individual viewControllers to the pageViewController
            self.pages.append(page1)
            self.pages.append(page2)
            self.pages.append(page3)
            setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
            
            // pageControl
            self.pageControl.frame = CGRect()
            self.pageControl.currentPageIndicatorTintColor = textAndBackgroundRed
            self.pageControl.pageIndicatorTintColor = UIColor.lightGray
            self.pageControl.numberOfPages = self.pages.count
            self.pageControl.currentPage = initialPage
            self.view.addSubview(self.pageControl)
            
            self.pageControl.translatesAutoresizingMaskIntoConstraints = false
            self.pageControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150).isActive = true
            self.pageControl.widthAnchor.constraint(equalToConstant: 20).isActive = true
            self.pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            if let viewControllerIndex = self.pages.index(of: viewController) {
                if viewControllerIndex == 0 {
                    // wrap to last page in array
                    return self.pages.last
                } else {
                    // go to previous page in array
                    return self.pages[viewControllerIndex - 1]
                }
            }
            return nil
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            if let viewControllerIndex = self.pages.index(of: viewController) {
                if viewControllerIndex < self.pages.count - 1 {
                    // go to next page in array
                    return self.pages[viewControllerIndex + 1]
                } else {
                    // wrap to first page in array
                    return self.pages.first
                }
            }
            return nil
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            // set the pageControl.currentPage to the index of the current viewController in pages
            if let viewControllers = pageViewController.viewControllers {
                if let viewControllerIndex = self.pages.index(of: viewControllers[0]) {
                    self.pageControl.currentPage = viewControllerIndex
                }
            }
        }
}
