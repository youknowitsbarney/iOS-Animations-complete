//
//  MillionDollarViewController.swift
//  iOS-Animations
//
//  Created by Barney on 07/02/2018.
//  Copyright © 2018 Barney. All rights reserved.
//

import UIKit

class MillionDollarViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var millionDollarLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func loginButton(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }
}

