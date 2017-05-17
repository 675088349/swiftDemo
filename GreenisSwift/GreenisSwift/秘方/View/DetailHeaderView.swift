//
//  DetailHeaderView.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/12.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class DetailHeaderView: UIView {

    var headImg = UIImageView()
    var titleL = UILabel()
    let material = UILabel()
    var labAry = [UILabel]()
    
    
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    func setUp() -> Void {
        
        headImg.backgroundColor = UIColor.red
        self.addSubview(headImg)
        
        titleL.text = "singleDog"
        titleL.backgroundColor = UIColor.yellow
        titleL.textColor = UIColor.black
        self.addSubview(titleL)
        
        material.text = "材料"
        material.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(material)
        
        for _ in 0..<5 {
            let lable = UILabel()
            lable.text = "+5"
            lable.sizeToFit()
            self.addSubview(lable)
            labAry.append(lable)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headImg.frame = CGRect(x: 0, y: 0, width: self.kk_width, height: self.kk_width/800*533)
        
        titleL.frame = CGRect(x: 30 , y: headImg.kk_maxY, width:self.kk_width - 60, height: 0)
        titleL.sizeToFit()
        
        material.sizeToFit()
        material.center = CGPoint(x: self.kk_center.x, y: titleL.kk_maxY + material.kk_height/2 + 50)
        
        var lastLable:UILabel!

        for itme in 0..<labAry.count {
            let itemY = material.kk_maxY + CGFloat((itme/3)*40)
            let lable = labAry[itme]
            lable.frame = CGRect(x: 30 + 60*(itme%3), y: Int(itemY), width: 60, height: 30)
            lastLable = lable
        }
        

        let maxY = lastLable.kk_maxY
        self.kk_size = CGSize(width: UIScreen.main.bounds.width, height: maxY + 30)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}
