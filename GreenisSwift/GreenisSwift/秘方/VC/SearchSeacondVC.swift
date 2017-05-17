//
//  SearchSeacondVC.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/12.
//  Copyright © 2017年 卢凯. All rights reserved.
//



import UIKit

let KKWidth = UIScreen.main.bounds.width
let KKHeight = UIScreen.main.bounds.height

protocol pushDelegete: NSObjectProtocol {
    func searchText(text: String)
}

class SearchSeacondVC: FatherViewController {
    
    weak var delegete:pushDelegete?
    
    
    fileprivate lazy var collect: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 10
        
        let collect = UICollectionView.init(frame: CGRect(x:0, y:0, width:self.view.kk_width, height:self.view.kk_height), collectionViewLayout: layout)
        collect.backgroundColor = UIColor.white
        collect.delegate = self
        collect.dataSource = self
        collect.register(SearchCell.self, forCellWithReuseIdentifier: "cell")
        
        return collect
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.searchView()
        self.view.addSubview(collect)
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

extension SearchSeacondVC: UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("搜索")
        delegete?.searchText(text: searchBar.text!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCell
        cell.title.text = String(format: "my name is %d",indexPath.row)
        cell.backgroundColor = UIColor.yellow
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: KKWidth/2 - 12, height: (KKWidth/2)/800 * 533 + 35)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(7, 7, 7, 7)
    }
}
