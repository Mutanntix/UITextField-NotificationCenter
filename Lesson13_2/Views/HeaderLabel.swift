//
//  HeaderLabel.swift
//  Lesson5
//
//  Created by Мурад Чеерчиев on 15.06.2022.
//

import UIKit

class HeaderLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.font = .systemFont(ofSize: 25, weight: .bold)
        self.textAlignment = .left
        self.numberOfLines = 0
        self.text = "Header"
    }
    
    convenience init(font size: CGFloat, aligment: NSTextAlignment,
                     borderWidth: CGFloat) {
        self.init()
        self.font = .systemFont(ofSize: size, weight: .bold)
        self.textAlignment = aligment
        if borderWidth > 0 {
            self.layer.borderWidth = borderWidth
            self.layer.cornerRadius = 5
        }
    }
    
    convenience init(fontColor: UIColor, font: UIFont) {
        self.init()
        
        self.font = font
        self.textColor = fontColor
    }
    
    convenience init(fontColor: UIColor, font: UIFont, _ aligment: NSTextAlignment, text: String? = nil) {
        self.init(fontColor: fontColor, font: font)
        self.textAlignment = aligment
        guard let text = text
        else { return }
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
