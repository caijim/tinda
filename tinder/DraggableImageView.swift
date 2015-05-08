//
//  DraggableImageView.swift
//  tinder
//
//  Created by Jim Cai on 5/7/15.
//  Copyright (c) 2015 com.codepath. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var chill: UIView!
    
    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var card: UIImageView!
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        chill.frame = bounds
        addSubview(chill)
        
        // custom initialization logic
    }
    
    
    // MARK: Actions
    
    @IBAction func onImageDragged(sender: UIPanGestureRecognizer) {
        var point = sender.locationInView(sender.view)
        var velocity = sender.velocityInView(sender.view)
        var translation = sender.translationInView(sender.view!)
        if sender.state == UIGestureRecognizerState.Began {
            cardInitialCenter = card.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            card.center = CGPoint(x: self.cardInitialCenter.x+translation.x, y:  cardInitialCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                self.card.center =  CGPoint(x: self.cardInitialCenter.x, y: self.cardInitialCenter.y)
                }, completion: { (finished: Bool) -> Void in
            })
            
            
            
        }
    }

}
