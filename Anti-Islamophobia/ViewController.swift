//
//  ViewController.swift
//  Anti-Islamophobia
//
//  Created by Claire Cho on 10/24/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.background.alpha = 0
        self.logo.alpha = 0
        UIView.animate(withDuration: 1) {
            self.background.alpha = 1
        } completion: { (Bool) in
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.logo.alpha = 1
            }, completion: { (Bool) in
                sleep(1)
                self.performSegue(withIdentifier: "toMain", sender: self)
            })

        }

    }
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var background2: UIImageView!
    

}

