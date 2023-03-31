//
//  SimpleGameApp.swift
//  SimpleGame
//
//  Created by user on 28.03.2023.
//

import SwiftUI
//
@main
struct SimpleGameApp: App {
    let persistenceController = PersistenceController.shared
  var nav = UINavigationItem()
  init() {
    // Change the NavigationView appearance
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    
  }

//    let appearance = UIBarButtonItem.appearance()
//  appearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
//    let font = UIFont.systemFont(ofSize: 22.0)
//    let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.blue]
//    appearance.setTitleTextAttributes(attributes, for: .normal)


     var body: some Scene {
         WindowGroup {
             WelcomeView()
         }
     }
 }



