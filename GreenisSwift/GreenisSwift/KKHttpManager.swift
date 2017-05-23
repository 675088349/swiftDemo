//
//  KKHttpManager.swift
//  GreenisSwift
//
//  Created by likaifeng on 2017/5/18.
//  Copyright © 2017年 卢凯. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class KKHttpManager: NSObject {

    static let kk_manager = KKHttpManager.init()
    private override init() {
        
    }
    


    
    func postRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        
        
        
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
            
        }
    }

    
}
