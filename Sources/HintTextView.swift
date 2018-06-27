//
//  HintTextView.swift
//  HintTextView
//
//  Created by DH on 2018. 6. 25..
//  Copyright © 2018년 outofcode. All rights reserved.
//

import UIKit

open class HintTextView: UITextView {
    
    private let placeHolderTop: CGFloat = 8.0
    private let placeHolderLeft: CGFloat = 4.0
    
    private let defaultColor = UIColor(red: 128 / 255, green: 128 / 255, blue: 128 / 255, alpha: 1.0)
    
    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.alpha = 1.0
        return label
    }()
    
    @IBInspectable
    public var hint: String = "" {
        didSet {
            hintLabel.text = hint
            placeHolderSizeToFit()
        }
    }
    
    @IBInspectable
    public var hintColor: UIColor = .lightGray {
        didSet {
            hintLabel.textColor = hintColor
        }
    }
    
    @IBInspectable
    public var hintFont: UIFont? {
        didSet {
            hintLabel.font = hintFont
            placeHolderSizeToFit()
        }
    }
    
    // MARK: - init
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    convenience public init() {
        self.init(frame: CGRect.zero, textContainer: nil)
    }
    
    convenience public init(frame: CGRect) {
        self.init(frame: frame, textContainer: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Override

extension HintTextView {
    
    override open var text: String! {
        didSet {
            performTextChange()
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Private

extension HintTextView {
    
    private func setup() {
        contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let size = font?.pointSize ?? 12.0
        hintLabel.font = UIFont.systemFont(ofSize: size)
        hintLabel.textColor = hintColor
        hintLabel.text = hint
        
        placeHolderSizeToFit()
        
        addSubview(hintLabel)
        
        self.sendSubview(toBack: hintLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(_:)), name: .UITextViewTextDidChange, object: nil)
        performTextChange()
    }
    
    private func placeHolderSizeToFit() {
        let width = bounds.width - (placeHolderLeft * 2)
        hintLabel.frame = CGRect(x: placeHolderLeft, y: placeHolderTop, width: width, height: 0.0)
        hintLabel.sizeToFit()
    }
    
    private func performTextChange() {
        hintLabel.alpha = self.text.isEmpty ? 1.0 : 0.0
    }
    
    private var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}

extension HintTextView {
    
    @objc private func textChanged(_ notification:Notification?) {
        performTextChange()
    }
}
