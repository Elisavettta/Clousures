//
//  ViewController.swift
//  ClousuresTest
//
//  Created by Harbros on 26.01.22.
//
//  swiftlint:disable ob_label_naming

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterView: UILabel!
    @IBOutlet private weak var buttonsView: ButtonsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsView.block = { action in
            self.buttonsView.changeLabel(counterLabel: self.counterView, actions: action)
        }
    }
}
