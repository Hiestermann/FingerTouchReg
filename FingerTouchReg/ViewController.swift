//
//  ViewController.swift
//  FingerTouchReg
//
//  Created by Kilian on 20.12.17.
//  Copyright © 2017 Kilian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numViewPerRow = 15
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        for j in 0...30 {
            for i in 0...numViewPerRow {
                let squareView = UIView()
                squareView.backgroundColor = randomColor()
                squareView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width , width: width, height: width)
                squareView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(squareView)
            }
        }
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }

    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
       let location = gesture.location(in: view)
        print(location)
    }
    
    fileprivate func randomColor() -> UIColor{
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

