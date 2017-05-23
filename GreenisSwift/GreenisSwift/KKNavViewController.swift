//
//  KKNavViewController.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/3.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class KKNavViewController: UINavigationController {

    
    
    
    internal override class func initialize(){
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.yellow
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
            self.navigationBar.tintColor = UIColor.black
        }
        super.pushViewController(viewController, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
