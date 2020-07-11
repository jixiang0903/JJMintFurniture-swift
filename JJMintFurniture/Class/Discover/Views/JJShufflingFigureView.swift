//
//  JJShufflingFigureView.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/8/2.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit
// MARK: - 自定义代理方法
@objc protocol JJShufflingFigureViewDelegate: NSObjectProtocol{
    func addShufflingFigureView(addShufflingFigureView:JJShufflingFigureView, iconClick index:NSInteger)
}

class JJShufflingFigureView: UIView {
    var pageControl: UIPageControl?
    var currentPage: NSInteger?
    var images: NSArray?
    var delegate: JJShufflingFigureViewDelegate?

    private var imageScrollView: UIScrollView?
    private var currentImgS = NSMutableArray()
    private var autoPlay : Bool?
    private var isFromNet : Bool?
    private var delay: TimeInterval?
    
    // MARK: - 重写get方法
    private var currentImagegS :NSMutableArray? {
        get{
            currentImgS.removeAllObjects()
            let count = self.images!.count
            var i = NSInteger(self.currentPage! + count - 1) % count
            currentImgS.add(self.images![i])
            currentImgS.add(self.images![self.currentPage!])
            i = NSInteger(self.currentPage! + 1)%count
            currentImgS.add(self.images![i])
            return currentImgS;
        }
    }
    
    //自定义初始化
    convenience init(frame:CGRect ,images:NSArray , autoPlay:Bool , delay:TimeInterval, isFromNet:Bool) {
        self.init(frame: frame)
        self.images = images;
        self.autoPlay = autoPlay
        self.delay = delay
        self.isFromNet = isFromNet
        self.currentPage = 0
        
        createImagesScrollView()
        createPageView()
        
        if images.count < 2 {
            self.autoPlay = false
            pageControl?.isHidden = true
        }
        if self.autoPlay == true {
            startAutoPlay()
        }
        
        
    }
    //创建滚动视图
    private func createImagesScrollView(){
        if images?.count == 0 {
            return;
        }
        imageScrollView = UIScrollView(frame: self.bounds)
        imageScrollView?.showsVerticalScrollIndicator = false
        imageScrollView?.showsHorizontalScrollIndicator = false
        imageScrollView?.bounces = false
        imageScrollView?.delegate = self
        imageScrollView?.contentSize = CGSize(width: self.bounds.width * 3, height: 0)
        imageScrollView?.contentOffset = CGPoint(x: self.frame.width, y: 0)
        imageScrollView?.isPagingEnabled = true
        self.addSubview(imageScrollView!)
        
        for index in 0..<3 {
            let imageView = UIImageView(frame: CGRect(x: self.bounds.width * CGFloat(index), y: 0, width: self.bounds.width, height: self.bounds.height))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(JJShufflingFigureView.imageViewClick)))
            if self.isFromNet == true{
                
            }else{
                imageView.image = UIImage(named: self.currentImagegS![index] as! String)
            }
            imageScrollView?.addSubview(imageView)
        }
        
    }
    // MARK: - 创建pageControl视图
    private func createPageView(){
        if images?.count == 0 {
            return
        }
        let pageW : CGFloat = 80
        let pageH : CGFloat = 25
        let pageX : CGFloat = self.bounds.width - pageW
        let pageY : CGFloat = self.bounds.height - pageH
        
        pageControl = UIPageControl(frame: CGRect(x: pageX, y: pageY, width: pageW, height: pageH))
        pageControl?.numberOfPages = images!.count
        pageControl?.currentPage = 0
        pageControl?.isUserInteractionEnabled = false
        self.addSubview(pageControl!)
    }
    
    private func startAutoPlay(){
        self.perform(#selector(JJShufflingFigureView.nextPage), with: nil, afterDelay: delay!)
    }
    
    @objc func nextPage(){
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(JJShufflingFigureView.nextPage), object: nil)
        imageScrollView!.setContentOffset(CGPoint(x: 2 * self.frame.width, y: 0), animated: true)
        self.perform(#selector(JJShufflingFigureView.nextPage), with: nil, afterDelay: delay!)
    }
    
    // MARK: - 每次图片滚动时刷新图片
    func refreshImages() {
        for i in 0..<imageScrollView!.subviews.count {
            let imageView = imageScrollView!.subviews[i] as! UIImageView
            if self.isFromNet == true{
                
            }else{
                imageView.image = UIImage(named: self.currentImagegS![i] as! String)
            }
        }
        imageScrollView!.contentOffset = CGPoint(x: self.frame.width, y: 0)
    }
    
    // MARK: - 点击图片事件
    @objc func imageViewClick(){
        if self.delegate != nil && (self.delegate?.responds(to: #selector(JJShufflingFigureViewDelegate.addShufflingFigureView(addShufflingFigureView:iconClick:)))) != nil{
            self.delegate?.addShufflingFigureView(addShufflingFigureView: self, iconClick: currentPage!)
        }
    }
}
// MARK: - UIScrollViewDelegate 代理
extension JJShufflingFigureView : UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.setContentOffset(CGPoint(x: self.frame.width, y: 0), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let width = self.frame.width
        if x >= 2*width {
            currentPage = (self.currentPage! + 1) % self.images!.count
            pageControl?.currentPage = currentPage!
            refreshImages()
        }
        
        if x <= 0 {
            currentPage = (self.currentPage! + self.images!.count - 1) % self.images!.count
            pageControl?.currentPage = currentPage!
            refreshImages()
        }
    }
}
