//
//  JJDiscoverTableViewController.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/8/1.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit
let TableViewCellID = "CellID"
// MARK: - 枚举判断 UITableView 类型
enum tableViewType {
    case noHeader
    case haveHeader
}
class JJDiscoverTableViewController: UITableViewController {

    var type: tableViewType = .noHeader
    var currentPostion = CGFloat()
    var lastPostion = CGFloat()
    var stopPostion = CGFloat()
    var topTool = Bool()
    var bottomTool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastPostion = 0
        stopPostion = 0
        topTool = true
        bottomTool = true
        
        let nib = UINib(nibName: String(describing: JJDiscoverCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TableViewCellID)
        tableView.rowHeight = 110
        if type == .haveHeader{
            title = "轮播图 tableView"
            tableView.sectionHeaderHeight = 180
            tableView.tableHeaderView = shufflingFigureView
        }else{
            title = "导航栏渐变 tableView"
        }
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellID, for: indexPath)
        return cell as! JJDiscoverCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - 懒加载轮播视图
    private lazy var shufflingFigureView : JJShufflingFigureView = {
        let frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 180)
        let imageView = ["shuffling1", "shuffling2", "shuffling3", "shuffling4"]
        let shufflingFigureView = JJShufflingFigureView(frame: frame, images: imageView as NSArray, autoPlay: true, delay: 3, isFromNet: false )
        shufflingFigureView.delegate = self
        return shufflingFigureView
    }()
}
// MARK: - 轮播代理方法，处理轮播图的点击事件
extension JJDiscoverTableViewController: JJShufflingFigureViewDelegate{
    func addShufflingFigureView(addShufflingFigureView: JJShufflingFigureView, iconClick index: NSInteger) {
        print(index)
    }
}

// MARK: - UIScrollViewDelegate 滚动页面时调用
extension JJDiscoverTableViewController{
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if type == tableViewType.haveHeader {
            return
        }
        currentPostion = scrollView.contentOffset.y
        if currentPostion > 0 {
            if currentPostion - lastPostion >= 0{
                if topTool {
                    topTool = false
                    bottomTool = true
                    stopPostion = currentPostion + 64
                }
                lastPostion = currentPostion
                navigationController?.navigationBar.alpha = 1 - currentPostion/500
            }else{
                if bottomTool {
                    bottomTool = false
                    topTool = true
                    stopPostion = currentPostion + 64
                }
                lastPostion = currentPostion
                navigationController?.navigationBar.alpha = (stopPostion - currentPostion)/200
            }
        }
    }
}
