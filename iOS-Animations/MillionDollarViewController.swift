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

    @IBOutlet weak var labelConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordtextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelTopConstraint: NSLayoutConstraint!

    
    @IBAction func loginButton(_ sender: Any) {
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        labelConstraint.constant -= view.bounds.width
        emailTextViewConstraint.constant -= view.bounds.width
        passwordtextFieldConstraint.constant -= view.bounds.width
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 1.0,
                                delay: 0.0,
                                options: [.curveEaseOut],
                                animations: {
                                    self.labelConstraint.constant += self.view.bounds.width

                                    self.view.layoutIfNeeded()
        },
                                completion: nil)

        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       options: [.curveEaseOut],
                       animations: {
                        self.emailTextViewConstraint.constant += self.view.bounds.width

                        self.view.layoutIfNeeded()
        },
                       completion: nil)

        UIView.animate(withDuration: 1.0,
                       delay: 0.6,
                       options: [.curveEaseOut],
                       animations: {
                        self.passwordtextFieldConstraint.constant += self.view.bounds.width

                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self

        registerForKeyboardNotifications()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }

    // MARK: Keyboard Handling Methods
    private func registerForKeyboardNotifications() {

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        adjustingHeight(showing: true, notification: notification)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        adjustingHeight(showing: false, notification: notification)

    }

    private func adjustingHeight(showing: Bool, notification: NSNotification) {

        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }

        guard let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }

        guard let curve = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? UInt
            else { return }

        let changeInHeight = keyboardSize.height * (showing ? 1 : -1)

        UIView.animate(withDuration: animationDuration,
                       delay: 0.0,
                       options: UIViewAnimationOptions(rawValue: curve),
                       animations: {
                        self.loginButtonBottomConstraint.constant += changeInHeight
                        self.labelTopConstraint.constant -= changeInHeight

                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
}

