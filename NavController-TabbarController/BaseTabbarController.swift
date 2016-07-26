//
//  BaseTabbarController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/17/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor(red: 0.149, green: 0.2, blue : 0.255, alpha: 1.0)
        tabBar.translucent  = false
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : UIFont(name : "SFUIText-Regular" , size : 12)!], forState: .Normal)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.cyanColor(), NSFontAttributeName : UIFont(name : "SFUIText-Regular" , size : 30)!]
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let bookVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("YourBookVC") as! YourBookController
        
        let homeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeVC") as! HomeViewController
        
        let profileVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileViewController
        
        let bookNav = BaseNavigationController(rootViewController: bookVC)
        let homeNav = BaseNavigationController(rootViewController: homeVC)
        let profileNav = BaseNavigationController(rootViewController: profileVC)
        
        viewControllers = [bookNav, homeNav, profileNav]
        
        settingNavForEachController(bookVC, transparent: true, navTitle: "Home", tabbarTitle: "Home", image: "Home", selectedImage: "Selected-Home")
        
        settingNavForEachController(homeVC, transparent: true, navTitle: "Book", tabbarTitle: "Book", image: "Book", selectedImage: "Selected-URBook")
        
        settingNavForEachController(profileVC, transparent: true, navTitle: "Profile", tabbarTitle: "Profile", image: "Profile", selectedImage: "Selected-Profile")
        
//        profileVC.title = "Profile"
//        homeVC.title = "Home"
//        bookVC.title = "Book"
        
    }
    
    func settingNavForEachController(viewcontroller : BaseViewController, transparent : Bool, navTitle: String, tabbarTitle : String, image : String, selectedImage : String) {
        viewcontroller.navigationItem.title = navTitle
        viewcontroller.tabBarItem = UITabBarItem(title: tabbarTitle, image: UIImage(named : image)?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal))
        
        viewcontroller.tranparent = transparent
        
    }
    
    
}
