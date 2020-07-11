//
//  JJItemBtnView.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2019/5/28.
//  Copyright © 2019 JX.ZHANG. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol JJItemBtnViewDelegate:NSObjectProtocol{
    func leftBtnClickDelegate()
    func rightBtnClickDelegate()
    func topBtnClickDelegate()
    func bottomBtnClickDelegate()
}

class JJItemBtnView: UIView {
    weak var delegate:JJItemBtnViewDelegate?
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .white
        alpha = 0.6
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 设置 UI 界面
    func setupUI() {
        addSubview(leftBtn)
        addSubview(rightBtn)
        addSubview(topBtn)
        addSubview(bottomBtn)
        
        topBtn.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalTo(self)
        }
        
        leftBtn.snp.makeConstraints { (make) in
            make.width.equalTo(topBtn)
            make.height.equalTo(topBtn)
            make.centerY.equalTo(self)
            make.left.equalTo(self)
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.width.equalTo(topBtn)
            make.height.equalTo(topBtn)
            make.centerY.equalTo(self)
            make.right.equalTo(self)
        }
        
        bottomBtn.snp.makeConstraints { (make) in
            make.width.equalTo(topBtn)
            make.height.equalTo(topBtn)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self)
        }
        
    }
    
    // MARK: - 懒加载
    // MARK: 懒加载左边按钮
    private lazy var leftBtn:UIButton = {
        var leftBtn = UIButton()
        leftBtn.setTitle("向左", for: .normal)
        leftBtn.backgroundColor = UIColor.red
        leftBtn.setTitleColor(UIColor.white, for: .normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        leftBtn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        return leftBtn
    }()
    // MARK: 懒加载右边按钮
    private lazy var rightBtn:UIButton = {
        var rightBtn = UIButton()
        rightBtn.setTitle("向右", for: .normal)
        rightBtn.backgroundColor = UIColor.red
        rightBtn.setTitleColor(UIColor.white, for: .normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        return rightBtn
    }()
    // MARK: 懒加载上边按钮
    private lazy var topBtn:UIButton = {
        var topBtn = UIButton()
        topBtn.setTitle("向上", for: .normal)
        topBtn.backgroundColor = UIColor.red
        topBtn.setTitleColor(UIColor.white, for: .normal)
        topBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        topBtn.addTarget(self, action: #selector(topBtnClick), for: .touchUpInside)
        return topBtn
    }()
    // MARK: 懒加载下边按钮
    private lazy var bottomBtn:UIButton = {
        var bottomBtn = UIButton()
        bottomBtn.setTitle("向下", for: .normal)
        bottomBtn.backgroundColor = UIColor.red
        bottomBtn.setTitleColor(UIColor.white, for: .normal)
        bottomBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        bottomBtn.addTarget(self, action: #selector(bottomBtnClick), for: .touchUpInside)
        return bottomBtn
    }()
    
    // MARK: - Action
    // MARK: 点击左边按钮
    @objc func leftBtnClick() {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(JJItemBtnViewDelegate.leftBtnClickDelegate))) != nil{
            delegate?.leftBtnClickDelegate()
        }
    }
    // MARK: 点击右边按钮
    @objc func rightBtnClick() {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(JJItemBtnViewDelegate.rightBtnClickDelegate))) != nil{
            delegate?.rightBtnClickDelegate()
        }
    }
    // MARK: 点击左边按钮
    @objc func topBtnClick() {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(JJItemBtnViewDelegate.topBtnClickDelegate))) != nil{
            delegate?.topBtnClickDelegate()
        }
    }
    // MARK: 点击左边按钮
    @objc func bottomBtnClick() {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(JJItemBtnViewDelegate.bottomBtnClickDelegate))) != nil{
            delegate?.bottomBtnClickDelegate()
        }
    }
}
