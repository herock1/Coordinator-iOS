//
//  ViewController.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 17/1/23.
//

import UIKit

class HomeVC: UIViewController {

    var coordinator: StartFlow?

    // Load Home
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Play gameAction
    @IBAction func playGameAction(_ sender: Any) {
        coordinator?.openNext()
    }
}
