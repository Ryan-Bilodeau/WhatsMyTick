//
//  Extensions.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/26/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    // This function was taken from GitHub here:
    // https://gist.github.com/TimOliver/71be0a8048af4bd86ede
    func zoom(toPoint zoomPoint : CGPoint, scale : CGFloat, animated : Bool) {
        //Ensure scale is clamped to the scroll view's allowed zooming range
        var scale = CGFloat.minimum(scale, maximumZoomScale)
        scale = CGFloat.maximum(scale, self.minimumZoomScale)
        
        //`zoomToRect` works on the assumption that the input frame is in relation
        //to the content view when zoomScale is 1.0
        
        //Work out in the current zoomScale, where on the contentView we are zooming
        var translatedZoomPoint : CGPoint = .zero
        translatedZoomPoint.x = zoomPoint.x + contentOffset.x
        translatedZoomPoint.y = zoomPoint.y + contentOffset.y
        
        //Figure out what zoom scale we need to get back to default 1.0f
        let zoomFactor = 1.0 / zoomScale
        
        //By multiplying by the zoom factor, we get where we're zooming to, at scale 1.0f;
        translatedZoomPoint.x *= zoomFactor
        translatedZoomPoint.y *= zoomFactor
        
        //work out the size of the rect to zoom to, and place it with the zoom point in the middle
        var destinationRect : CGRect = .zero
        destinationRect.size.width = frame.width / scale
        destinationRect.size.height = frame.height / scale
        destinationRect.origin.x = translatedZoomPoint.x - destinationRect.width * 0.5
        destinationRect.origin.y = translatedZoomPoint.y - destinationRect.height * 0.5 
        
        if animated {
            UIView.animate(withDuration: 0.55, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.6, options: [.allowUserInteraction], animations: {
                self.zoom(to: destinationRect, animated: false)
            }, completion: {
                completed in
                if let delegate = self.delegate, delegate.responds(to: #selector(UIScrollViewDelegate.scrollViewDidEndZooming(_:with:atScale:))), let view = delegate.viewForZooming?(in: self) {
                    delegate.scrollViewDidEndZooming!(self, with: view, atScale: scale)
                }
            })
        } else {
            zoom(to: destinationRect, animated: false)
        }
    }
}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}
