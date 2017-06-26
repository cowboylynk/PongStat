//
//  Utils.swift
//  PongStat
//
//  Created by Cowboy Lynk on 6/22/17.
//  Copyright © 2017 Cowboy Lynk. All rights reserved.
//

import Foundation
import UIKit

// Classes
class reRackOption: UIButton{
    var tableArrangement: ([[Bool]], Int, Int)
    var newTableView: UIView!
    var name: String
    
    init(frame: CGRect, tableArrangement: ([[Bool]], Int, Int), name: String){
        self.tableArrangement = tableArrangement
        self.name = name
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomNav: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor(red:0.20, green:0.41, blue:0.29, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 20))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        let image = UIImage(named: "Title")
        imageView.image = image
        navigationItem.titleView = imageView
    }
}

// Extensions
extension UIView {
    
    func clearView(){ // Removes every subview from the view
        for subview in self.subviews{
            if subview.tag != 99 {
                subview.removeFromSuperview()
            }
        }
    }
    func swapView(newView: UIView){
        self.clearView()
        // Adds all the cups from the SAVED tableView to the ACTIVE tableView
        for subview in newView.subviews{
            let cup = subview as! Cup
            self.addSubview(cup.makeCupCopy())
        }
        self.transform = newView.transform // makes sure the ACTIVE tableView is in the same orientation as the SAVED tableView
    }
    
    // Transform Functions
    func rotate(by: CGFloat){
        self.transform = CGAffineTransform(rotationAngle: by) // rotates the whole table
        for subview in self.subviews{  // reverse rotates each of the cups so that they are always upright
            subview.transform = CGAffineTransform(rotationAngle: -by)
        }
        self.setSize()
    }
    func setSize(){
        let superViewWidth = self.superview!.bounds.width
        let fraction = superViewWidth*0.7/self.bounds.width
        self.transform = transform.scaledBy(x:fraction, y: fraction)
    }
    
    func copy(with zone: NSZone? = nil) -> UIView {
        let copy = UIView(frame: self.frame)
        //copy.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.bounds.width, height: self.bounds.height)
        copy.transform = self.transform
        var cup: Cup
        for cupSubview in self.subviews{
            cup = cupSubview as! Cup
            copy.addSubview(cup.makeCupCopy())
        }
        return copy
    }
}


