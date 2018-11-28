//
//  Recognition2ViewController.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/18/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import UIKit

class Recognition2ViewController: UIViewController, CardUIViewClickedDelegate {
    @IBOutlet weak var screenAreaUIView: UIView!
    @IBOutlet weak var rankUILabel: UILabel!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var selectUIButton: UIButton!
    @IBOutlet weak var helpUIButton: UIButton!
    @IBOutlet weak var pageIndicatorUIPageControl: UIPageControl!
    @IBOutlet weak var blackBackgroundUIView: UIView!
    @IBOutlet weak var noMatchUIView: UIView!

    var userImage: UIImage!
    var userState: State?
    var ticks: [Tick]!
    var currentTickCardIndex: Int = 0
    var tickCards: [PossibleTickCardUIView] = [PossibleTickCardUIView]()
    var animating: Bool = false

    @IBAction func helpButtonClicked() {
        if !animating {
            self.performSegue(withIdentifier: "jumpToHelp", sender: nil)
        }
    }
    @IBAction func selectButtonClicked() {
        if !animating && noMatchUIView.isHidden {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM.dd.yy"
            let result = formatter.string(from: date)
            
            let name: String = {
                if userState == nil { return "" } else { return userState!.name}
            }()
            
            let tick = UserTick(image: userImage, date: result, state: name, tickClassString: ticks[currentTickCardIndex].abbreviation)
            AppDelegate.userTicks = UserTick.appendAndOrderArray(append: tick, to: AppDelegate.userTicks)
            
            self.performSegue(withIdentifier: "jumpToTickDetail", sender: tick)
        } else if !noMatchUIView.isHidden {
            navigationController!.popViewController(animated: true)
        }
    }
}

//Overridden stuff and delegates
extension Recognition2ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        blackBackgroundUIView.alpha = 0
        blackBackgroundUIView.isHidden = true
        
        noMatchUIView.layer.cornerRadius = 10
        noMatchUIView.alpha = 0
        noMatchUIView.transform = CGAffineTransform(translationX: screenAreaUIView.frame.width, y: 0)
        noMatchUIView.isHidden = true

        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        self.view.addGestureRecognizer(swipeRightGestureRecognizer)
        self.view.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        for t in ticks {
            let card = PossibleTickCardUIView(frame: CGRect.zero)
            card.delegate = self
            self.view.addSubview(card)
            card.setConstraints(normalView: screenAreaUIView, enlargedView: self.view)
            
            card.image.image = t.image
            card.translatesAutoresizingMaskIntoConstraints = false
            
            tickCards.append(card)
            
            if tickCards.count > 1 {
                card.transform = CGAffineTransform(translationX: self.screenAreaUIView.frame.width, y: 0)
                card.alpha = 0
            }
        }
        titleUILabel.text = ticks[0].commonName!
        
        pageIndicatorUIPageControl.numberOfPages = ticks.count + 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "jumpToTickDetail" {
            if let destinationVC = segue.destination as? MyTicks2ViewController,
                let tick = sender as? UserTick {
                destinationVC.userTick = tick
            }
        }
    }

    //Called when a PossibleTickCardUIView is clicked
    func cardClicked(card: UIView) {
        let card = card as! PossibleTickCardUIView
        if card.enlarged {
            //Shrink
            animating = true
            blackBackgroundUIView.isHidden = true

            card.changeConstraints()
            self.navigationController?.setNavigationBarHidden(false, animated: true)

            UIView.animate(withDuration: 0.25, animations: {
                card.contentView.layer.cornerRadius = 10
                card.image.contentMode = .scaleAspectFill
                self.blackBackgroundUIView.alpha = 0
                
                self.view.layoutIfNeeded()
            }) { (true) in
                card.animationComplete()
                self.animating = false
                self.blackBackgroundUIView.isHidden = true
            }
        } else {
            //Enlarge
            blackBackgroundUIView.isHidden = false

            card.changeConstraints()
            self.navigationController?.setNavigationBarHidden(true, animated: true)

            UIView.animate(withDuration: 0.25, animations: {
                card.contentView.layer.cornerRadius = 0
                card.image.contentMode = .scaleAspectFit
                self.blackBackgroundUIView.alpha = 1
                
                self.view.layoutIfNeeded()
            }) { (true) in
                card.animationComplete()
                self.animating = false
            }
        }
    }

    @objc func onSwipeLeft() {
        if !tickCards[currentTickCardIndex].enlarged {
            if currentTickCardIndex < tickCards.count - 1 {
                animating = true
                
                self.pageIndicatorUIPageControl.currentPage += 1
                self.rankUILabel.text = "#\(self.currentTickCardIndex + 2)"
                self.titleUILabel.text = "\(self.ticks[self.currentTickCardIndex + 1].commonName!)"
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.tickCards[self.currentTickCardIndex].transform = CGAffineTransform(translationX: -self.screenAreaUIView.frame.width, y: 0)
                    self.tickCards[self.currentTickCardIndex].alpha = 0
                    self.tickCards[self.currentTickCardIndex + 1].transform = CGAffineTransform.identity
                    self.tickCards[self.currentTickCardIndex + 1].alpha = 1
                }) { (true) in
                    self.currentTickCardIndex += 1
                    self.animating = false
                }
            } else if currentTickCardIndex == tickCards.count - 1{
                //Show noMatchUIView
                animating = true
                noMatchUIView.isHidden = false
                
                self.pageIndicatorUIPageControl.currentPage += 1
                self.titleUILabel.text = "No Match"
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.tickCards[self.currentTickCardIndex].transform = CGAffineTransform(translationX: -self.screenAreaUIView.frame.width, y: 0)
                    self.tickCards[self.currentTickCardIndex].alpha = 0
                    
                    self.noMatchUIView.transform = CGAffineTransform.identity
                    self.noMatchUIView.alpha = 1
                    
                    self.rankUILabel.alpha = 0
                    self.helpUIButton.alpha = 0
                }) { (true) in
                    self.animating = false
                }
            }
        }
    }

    @objc func onSwipeRight() {
        if !tickCards[currentTickCardIndex].enlarged {
            if !noMatchUIView.isHidden {
                //Hide noMatchUIView
                animating = true
                
                self.pageIndicatorUIPageControl.currentPage -= 1
                self.titleUILabel.text = "\(self.ticks[self.currentTickCardIndex].commonName!)"
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.tickCards[self.currentTickCardIndex].transform = CGAffineTransform.identity
                    self.tickCards[self.currentTickCardIndex].alpha = 1
                    
                    self.noMatchUIView.transform = CGAffineTransform(translationX: self.screenAreaUIView.frame.width, y: 0)
                    self.noMatchUIView.alpha = 0
                    
                    self.rankUILabel.alpha = 1
                    self.helpUIButton.alpha = 1
                }) { (true) in
                    self.animating = false
                    self.noMatchUIView.isHidden = true
                }
            } else if currentTickCardIndex > 0 {
                animating = true
                
                self.pageIndicatorUIPageControl.currentPage -= 1
                self.rankUILabel.text = "#\(self.currentTickCardIndex)"
                self.titleUILabel.text = "\(self.ticks[self.currentTickCardIndex - 1].commonName!)"
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.tickCards[self.currentTickCardIndex].transform = CGAffineTransform(translationX: self.screenAreaUIView.frame.width, y: 0)
                    self.tickCards[self.currentTickCardIndex].alpha = 0
                    self.tickCards[self.currentTickCardIndex - 1].transform = CGAffineTransform.identity
                    self.tickCards[self.currentTickCardIndex - 1].alpha = 1
                }) { (true) in
                    self.currentTickCardIndex -= 1
                    self.animating = false
                }
            }
        }
    }
}

