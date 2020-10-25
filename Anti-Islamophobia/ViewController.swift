//
//  ViewController.swift
//  Anti-Islamophobia
//
//  Created by Claire Cho on 10/24/20.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    var ref: DocumentReference? = nil
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameError.isHidden = true
        self.messageError.isHidden = true
    }

    @IBOutlet weak var nameInput: UITextView!
    @IBOutlet weak var messageInput: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var messageError: UILabel!
    @IBAction func sendPressed(_ sender: UIButton) {
        if nameInput.text == "" || messageInput.text == "" {
            if nameInput.text == "" && messageInput.text == "" {
                nameError.isHidden = false
                messageError.isHidden = false
            } else if messageInput.text == "" {
                messageError.isHidden = false
                nameError.isHidden = true
            } else {
                nameError.isHidden = false
                messageError.isHidden = true
            }
        } else {
            nameError.isHidden = true
            messageError.isHidden = true
            ref = db.collection("feedback").addDocument(data: [
                "name": String(nameInput.text),
                "message": String(messageInput.text),
            ])
            nameInput.text = ""
            messageInput.text = ""
            performSegue(withIdentifier: "toHome", sender: self)
        }
    }
}

