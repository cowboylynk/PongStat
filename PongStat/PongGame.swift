//
//  PongGame.swift
//  PongStat
//
//  Created by Cowboy Lynk on 6/21/17.
//  Copyright © 2017 Cowboy Lynk. All rights reserved.
//

import Foundation
import UIKit

class PongGame: NSObject, NSCopying {
    var score: Double
    var madeCounter: Double
    var missedCounter: Int
    var cupConfig: [[Bool]]!
    var tableView: UIView!
    var turnType = 4 //0: user made, 1: user missed, 2: partner made, 3: reRack
    
    override init(){
        madeCounter = 0
        missedCounter = 0
        score = 0
    }
    
    func updateScore(){
        if madeCounter + Double(missedCounter) > 0 {
            score = madeCounter/(madeCounter+Double(missedCounter))*100
        }
    }
    
    func getPossibleReRacks() -> [reRackOption]{
        let numCups = self.getCount(array: self.cupConfig)
        var possibleReRacks = [reRackOption]()
        if numCups > 1{
            let numBase = -1/2*(1 - (8.0*Double(numCups) + 1.0).squareRoot())
            if numBase.truncatingRemainder(dividingBy: 1.0) == 0{
                possibleReRacks.append(ReRacks.pyramid(numBase: Int(numBase)))
                possibleReRacks.append(ReRacks.playButton(numBase: Int(numBase)))
            }
        }
        
        switch numCups{
        case 2:
            possibleReRacks.append(ReRacks.pair())
        case 3:
            possibleReRacks.append(contentsOf: [ReRacks.stoplight(), ReRacks.thinRedLine()])
        case 4:
            possibleReRacks.append(contentsOf: [ReRacks.diamond(), ReRacks.square(), ReRacks.penis(width: self.tableView.bounds.width)])
        case 5:
            possibleReRacks.append(contentsOf: [ReRacks.wizard(width: self.tableView.bounds.width), ReRacks.house(width: self.tableView.bounds.width)])
        case 6:
            possibleReRacks.append(contentsOf: [ReRacks.sixPack(), ReRacks.zipper()])
        case 7:
            possibleReRacks.append(ReRacks.honeycomb())
        case 8:
            possibleReRacks.append(ReRacks.marching())
        default: break
        }
        return possibleReRacks
    }
    
    func getCount(array: [[Bool]]) -> Int{
        var count = 0
        for row in 0..<array.count{
            for col in 0..<array[0].count{
                if array[row][col]{
                    count += 1
                }
            }
        }
        return count
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = PongGame()
        copy.score = self.score
        copy.madeCounter = self.madeCounter
        copy.missedCounter = self.missedCounter
        copy.cupConfig = self.cupConfig
        copy.tableView = self.tableView.copy()
        copy.turnType = self.turnType
        return copy
    }
    
    // Auxillary Funcions
    func getLargestRowCount(cupConfig: [[Bool]]) -> Int{  // Used to calculate the cup height and width
        // More info: uses the number of cups because the number of cups matters more than the length of the array it's in. See honeycomb example: it only has 3 cups, but an array row length of 4
        var largestRowCount = 0
        for row in cupConfig{
            var count = 0
            for cup in row{
                if cup {
                    count += 1
                }
            }
            if count > largestRowCount{
                largestRowCount = count
            }
        }
        return largestRowCount
    }
}
