//
//  JJTabbarViewController.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/12.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

class JJTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 0, green: 0.757, blue: 0.682, alpha: 1)
        tabBar.backgroundImage = UIImage(named: "pfb_tabbar_background")
        // 添加自控制器
        addChildControllers()
    }
    // MARK: - 添加子控制器
    func addChildControllers() {
        addChildController(childController: JJHomeViewController(), title: "首页", imageName: "pfb_tabbar_homepage")
        addChildController(childController: JJDiscoverViewController(), title: "发现", imageName: "pfb_tabbar_order")
        addChildController(childController: JJMessageViewController(), title: "消息", imageName: "pfb_tabbar_discover")
        addChildController(childController: JJMeViewController(), title: "我的", imageName: "pfb_tabbar_mine")
    }
    // MARK: 添加子控制器
    public func addChildController(childController:UIViewController , title:String , imageName:String){
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        let navigationVC = JJNavigationController (rootViewController: childController)
        addChildViewController(navigationVC)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
