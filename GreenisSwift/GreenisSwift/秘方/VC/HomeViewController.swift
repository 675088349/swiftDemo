//
//  HomeViewController.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/3.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.createSearchBtn()
        self.createTableView()
    }
    
    func createTableView() -> Void {
        
        self.view.addSubview(tableView)
        tableView.beginUpdates()
        tableView.tableHeaderView = headerView;
        tableView.endUpdates()
        
    }
    
    fileprivate lazy var headerView: UIView = {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red;
        headerView.kk_size = CGSize(width: self.view.kk_width, height: 15 + self.view.frame.size.width/800 * 533)
        
        return headerView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    

    
    func createSearchBtn() -> Void {
        
        let searchBtn = UIButton.init()
        searchBtn.frame = CGRect(x: 0 ,y: 0 ,width: 537/2,height: 30)
        searchBtn.setTitle("搜索菜谱", for: UIControlState.normal)
        searchBtn.addTarget(self, action: #selector(pushSearch), for: UIControlEvents.touchUpInside)
//        searchBtn.buttonType = UIButtonType.custom
        self.navigationItem.titleView = searchBtn;
        searchBtn.setBackgroundImage(UIImage.init(named: "search_textfield"), for: UIControlState.normal)
        
        let rightBtn = UIBarButtonItem.init(title: "客服", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBtn
        
    }
    
    func pushSearch() -> Void {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
//        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 + self.view.frame.size.width/800 * 533
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}
