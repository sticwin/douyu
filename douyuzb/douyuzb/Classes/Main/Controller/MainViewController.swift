//
//  MainViewController.swift
//  douyuzb
//
//  Created by 易 on 2017/11/4.
//  Copyright © 2017年 易. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        addChildVc(storyBoardName: "Home")
        addChildVc(storyBoardName: "Live")
        addChildVc(storyBoardName: "Follow")
        addChildVc(storyBoardName: "Profile")
        
    }

    private func addChildVc(storyBoardName: String) {
        // 1、通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyBoardName, bundle: nil).instantiateInitialViewController()!
        
        // 2、将childvc做为子控制器
        addChildViewController(childVc)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
