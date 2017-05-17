//
//  SearchViewController.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/10.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class SearchViewController: FatherViewController {
    
    var dataAry = [String]()
    fileprivate lazy var _tableView: UITableView = {
        
       let _tableView = UITableView.init(frame: CGRect(x:0, y:0, width:self.view.kk_width, height: self.view.kk_height), style: UITableViewStyle.plain)
        self.view.addSubview(_tableView)
        _tableView.rowHeight = 44
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
       return _tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.searchView()
        self.view.addSubview(_tableView)
//        _tableView.tableFooterView = footView
//        _tableView.tableFooterView?.frame = CGRect(x: 0, y:0, width:self.view.kk_width, height:40)
        self.addData()
    }
    
    func addData() -> Void {
     
        if let ary = (UserDefaults.standard.object(forKey: "searchAry")) {

            dataAry += ary as! [String]
            _tableView.reloadData()
        }
    }
    
   fileprivate lazy var footView: UIView = {
    
        let footView = UIButton.init(type: UIButtonType.custom)
        footView.setTitle("全部清空", for: UIControlState.normal)
        footView.setTitleColor(UIColor.red, for: UIControlState.normal)
        footView.addTarget(self, action: #selector(remmUsedef), for: UIControlEvents.touchUpInside)
        footView.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        return footView
    }()
    
    func remmUsedef() -> Void {
        UserDefaults.standard.removeObject(forKey: "searchAry")
        dataAry .removeAll()
        _tableView .reloadData()
    }
    
    func searchView() -> Void {
        
        let bar = UISearchBar.init()
        bar.placeholder = "菜谱搜索"
        bar.tintColor = UIColor.white
        bar.searchBarStyle = UISearchBarStyle.minimal
        bar.kk_size = CGSize(width: self.view.kk_width-20, height: 30)
        self.navigationItem.titleView = bar;
        bar.delegate = self
        let textField = bar.value(forKey: "_searchField") as! UITextField
        textField.textColor = UIColor.white
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SearchViewController: UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,pushDelegete {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        dataAry.append(searchBar.text!)
        let ary = dataAry
        let userDef = UserDefaults.standard
        userDef.set(ary, forKey: "searchAry")
        userDef.synchronize()
       
        _tableView.reloadData()
        let search = SearchSeacondVC()
        search.delegete = self
        self.navigationController?.pushViewController(search , animated: true)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataAry[indexPath.row]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if dataAry.count>0 {
            return 30
        }
        return 0.0001
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if dataAry.count==0 {
        return nil
        }
        return footView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(SearchSeacondVC() , animated: true)
    }

    func searchText(text: String) {
        dataAry.append(text)
        _tableView .reloadData()
    }
}
