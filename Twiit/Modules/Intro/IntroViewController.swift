//
//  IntroViewController.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/2/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet weak var imgCloud1: UIImageView!
  @IBOutlet weak var imgCloud2: UIImageView!
  @IBOutlet weak var imgLogo: UIImageView!

  // MARK: - Class Properties

  var transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

  /// Bind without Rx
  var showNext: (() -> Void)?

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    prepareForAnimations()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    startAnimations()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  required convenience init() {
    self.init(nibName: nil, bundle: nil)
  }

  deinit {

  }

  // MARK: - Class Configurations

  private func viewConfiguration() {
    self.hideNavigationBar()

    let when = DispatchTime.now() + 1.0

    DispatchQueue.main.asyncAfter(deadline: when) {
      if let next = self.showNext {
        next()
      }
    }

  }

  // MARK: - Class Methods

  private func prepareForAnimations() {

    self.imgLogo.alpha = 0
    self.imgCloud1.alpha = 0.0
    self.imgCloud2.alpha = 0.0

  }

  private func startAnimations() {

    let rotate = CGAffineTransform(rotationAngle: CGFloat(Double.pi))

    UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
      self.imgCloud1.alpha = 1.0
    }, completion: nil)

    UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
      self.imgCloud2.alpha = 1.0
    }, completion: nil)

    UIView.animateKeyframes(withDuration: 0.5, delay: 0.6, options: [], animations: {
      self.imgLogo.alpha = 1

    }, completion: { _ in

      UIView.animate(withDuration:  0.5,
                     delay: 0.0,
                     options: [.curveLinear],
                     animations: {
                     self.transform = rotate
      }, completion: nil)

    })

    animateTheClouds(cloud: imgCloud1)
    animateTheClouds(cloud: imgCloud2)

  }

  private func animateTheClouds(cloud : UIImageView) {

    let cloudMovingSpeed = 60.0/view.frame.size.width
    let duration = (view.frame.size.width - cloud.frame.origin.x) * cloudMovingSpeed

    let interval = TimeInterval(duration)

    UIView.animate(withDuration: interval, delay: 0.0, options: .curveLinear, animations: {
      cloud.frame.origin.x = self.view.frame.size.width
    }, completion: { _ in
      cloud.frame.origin.x = -cloud.frame.size.width
      self.animateTheClouds(cloud: cloud)
    })
  }

  // MARK: - UIActions

}
