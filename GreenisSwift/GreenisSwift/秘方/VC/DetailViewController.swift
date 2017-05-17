//
//  DetailViewController.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/12.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
//    var tab:UITableView!
    var headerView: DetailHeaderView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "singleDog"
        self.view.backgroundColor = UIColor.white
        self.createItmes()
        self.createUI()
        
    }
    
    func createUI() -> Void {
        
//        self.view.addSubview(headerView)
//        headerView.kk_origin = CGPoint(x: 0, y: 0)
        
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        headerView = DetailHeaderView.init()
        headerView.kk_height = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        tableView.tableHeaderView = headerView
        self.view.addSubview(tableView)
        

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.tableHeaderView = headerView
    }

    
    func createItmes() -> Void {
        
        let rightBtn = UIBarButtonItem.init(image: UIImage.init(named: "downLoad"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        let leftBtn = UIBarButtonItem.init(image: UIImage.init(named: "star"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItems = [rightBtn,leftBtn]
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension DetailViewController : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "singleDog" + String(indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  CGFloat.leastNormalMagnitude
    }
    
    
}
