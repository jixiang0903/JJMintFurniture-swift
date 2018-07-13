//
//  JJHomeViewController.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/12.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

class JJHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pushBtn:UIButton = UIButton(type: .custom)
        pushBtn.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
        pushBtn.setTitle("下一页", for: .normal)
        pushBtn .addTarget(self, action: #selector(pushClick), for: .touchUpInside)
        self.view .addSubview(pushBtn)
        
    }

    @objc func pushClick()  {
        navigationController?.pushViewController(JJSearchViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
