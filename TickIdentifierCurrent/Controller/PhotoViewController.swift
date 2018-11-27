//
//  PhotoViewController.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/25/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var whiteUIView: UIView!
    
    var userImage: UIImage?
}

//Overridden stuff and delegates
extension PhotoViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        photo.image = userImage
        
        if userImage == nil {
            whiteUIView.isHidden = true
            scrollView.isHidden = true
        } else {
            whiteUIView.isHidden = false
            scrollView.isHidden = false
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDoubleTap(sender:)))
        scrollView.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.numberOfTapsRequired = 2
        
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = 1.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return  photo
    }
    
    @objc func onDoubleTap(sender: UITapGestureRecognizer) {
        if scrollView.zoomScale < scrollView.maximumZoomScale {
            scrollView.zoom(toPoint: sender.location(in: self.view), scale: scrollView.maximumZoomScale, animated: true)
        } else {
            scrollView.zoom(toPoint: CGPoint(x: 0, y: 0), scale: 1, animated: true)
        }
    }
}
