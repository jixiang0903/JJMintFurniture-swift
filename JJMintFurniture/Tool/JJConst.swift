//
//  JJConst.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/7/27.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

// 屏幕的宽
let ScreenWidth = UIScreen.main.bounds.size.width
// 屏幕的高
let ScreenHeight = UIScreen.main.bounds.size.height

let IS_IPHONE4 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE5 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE6 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE6_PLUS =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE6_PLUS_SCALE =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2001).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE_X =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE_XR =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE_Xs_MAX =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)

// 顶部标题的y
let kTitlesViewY: CGFloat = IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_Xs_MAX ? 88 :64
// 顶部标题的高度
let kTitlesViewH: CGFloat = 36
// 搜索框高度
let kSearchBarH: CGFloat = 30


let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
let green = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
let alpha = CGFloat(arc4random_uniform(255))/CGFloat(255.0)

// 随机颜色
let randomColor = UIColor.init(red:red, green:green, blue:blue , alpha: alpha)
