//
//  ImageCardUIView.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 8/7/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation
import UIKit

class ImageCardUIView: UIView, CardUIViewAnimationCompleteDelegate, UIScrollViewDelegate {
    var delegate: CardUIViewClickedDelegate?
    var enlarged: Bool = false
    
    var topNonEnlargedConstraint: NSLayoutConstraint!
    var bottomNonEnlargedConstraint: NSLayoutConstraint!
    var leadingNonEnlargedConstraint: NSLayoutConstraint!
    var trailingNonEnlargedConstraint: NSLayoutConstraint!
    
    var topEnlargedConstraint: NSLayoutConstraint!
    var bottomEnlargedConstraint: NSLayoutConstraint!
    var leadingEnlargedConstraint: NSLayoutConstraint!
    var trailingEnlargedConstraint: NSLayoutConstraint!

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.maximumZoomScale = 1.0   //Changed in the animationComplete delegate
        scrollView.minimumZoomScale = 1.0
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onDownSwipe(sender:)))
        swipeGestureRecognizer.direction = .down
        scrollView.addGestureRecognizer(swipeGestureRecognizer)
        
        let singeTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onSingleTap))
        singeTapGestureRecognizer.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(singeTapGestureRecognizer)
        
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDoubleTap(sender:)))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGestureRecognizer)
        
        scrollView.addSubview(image)
        return scrollView
    }()
    
    lazy var image: PBImageView = {
        let image = PBImageView(image: nil)
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            //layout scrollView
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            //layout image
            image.topAnchor.constraint(equalTo: scrollView.topAnchor),
            image.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            image.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
            ])
    }
    
    //custom views should override this to return true if
    //they cannot layout correctly using autoresizing.
    //from apple docs https://developer.apple.com/documentation/uikit/uiview/1622549-requiresconstraintbasedlayout
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}

//Selectors
extension ImageCardUIView {
    //Called on image downswipe
    @objc func onDownSwipe(sender: UITapGestureRecognizer) {
        if scrollView.zoomScale == 1 {
            if delegate != nil {
                delegate!.cardClicked(card: self)
            }
        }
    }
    
    //Called on image singe tap
    @objc func onSingleTap() {
        if !enlarged {
            if delegate != nil {
                delegate!.cardClicked(card: self)
            }
        }
    }
    
    //Called on image double tap
    @objc func onDoubleTap(sender: UITapGestureRecognizer) {
        if enlarged {
            if scrollView.zoomScale < scrollView.maximumZoomScale {
                scrollView.zoom(toPoint: sender.location(in: self), scale: scrollView.maximumZoomScale, animated: true)
            } else {
                scrollView.zoom(toPoint: CGPoint(x: 0, y: 0), scale: 1, animated: true)
            }
        }
    }
}

//Public functions
extension ImageCardUIView {
    public func setConstraints(normalView: UIView, enlargedView: UIView) {
        topNonEnlargedConstraint = topAnchor.constraint(equalTo: normalView.topAnchor)
        bottomNonEnlargedConstraint = bottomAnchor.constraint(equalTo: normalView.bottomAnchor)
        leadingNonEnlargedConstraint = leadingAnchor.constraint(equalTo: normalView.leadingAnchor)
        trailingNonEnlargedConstraint = trailingAnchor.constraint(equalTo: normalView.trailingAnchor)
        
        topEnlargedConstraint = topAnchor.constraint(equalTo: enlargedView.topAnchor, constant: 44)
        bottomEnlargedConstraint = bottomAnchor.constraint(equalTo: enlargedView.bottomAnchor)
        leadingEnlargedConstraint = leadingAnchor.constraint(equalTo: enlargedView.leadingAnchor)
        trailingEnlargedConstraint = trailingAnchor.constraint(equalTo: enlargedView.trailingAnchor)
        
        topNonEnlargedConstraint.isActive = true
        bottomNonEnlargedConstraint.isActive = true
        leadingNonEnlargedConstraint.isActive = true
        trailingNonEnlargedConstraint.isActive = true
        
        topEnlargedConstraint.isActive = false
        bottomEnlargedConstraint.isActive = false
        leadingEnlargedConstraint.isActive = false
        trailingEnlargedConstraint.isActive = false
    }
    
    public func changeConstraints() {
        if enlarged {
            topEnlargedConstraint.isActive = false
            bottomEnlargedConstraint.isActive = false
            leadingEnlargedConstraint.isActive = false
            trailingEnlargedConstraint.isActive = false
            
            topNonEnlargedConstraint.isActive = true
            bottomNonEnlargedConstraint.isActive = true
            leadingNonEnlargedConstraint.isActive = true
            trailingNonEnlargedConstraint.isActive = true
        } else {
            topNonEnlargedConstraint.isActive = false
            bottomNonEnlargedConstraint.isActive = false
            leadingEnlargedConstraint.isActive = false
            trailingEnlargedConstraint.isActive = false
            
            topEnlargedConstraint.isActive = true
            bottomEnlargedConstraint.isActive = true
            leadingEnlargedConstraint.isActive = true
            trailingEnlargedConstraint.isActive = true
        }
    }
}

//Delegates
extension ImageCardUIView {
    func animationComplete() {
        enlarged = !enlarged
        
        if enlarged {
            scrollView.maximumZoomScale = 3.0
        } else {
            scrollView.maximumZoomScale = 1.0
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
}


