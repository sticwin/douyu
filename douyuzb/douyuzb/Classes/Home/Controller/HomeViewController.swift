//
//  HomeViewController.swift
//  douyuzb
//
//  Created by 易 on 2017/11/4.
//  Copyright © 2017年 易. All rights reserved.
//

import UIKit

private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {

    //STC： 懒加载属性
    private var pageTitleView: PageTitleView {
        let titleFrame = CGRect(x: 0, y: kStateBarH + kNavigationBar, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
//        titleView.backgroundColor = UIColor.purple
        return titleView

    }
        
    override func viewDidLoad() {
    super.viewDidLoad()
        
    // Do any additional setup after loading the view.
        
    // 设置UI界面
    setupUI()
        
        }
    
    
}



// MARK: 设置UI界面
extension HomeViewController {

    private func setupUI(){
        // 0、关闭系统自动调整内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1、设置导航栏
        setupNavigationBar()
        
        // 2、 设置标题栏-titleView
        view.addSubview(pageTitleView)
        
    }
    
    private func setupNavigationBar(){
        // 设置左边的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName:"AppIcon40x40" )
    
        // 设置右边的按钮
        let  size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "历史-黑色36x36", highImageName: "历史-橘黄36x36", size: size)
        let searchItem = UIBarButtonItem(imageName: "搜索-黑色36x36", highImageName: "搜索-橘黄36x36", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "扫码-黑色36x36", highImageName: "扫码-橘黄36x36", size: size)
        /*
        let historyItem = UIBarButtonItem.createItem(imageName: "历史-黑色36x36", highImageName: "历史-橘黄36x36", size: size)
        let searchItem = UIBarButtonItem.createItem(imageName: "搜索-黑色36x36", highImageName: "搜索-橘黄36x36", size: size)
        let qrcodeItem = UIBarButtonItem.createItem(imageName: "扫码-黑色36x36", highImageName: "扫码-橘黄36x36", size: size)
        */
 
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
    
    
    }
    
}
