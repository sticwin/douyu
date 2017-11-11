//
//  PageTitleView.swift
//  douyuzb
//
//  Created by 易 on 2017/11/6.
//  Copyright © 2017年 易. All rights reserved.
//

import UIKit

let kscrollLineH: CGFloat = 2
let klineH: CGFloat = 1

class PageTitleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // STC: define title attribute 定义titles 属性
    private var titles : [String]
    
    //
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop                   = false
        scrollView.bounces                        = false
        return scrollView
        
    }()
    
    // 懒加载属性
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    // MARK: define a mutated function， 定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        // 设置UI界面
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PageTitleView {
    private func setupUI() {
        // 1、 添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2、添加title 对应的label
        setTitleLabels()
        
        // 3、设置底线和滚动的滑块
        setupBootMenuAndScrollLine()
    }
    
    
    private func setTitleLabels() {
        // 0、预设置某些值
        let labelW: CGFloat = frame.width/CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kscrollLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            //1、 创建 UI label
            let label = UILabel()
            
            //2、 set label's 属性
            label.text = title
            label.tag  = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            //3、 set lebel's frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4、 将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    private func setupBootMenuAndScrollLine() {
        //1、 添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.frame = CGRect(x: 0, y: frame.height - klineH , width: frame.width, height: klineH)
        addSubview(bottomLine)
        
        // 2、添加scrollLine
        // 2.1、获取第一个label
        guard let firstLabel = titleLabels.first else { return }
        titleLabels.first?.textColor = UIColor.orange
        
        // 2.2设置scrollView的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kscrollLineH, width: firstLabel.frame.width, height: kscrollLineH)
    }
    
}


