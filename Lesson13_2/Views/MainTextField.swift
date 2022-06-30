//
//  MainTextField.swift
//  Lesson5
//
//  Created by Мурад Чеерчиев on 15.06.2022.
//

import UIKit

class MainTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.borderStyle = .roundedRect
        self.clearButtonMode = .whileEditing
    }
    
    convenience init(frame: CGRect,
                     placeholder: String,
                     isSecure: Bool) {
        self.init(frame: frame)
        self.isSecureTextEntry = isSecure
        self.placeholder = placeholder
        self.font = .systemFont(ofSize: 14, weight: .heavy)
        self.leftView = UIView()
        self.leftViewMode = .always
        
        if isSecure {
            self.rightView = UIView()
            self.rightViewMode = .always
            self.clearsOnBeginEditing = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    override func becomeFirstResponder() -> Bool {

        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLeftView()
        setRightView()
    }
    
    private func setLeftView() {
        self.leftView?.frame
        = CGRect(origin: CGPoint(x: 0, y: 0),
               size: CGSize(width: frame.height * 0.1,
                            height: frame.height))
    }
    
    private func setRightView() {
        let frame = CGRect(origin: CGPoint(x: bounds.maxX - 45,
                                           y: 0),
                           size: CGSize(width: 40,
                                        height: frame.height))
        let button = getRightButton()
        self.rightView?.addSubview(button)
        self.rightView?.frame = frame
        button.frame = CGRect(x: 0,
                              y: 0,
                              width: frame.width,
                              height: frame.height)
    }
    
    private func getRightButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self,
                         action: #selector(visibilityBtnPrsd),
                         for: .touchUpInside)
        button.setImage(UIImage(named: "eye"), for: .normal)
        
        return button
    }
    
}

extension MainTextField {
    @objc private func visibilityBtnPrsd() {
        changeSecureState()
    }
    
    private func changeSecureState() {
        isSecureTextEntry = !isSecureTextEntry
    }
}
