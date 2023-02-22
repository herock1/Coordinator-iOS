//
//  TabBarVC.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 30/1/23.
//

import UIKit

class TabBarVC: UITabBarController {

    var coordinator: TabBarCoordinator?

    // Add rules where configuration exists

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .default
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.orange
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
