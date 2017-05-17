//
//  HomeTableViewCell.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/12.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    let imgV = UIImageView()
    let titleL = UILabel()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUp()
    }
    
    func setUp() -> Void {
        
        imgV.backgroundColor = UIColor.blue
        self.contentView.addSubview(imgV)
        
        titleL.text = "he is readly like a dog"
        titleL.alpha = 0.5
        titleL.sizeToFit()
        self.contentView.addSubview(titleL)
        
    }
    
    override func layoutSubviews() {
        imgV.frame = CGRect(x: 0, y: 0, width: self.contentView.kk_width, height: self.contentView.kk_height)

        titleL.center = CGPoint(x: self.contentView.center.x, y: imgV.kk_maxY - titleL.kk_height/2)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
