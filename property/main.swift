//  main.swift
//  property
//  Created by XCODE on 2015/10/22.
//  Copyright © 2015年 Nick. All rights reserved.
//
//屬性連動 屬性連動 屬性連動 屬性連動
import Foundation

struct Point {
    var x:Float = 0.0
    var y:Float = 0.0
}//end Point struct

struct Size {
    var width:Float = 0.0
    var height:Float = 0.0
}//end Size struct


struct Rect {
    var origin:Point = Point(x: 0, y: 0)
    var size:Size = Size(width: 0, height: 0)
    
    var area:Float{
        //屬性連動
        return size.width * size.height
    }
    
    var center:Point{

        set(newValue){//設定 newValue 自動生成新的 Point
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
        
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        //Objective-C 無,僅 swift 有
    }
    
}//end Rect struct

var pic01:Rect = Rect()
pic01.origin.x = 50
pic01.origin.y = 50
pic01.size.width = 100
pic01.size.height = 200
//print("area:\(pic01.area)")

var rect01:Rect = Rect(origin: Point(x: 60, y: 70), size: Size(width: 100, height: 50))
print("centerX:\(rect01.center.x)\ncenterY:\(rect01.center.y)")
print("原點X:\(rect01.origin.x)\n原點Y:\(rect01.origin.y)\n")


rect01.center = Point(x: 100, y: 150)
print("改變中心點後:\n")
print("centerX:\(rect01.center.x)\ncenterY:\(rect01.center.y)")
print("原點X:\(rect01.origin.x)\n原點Y:\(rect01.origin.y)")
print("面積:\(rect01.area)")

//rect01.area = 100 //(area is get-only property)




