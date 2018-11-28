//
//  MyTicks2ViewController.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/31/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import UIKit

class MyTicks2ViewController: UIViewController, CardUIViewClickedDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoContainerUIView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var regionUILabel: UILabel!
    @IBOutlet weak var overviewUILabel: UILabel!
    @IBOutlet weak var diseasesUILabel: UILabel!
    @IBOutlet weak var dNameUILabel: UILabel!
    @IBOutlet weak var dRiskUILabel: UILabel!
    @IBOutlet weak var whatToDoNextUILabel: UILabel!
    @IBOutlet weak var nextUILabel: UILabel!
    @IBOutlet weak var whiteBackgroundUIView: UIView!
    
    var userTick: UserTick!
    
    var card1Showing: Bool = true
    var animating: Bool = false
    let card1: ImageCardUIView = ImageCardUIView(frame: .zero)
    let card2: ImageCardUIView = ImageCardUIView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = userTick.tickClass.commonName
        nameUILabel.text = userTick.tickClass.scientificName
        if userTick.state != "" {
            regionUILabel.text = "Identified in \(userTick.state)"
        } else {
            regionUILabel.text = nil
        }
        overviewUILabel.text = userTick.tickClass.overview
        
        if userTick.diseases.diseases.count > 0 {
            var nameLabels: [UILabel] = [UILabel]()
            
            for i in 0...userTick.diseases.diseases.count - 1 {
                let nameLabel = UILabel(frame: .zero)
                nameLabel.font = nextUILabel.font
                nameLabel.textColor = .white
                nameLabel.numberOfLines = 0
                nameLabel.text = "\(userTick.diseases.diseases[i].commonName)"
                nameLabel.translatesAutoresizingMaskIntoConstraints = false
                
                scrollView.addSubview(nameLabel)
                nameLabels.append(nameLabel)
                
                NSLayoutConstraint.activate([
                    nameLabel.leadingAnchor.constraint(equalTo: diseasesUILabel.leadingAnchor, constant: 0),
                    nameLabel.widthAnchor.constraint(equalTo: dNameUILabel.widthAnchor, multiplier: 1)
                ])
                
                if i == 0 {     //First label
                    NSLayoutConstraint.activate([
                        nameLabel.topAnchor.constraint(equalTo: dNameUILabel.bottomAnchor, constant: 8)
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        nameLabel.topAnchor.constraint(equalTo: nameLabels[i - 1].bottomAnchor, constant: 10)
                    ])
                }
                
                //Last label
                if i == userTick.diseases.diseases.count - 1 {
                    NSLayoutConstraint.activate([
                            nameLabels[i].bottomAnchor.constraint(equalTo: whatToDoNextUILabel.topAnchor, constant: -16)
                    ])
                }
                
                
                let riskStr: NSMutableAttributedString = NSMutableAttributedString(string: "\(userTick.diseases.diseases[i].severityE)")
                riskStr.setColorForText(textForAttribute: "Low", withColor: .green)
                riskStr.setColorForText(textForAttribute: "Medium", withColor: .yellow)
                riskStr.setColorForText(textForAttribute: "High", withColor: .red)
                
                let riskLabel = UILabel(frame: .zero)
                riskLabel.font = nextUILabel.font
                riskLabel.textColor = .white
                riskLabel.numberOfLines = 0
                riskLabel.attributedText = riskStr
                riskLabel.translatesAutoresizingMaskIntoConstraints = false
                
                scrollView.addSubview(riskLabel)
                
                NSLayoutConstraint.activate([
                    riskLabel.topAnchor.constraint(equalTo: nameLabels[i].topAnchor, constant: 0),
                    riskLabel.centerXAnchor.constraint(equalTo: dRiskUILabel.centerXAnchor, constant: 0)
                ])
            }
        } else {
            let label = UILabel(frame: .zero)
            label.font = nextUILabel.font
            label.textColor = .white
            label.numberOfLines = 0
            label.text = "This tick is not known to transmit diseases in your state."
            label.translatesAutoresizingMaskIntoConstraints = false
            
            scrollView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: diseasesUILabel.bottomAnchor, constant: 7),
                label.leadingAnchor.constraint(equalTo: diseasesUILabel.leadingAnchor, constant: 0),
                label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
                label.bottomAnchor.constraint(equalTo: whatToDoNextUILabel.topAnchor, constant: -16)
            ])
            
            dNameUILabel.isHidden = true
            dRiskUILabel.isHidden = true
        }
        
        if userTick.tickClass.abbreviation == "Deer" {
            nextUILabel.text = "If this tick has been on you or a pet for longer than 24 hours, consider having it tested and paying your doctor a visit. Be aware that some diseases may be transmitted in less than 24 hours. Deer ticks are considered the most dangerous tick because of how many diseases they can carry."
        } else {
            nextUILabel.text = "If this tick has been on you or a pet for longer than 24 hours, consider having it tested and paying your doctor a visit. Be aware that some diseases may be transmitted in less than 24 hours."
        }
        
        whiteBackgroundUIView.alpha = 0
        whiteBackgroundUIView.isHidden = true
        
        card1.delegate = self
        card2.delegate = self
        self.view.addSubview(card1)
        self.view.addSubview(card2)
        
        card1.setConstraints(normalView: photoContainerUIView, enlargedView: self.view)
        card1.image.image = userTick.image
        
        card2.setConstraints(normalView: photoContainerUIView, enlargedView: self.view)
        card2.image.image = userTick.tickClass.image
        card2.transform = CGAffineTransform(translationX: photoContainerUIView.frame.width, y: 0)
        card2.alpha = 0
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        self.view.addGestureRecognizer(swipeRightGestureRecognizer)
        self.view.addGestureRecognizer(swipeLeftGestureRecognizer)
    }
}

//Delegates
extension MyTicks2ViewController {
    func cardClicked(card: UIView) {
        let card = card as! ImageCardUIView
        if card.enlarged {
            //Shrink
            animating = true
            whiteBackgroundUIView.isHidden = true
            
            card.changeConstraints()
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            
            UIView.animate(withDuration: 0.25, animations: {
                card.image.contentMode = .scaleAspectFill
                self.whiteBackgroundUIView.alpha = 0
                
                self.view.layoutIfNeeded()
            }) { (true) in
                card.animationComplete()
                self.animating = false
                self.whiteBackgroundUIView.isHidden = true
            }
        } else {
            //Enlarge
            whiteBackgroundUIView.isHidden = false
            card.changeConstraints()
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
            UIView.animate(withDuration: 0.25, animations: {
                card.image.contentMode = .scaleAspectFit
                self.whiteBackgroundUIView.alpha = 1
                
                self.view.layoutIfNeeded()
            }) { (true) in
                card.animationComplete()
                self.animating = false
            }
        }
    }
}

//Selectors
extension MyTicks2ViewController {
    @objc func onSwipeRight() {
        if !animating && !card1.enlarged && !card2.enlarged && !card1Showing {
            animating = true
            
            UIView.animate(withDuration: 0.25, animations: {
                self.card2.transform = CGAffineTransform(translationX: self.photoContainerUIView.frame.width, y: 0)
                self.card2.alpha = 0
                
                self.card1.transform = CGAffineTransform.identity
                self.card1.alpha = 1
            }) { (true) in
                self.animating = false
                self.card1Showing = true
                self.pageControl.currentPage = 0
            }
        }
    }
    @objc func onSwipeLeft() {
        if !animating && !card1.enlarged && !card2.enlarged && card1Showing {
            animating = true
            
            UIView.animate(withDuration: 0.25, animations: {
                self.card1.transform = CGAffineTransform(translationX: -self.photoContainerUIView.frame.width, y: 0)
                self.card1.alpha = 0
                
                self.card2.transform = CGAffineTransform.identity
                self.card2.alpha = 1
            }) { (true) in
                self.animating = false
                self.card1Showing = false
                self.pageControl.currentPage = 1
            }
        }
    }
}




