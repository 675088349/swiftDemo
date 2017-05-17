
//
//  FatherViewController.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/10.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class FatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.setUpForDisMissKeyboard()

    }
    
    func setUpForDisMissKeyboard() -> Void {
        let nc = NotificationCenter.default
        let singleTapGR = UITapGestureRecognizer.init(target: self, action: #selector(tapAnywhereToDismissKeyboard(_:)))
        
        let mainQuene = OperationQueue.main
        nc.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: mainQuene) { (Notification) in
            self.view.addGestureRecognizer(singleTapGR)
        };
        
        nc.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: mainQuene) { (Notification) in
            self.view.addGestureRecognizer(singleTapGR);
        };
        
    }
    
    func tapAnywhereToDismissKeyboard(_ gesture: UITapGestureRecognizer) -> Void {
        if  (gesture.view?.isKind(of: UITextField.self))!||(gesture.view?.isKind(of: UISearchBar.self))! {
            return
        }
        if ((self.navigationController) != nil) {
            self.navigationController?.view .endEditing(true)
        }
        self.view.endEditing(true)
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
