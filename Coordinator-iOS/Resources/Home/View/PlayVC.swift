//
//  PlayVC.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 25/1/23.
//

import UIKit

class PlayVC: UIViewController {

    var coordinator: PlayFlow?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gotoTabBar(_ sender: Any) {
        coordinator?.goToTabBar()
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
