//
//  CupConfigs.swift
//  PongStat
//
//  Created by Cowboy Lynk on 6/21/17.
//  Copyright © 2017 Cowboy Lynk. All rights reserved.
//

import Foundation
import UIKit


class ReRacks {
    
    //Table arrangement: (Cup configuration, Grid type, number of 1/4 rotations)
    static func createButton(name: String, image: UIImage, tableArrangement: ([[Bool]], Int, Int)) -> reRackOption{
        let button = reRackOption(frame: CGRect(x: 0, y: 0, width: 100, height: 100), tableArrangement: tableArrangement, name: name)
        button.setImage(image, for: .normal)
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }

    static func pyramid(numBase: Int) -> reRackOption{
        var cupConfig = Array(repeating: Array(repeating: false, count: numBase), count: numBase)
        
        var colShrinker = 0
        for row in 0..<cupConfig.count{
            for col in 0..<(cupConfig[0].count - colShrinker){
                cupConfig[row][col] = true
            }
            colShrinker += 1
        }
        
        return createButton(name: "Pyramid", image: #imageLiteral(resourceName: "pyramid"), tableArrangement: (cupConfig, 0, 0))
    }
    
    static func playButton(numBase: Int) -> reRackOption{
        var cupConfig = Array(repeating: Array(repeating: false, count: numBase), count: numBase)
        
        var colShrinker = 0
        for row in 0..<cupConfig.count{
            for col in 0..<(cupConfig[0].count - colShrinker){
                cupConfig[row][col] = true
            }
            colShrinker += 1
        }
        
        return createButton(name: "Play Button", image: #imageLiteral(resourceName: "pyramid"), tableArrangement: (cupConfig, 0, 1))
    }
    
    //3's
    static func stoplight() -> ([[Bool]], Int){
        return ([[true], [true], [true]], 2)
    }
    static func thinRedLine() -> ([[Bool]], Int){
        return ([[true, true, true]], 2)
    }
    
    //4's
    static func diamond() -> ([[Bool]], Int){
        return ([[false, true, false], [true, true, false], [true, false, false]], 0)
    }
    static func square() -> ([[Bool]], Int){
        return ([[true, true], [true, true], [true, true]], 2)
    }
    
    //5's
    static func trapezoid() -> ([[Bool]], Int){
        return ([[true, true, true], [true, true, false]], 0)
    }
    
    //6's
    static func sixPack() -> ([[Bool]], Int){
        return ([[true, true], [true, true], [true, true]], 2)
    }
    
    //7's
    static func honeycomb() -> ([[Bool]], Int){
        return ([[false, true, true, false], [true, true, true, false], [true, true, false, false]], 0)
    }
    
    //8's
    static func marching() -> ([[Bool]], Int){
        return ([[true, true], [true, true], [true,true], [true, true]], 2)
    }
}
