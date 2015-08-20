//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Ravi Shankar on 21/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var boundLabel: UILabel!
    

    @IBOutlet weak var frameSlider: UISlider!
    @IBOutlet weak var boundsSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set the current value
        
        frameSlider.value = Float(parentView.frame.origin.y)
        boundsSlider.value = Float(parentView.bounds.origin.y)
        
        updateFrameValues(frameSlider.value)
        updateBoundsValues(boundsSlider.value)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func frameSlider(sender: AnyObject) {
        updateFrameValues(frameSlider.value)
    }
    
    
    @IBAction func boundsSlider(sender: AnyObject) {
        updateBoundsValues(boundsSlider.value)
    }
    
    func updateFrameValues(value: Float) {
        let value = round(value)
        parentView.frame.origin.y = CGFloat(value)
        frameLabel.text = "Frame y = \(value)"
    }
    
    func updateBoundsValues(value: Float) {
        let value = round(value)
        parentView.bounds.origin.y = CGFloat(value)
        boundLabel.text = "Bounds y = \(value)"
    }
}

