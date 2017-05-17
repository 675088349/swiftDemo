//
//  TabViewController.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/4/25.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    internal override class func initialize(){

        super.initialize()
        
        let tab = UITabBar.appearance()
        tab.barTintColor = UIColor.yellow
        
        let tabItem = UITabBarItem.appearance()
        var dic:[String:Any] = Dictionary()
        dic [NSForegroundColorAttributeName] = UIColor.red
        tabItem.setTitleTextAttributes(dic, for: UIControlState.selected)
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updata()
    }
    
    
    func updata() -> Void {
    
        let nameAry = ["秘方","厨房","聊聊","我的"]
        let imgAry = ["tabbar1","tabbar2","tabbar3","tabbar4"];
        let vcAry = ["HomeViewController","ChufangVC","LiaoliaoViewController","MineViewController"]
        
        
        for index in 0..<nameAry.count {
            
            let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let clas = NSClassFromString(ns + "." + vcAry[index]) as? UIViewController.Type
            
            let vc:UIViewController = clas!.init()
            let nav = KKNavViewController.init(rootViewController:vc as UIViewController)
            if index != 0 {
                vc.title = nameAry[index];
            }
            self.addChildVC(childVC: nav, title: nameAry[index], imageName: imgAry[index], selectedImg: nil)
            
        }
        
        
        

    }
    
    func addChildVC(childVC : UIViewController, title: String, imageName: String, selectedImg: String?) -> Void {
        
        childVC.tabBarItem.image = UIImage(named: imageName);
        childVC.tabBarItem.title = title;
        addChildViewController(childVC);
        
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
