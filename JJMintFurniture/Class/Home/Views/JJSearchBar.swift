//
//  JJSearchBar.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/27.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

// MARK: - NNSearchBarDelegate
protocol JJSearchBarDelegate: NSObjectProtocol {
    func searchBarTextDidChange(textField:UITextField)
    func searchBarCancelButtonClicked(searchBar: JJSearchBar)
    func searchBarTextFieldShouldReturn(textField: UITextField)
}

class JJSearchBar: UIView, UITextFieldDelegate{
    weak var delegate: JJSearchBarDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cancelBtn)
        // 添加搜索输入框
        addSubview(textField)
    }
    // MARK: - 输入文本框输入字体时调用
    @objc func searchBarTextDidChange(textField: UITextField) {
        delegate?.searchBarTextDidChange(textField: textField)
    }
    // MARK: - 点击取消按钮
    @objc func cancelBtnClick(){
        delegate?.searchBarCancelButtonClicked(searchBar: self)
    }
    
    // MARK: - 懒加载
    // MARK: 懒加载搜索输入框
    private lazy var textField: JJSearchTextField = {
        let textField = JJSearchTextField()
        textField.frame = CGRect(x: 0, y: 0, width: ScreenWidth - 80, height: kSearchBarH)
        textField.delegate = self
        textField.addTarget(self, action: #selector(searchBarTextDidChange), for: .editingChanged)
        return textField
    }()
    // MARK: 懒加载取消按钮
    private lazy var cancelBtn:UIButton = {
        let cancelBtn = UIButton()
        cancelBtn.frame = CGRect(x: ScreenWidth - 70, y: 0, width: 40, height: kSearchBarH)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelBtn.addTarget(self, action: #selector(cancelBtnClick), for: .touchUpInside)
        return cancelBtn;
    }()
     // MARK: - UITextFieldDelegate - 点击键盘 search
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return(delegate?.searchBarTextFieldShouldReturn(textField: textField) != nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
