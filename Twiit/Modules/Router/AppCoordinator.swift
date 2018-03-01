//
//  AppCoordinator.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
  
  // MARK: - View
  
  enum Views {
    
    case intro
    case login
    case tweetlist
    case tweetDetails

  }

  // MARK: - Private
  private let navigationController: UINavigationController
  private let application: App
  
  // MARK: - Lifecycle
  
  init(window: UIWindow, navigationController: UINavigationController, application: App) {
    
    self.application = application
    self.navigationController = navigationController
    window.rootViewController = self.navigationController
    window.makeKeyAndVisible()
    
  }
  
  // MARK: - Public
  
  func start() {
    self.showIntro()
  }
  
  // MARK: - Private
  
  // Controller #1 Intro
  private func showIntro() {
    
  }
  
  // Controller #2 Login
  
  private func showLogin() {
    
  }
  
  // Controller #3 TweetList
  
  private func showTweetList() {
    
//    let title = ViewNames.destination.title
//
//    let viewModel = SelectDestinationViewModel(viewTitle: title, vacation: vacationPlan)
//
//    viewModel.didPressedNext = {
//      [weak self] vacation in
//      self?.showWeatherController(vacationPlan: vacation)
//    }
//
//    let vc = SelectDestinationViewController(viewModel: viewModel)
//    self.navigationController.pushViewController(vc, animated: true)
  }
  
  // Controller #4 TweetDetail
  
  private func showTweetDetail() {
    
//    let title = ViewNames.selectWeather.title
//
//    let viewModel = SelectWeathersViewModel(viewTitle: title, vacation: vacationPlan)
//
//    viewModel.didPressedNext = {
//      [weak self] vacation in
//      self?.showSelectYearController(vacationPlan: vacation)
//    }
//
//    let vc = SelectWeathersViewController(viewModel: viewModel)
//    self.navigationController.pushViewController(vc, animated: true)
  }
  
}
