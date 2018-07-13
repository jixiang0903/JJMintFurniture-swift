//
//  JJNavigationController.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/12.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit
import SVProgressHUD

class JJNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor(red: 0, green: 198/255.0, blue: 176/255.0, alpha: 1)
        
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17), NSAttributedStringKey.foregroundColor: UIColor.white]
        }
    // MARK: - 重写 pushViewController 方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "beauty_icon_back"), style:  UIBarButtonItemStyle.plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    // MARK: - 返回按钮
    @objc func navigationBackClick() {
        // 隐藏提示框
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        // 隐藏指示器
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        // pop 出页面
        popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
