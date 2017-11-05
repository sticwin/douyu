//
//  UIBarButton_extension.swift
//  douyuzb
//
//  Created by 易 on 2017/11/5.
//  Copyright © 2017年 易. All rights reserved.
//

import Foundation

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for:  .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    
    */
    
    
   // 便利构造函数， 1> convenience开头， 2> 在构造函数中必须明确调用一个设计的构造函数 self
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        // 创建 UIButton
        let btn = UIButton()
        
        // 设置按钮图片
        btn.setImage(UIImage(named: imageName), for:  .normal)
        
        // 如果需要，设置按键图片高亮
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 如果非默认，设置按键尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        //创建UIBarButtonItem
        self.init(customView: btn)
    }
}
