//
//  ViewController.swift
//  PanrecogniserDemo
//
//  Created by Sriteja Thuraka on 7/28/17.
//  Copyright © 2017 Sriteja Thuraka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dragLabel: UILabel!
    @IBOutlet weak var trashLabel: UILabel!
    
    @IBOutlet weak var trashView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          dragLabel.text = "Drag"
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(dragAction(gestureRecognizer:)))
        dragLabel.isUserInteractionEnabled = true
        dragLabel.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func dragAction(gestureRecognizer: UIPanGestureRecognizer) {
        
        let translate = gestureRecognizer.translation(in: view)
//        let draglabel = gestureRecognizer.view
        dragLabel.center = CGPoint(x: self.view.bounds.width / 2 + translate.x, y: self.view.bounds.height / 2 + translate.y)
        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            
            
            if dragLabel.center.y > 240 {
                
                trashLabel.text = dragLabel.text
                dragLabel.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
                
            }
            
        }
        print(translate)
    }
}

