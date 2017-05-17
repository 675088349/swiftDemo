//
//  SearchCell.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/12.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
   
    let title = UILabel()
    let imgView = UIImageView()
    
    
    
    override init(frame: CGRect ){
        super.init(frame: frame)
        
        self.setUp()
    }
    
    func setUp() -> Void {
        
        imgView.frame = CGRect(x: 0, y: 0, width: self.contentView.kk_width, height: self.contentView.kk_height - 40)
        imgView.backgroundColor = UIColor.red
        self.contentView.addSubview(imgView)
        
        title.text = "my name is waha"
        title.sizeToFit()
        print(title.frame)
        title.kk_center = CGPoint(x: self.contentView.center.x ,y:imgView.kk_maxY + title.kk_height/2)
        self.contentView.addSubview(title)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
