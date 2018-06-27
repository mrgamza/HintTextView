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
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        
        textView.hint = "텍스트를 입력하여 주세요. 내가 하고 싶은 말을 다 적어봅시다."
    }
}
