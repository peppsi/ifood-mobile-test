//
//  GCButton.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
//
//  Created by Guilherme Coelho on 22/11/16.
//  Copyright © 2016 Guilherme Coelho. All rights reserved.
//

import UIKit

class GCButton: UIButton {
  
  var title:String = ""
  
  let corner:CGFloat = 3.0
  
  var color:UIColor = UIColor.white
  
  var indicator:UIActivityIndicatorView = UIActivityIndicatorView()
  
  var shadowLayer: CAShapeLayer!
  
  override var isEnabled: Bool {
    didSet {
      if isEnabled == true {
        self.alpha = 1.0
      }
      else {
        self.alpha = 0.5
      }
    }
  }
  
  override init(frame: CGRect) {
    // set myValue before super.init is called
    super.init(frame: frame)
    // set other operations after super.init, if required
  }
  
  
  override public func awakeFromNib() {
    super.awakeFromNib()
    self.addTarget(self, action: #selector(pulse), for: .touchUpInside)
  }
  
  required init(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)!
    
    if let title = self.titleLabel {
      self.title = title.text ?? ""
    }
    self.layer.cornerRadius = corner
  }
  
  func setColor(newColor:UIColor){
    self.color = newColor
    self.tintColor = self.color
  }
  
  override func layoutSubviews() {
    
    super.layoutSubviews()
    
    if shadowLayer == nil {
      self.setShadowLayer()
    }
  }
  
  func setShadowLayer(){
    
    shadowLayer = CAShapeLayer()
    shadowLayer.path = UIBezierPath(roundedRect: bounds,
                                    cornerRadius: corner).cgPath
    
    let bgColor:UIColor = self.backgroundColor ?? Colors.VPBlue
    
    shadowLayer.fillColor = bgColor.cgColor
    
    shadowLayer.shadowColor = UIColor.darkGray.cgColor
    shadowLayer.shadowPath = shadowLayer.path
    shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    shadowLayer.shadowOpacity = 0.8
    shadowLayer.shadowRadius = 2
    
    layer.insertSublayer(shadowLayer, at: 0)
    
  }
  
  func setBGColor(color:UIColor){
    
    self.backgroundColor = color
    
    if let slayer = self.shadowLayer {
      slayer.fillColor = color.cgColor
    }
  }
  
  func loadingIndicator(show: Bool) {
    
    let enabled = self.isEnabled
    
    if(show){
      
      self.isEnabled = true
      
      let buttonHeight = self.bounds.size.height
      let buttonWidth = self.bounds.size.width
      
      if self.backgroundColor == UIColor.white {
        indicator.color = self.tintColor
      } else {
        indicator.color = UIColor.white
      }
      
      indicator.center = CGPoint(buttonWidth/2, buttonHeight/2)
      indicator.tag = tag
      self.addSubview(indicator)
      indicator.startAnimating()
      
      self.setTitle("", for: .normal)
      
    }else{
      
      self.setTitle(self.title, for: .normal)
      indicator.stopAnimating()
      indicator.isHidden = true
      
      self.isEnabled = enabled
      
    }
  }
  
  // MARK: - Touches
  
  @objc func pulse(){
    
    UIView.animate(withDuration: TimeInterval(0.1), animations: {
      
      self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
      
    },completion:{completion in
      UIView.animate(withDuration: TimeInterval(0.1), animations: { () -> Void in
        
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
      })
    })
  }
  
  
}

