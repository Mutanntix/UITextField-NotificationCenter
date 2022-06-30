//
//  MainButton.swift
//  Lesson5
//
//  Created by Мурад Чеерчиев on 15.06.2022.
//

import UIKit

class MainButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, color: UIColor,
                     highlightColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
        self.setTitleColor(highlightColor, for: .highlighted)
        self.layer.cornerRadius = 5
    }
    
    convenience init(systemImageName: String,
                     highLightImageName: String,
                     color: UIColor? = nil) {
        self.init(frame: .zero)
        self.backgroundColor = color
        self.setImage(UIImage(systemName: systemImageName),
                      for: .normal)
        self.setImage(UIImage(systemName: highLightImageName),
                      for: .highlighted)
    }
    
    convenience init(systemImageName: String,
                     highLightImageName: String,
                     color: UIColor? = nil,
                     scale: UIImage.SymbolScale,
                     weight: UIImage.SymbolWeight,
                     pSize: CGFloat,
                     tintColor: UIColor? = nil) {
        self.init()
        
        let config = UIImage.SymbolConfiguration(pointSize: pSize,
                                                 weight: weight,
                                                 scale: scale)
        let defaultImg = UIImage(systemName: systemImageName,
                                 withConfiguration: config)
        let highlightImg = UIImage(systemName: highLightImageName,
                                   withConfiguration: config)
        
        self.setImage(defaultImg,
                      for: .normal)
        self.setImage(highlightImg,
                      for: .highlighted)
        self.tintColor = tintColor
    }
}
