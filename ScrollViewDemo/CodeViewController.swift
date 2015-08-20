//
//  CodeViewController.swift
//  ScrollViewDemo
//
//  Created by Ravi Shankar on 13/08/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView:UIScrollView!
    var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        scrollView = UIScrollView(frame: view.bounds)
        
        imageView = UIImageView(image: UIImage(named: "nature"))
       
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        scrollView.backgroundColor = UIColor.lightGrayColor()
        scrollView.addSubview(imageView)
        
        view.addSubview(scrollView)
        
        scrollView.contentOffset = CGPoint(x: 690.5, y: 0)
        scrollView.delegate = self
        
       setZoomScaleValues()
       // centreImage()
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScaleValues()
        
        centreImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- UIScrollView Delegate methods
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //println(scrollView.bounds.origin.x)
        centreImage()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    // MARK:- Set Zoom Values
    
    func setZoomScaleValues() {
        
        let imageSize = imageView.bounds.size
        
        let widthRatio = scrollView.bounds.size.width / imageSize.width
        let heightRatio = scrollView.bounds.size.height / imageSize.height
        
        let minScale = min(widthRatio, heightRatio)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 2.0
        scrollView.zoomScale = minScale
    }
    
    func centreImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageSize = imageView.frame.size
        
        let horizontalSpace = imageSize.width < scrollViewSize.width ? (scrollViewSize.width - imageSize.width) / 2 : 0
        
        let veriticalSpace = imageSize.height < scrollViewSize.height ? (scrollViewSize.height - imageSize.height) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: veriticalSpace, left: horizontalSpace, bottom: veriticalSpace, right: horizontalSpace)

    }

}
