//
//  ViewController.swift
//  HintTextView
//
//  Created by DH on 2018. 6. 25..
//  Copyright © 2018년 outofcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textView: HintTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.placeHolderText = "텍스트를 입력하여 주세요."
    }
}
