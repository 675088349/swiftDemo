//
//  Extension.swift
//  GreenisSwift
//
//  Created by 肥啊 on 2017/5/10.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit


extension UIView {

    var kk_x: CGFloat {
    
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    var kk_y: CGFloat {
    
        get{
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
        
    }
    
    var kk_width: CGFloat {
        
        get{
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
        
    }
    
    var kk_height: CGFloat {
        
        get{
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
        
    }
    
    var kk_size: CGSize {
        
        get{
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
        
    }

    
    var kk_origin: CGPoint {
        
        get{
            return frame.origin
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin = newValue
            frame = tempFrame
        }
        
    }
    
    var kk_center: CGPoint {
        
        get{
            return self.center
        }
        set(newValue) {
            var tempFrame: CGPoint = self.center
            tempFrame = newValue
            self.center = tempFrame
        }
        
    }
    
    var kk_maxX: CGFloat {
        
        get{
            return self.frame.maxX
        }
        set(newValue){
            var tempFrame = self.frame
            tempFrame.origin.x = newValue - self.kk_width
            self.frame = tempFrame
        }
    }
    
    var kk_minX: CGFloat {
        get{
            return self.frame.minX
        }
        set {
            var tempFrame = self.frame
            tempFrame.origin.x = newValue
            self.frame = tempFrame
        }
    
    }
    
    var kk_midX: CGFloat {
        
        get{
            return self.frame.midX
        }
        set{
            var tempFrame = self.center
            tempFrame.x = newValue
            self.center = tempFrame
        }
    }
    
    var kk_maxY: CGFloat {
        
        get{
            return self.frame.maxY
        }
        set(newValue){
            var tempFrame = self.frame
            tempFrame.origin.y = newValue - self.kk_height
            self.frame = tempFrame
        }
    }


}
