//
//  JJSearchViewController.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/13.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

class JJSearchViewController: UIViewController, JJSearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
    }
    // MARK: - NNSearchBarDelegate 代理
    // MARK: searchBarTextDidChange
    func searchBarTextDidChange(textField: UITextField) {
        print("你输入的是：" + String(describing: textField))
    }
    
    func searchBarCancelButtonClicked(searchBar: JJSearchBar) {
        searchBar.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    
    func searchBarTextFieldShouldReturn(textField: UITextField) {
        print("searchBarTextFieldShouldReturn")
    }
    // MARK: - 点击屏幕时结束编辑
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
    // MARK: - 懒加载 searchBar
    private lazy var searchBar : JJSearchBar = {
        let searchBar = JJSearchBar()
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        searchBar.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: kSearchBarH)
        return searchBar
    }()
}
