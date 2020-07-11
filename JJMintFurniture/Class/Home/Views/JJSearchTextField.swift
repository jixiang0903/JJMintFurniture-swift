//
//  JJSearchTextField.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/27.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

class JJSearchTextField: UITextField {

     // MARK: - 初始化 SearchTextField
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftView = leftV
        leftViewMode = UITextFieldViewMode.always
        placeholder = "搜索商品、专题"
        background = UIImage.init(named: "sousuo")
        font = UIFont.systemFont(ofSize: 14)
        returnKeyType = UIReturnKeyType.search
        enablesReturnKeyAutomatically = true
    }
    // MARK: - 懒加载左边的搜索图片
    private lazy var leftV: UIView = {
        let leftV = UIView()
        let leftImageV = UIImageView()
        let image = UIImage(named: "fangdajing")
        leftV.frame = CGRect(x: 5, y: 0, width: (image?.size.width)! + 15, height: (image?.size.height)!)
        leftImageV.frame = CGRect(x: 5, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
        leftImageV.image = image
        leftV.addSubview(leftImageV)
        return leftV
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
