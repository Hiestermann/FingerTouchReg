//
//  ViewController.swift
//  FingerTouchReg
//
//  Created by Kilian on 20.12.17.
//  Copyright © 2017 Kilian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let numViewPerRow = 15
    var cells = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        for j in 0...30 {
            for i in 0...numViewPerRow {
                let squareView = UIView()
                squareView.backgroundColor = randomColor()
                squareView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width , width: width, height: width)
                squareView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(squareView)
                let key = "\(i)|\(j)"
                cells[key] = squareView
            }
        }
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }

    var selectedCell: UIView?
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
       let location = gesture.location(in: view)
        
        let width = view.frame.width / CGFloat(numViewPerRow)

        let i = Int(location.x / width)
        let j = Int(location.y / width)

        let key = "\(i)|\(j)"
        guard let cellView = cells[key] else { return }
        
        if selectedCell != cellView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedCell?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        
        selectedCell = cellView
        
        view.bringSubview(toFront: cellView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
        }, completion: nil)
        
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedCell?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
    }
    
    fileprivate func randomColor() -> UIColor{
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

