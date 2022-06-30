//
//  MainDatePicker.swift
//  Lesson13_2
//
//  Created by Мурад Чеерчиев on 30.06.2022.
//

import UIKit

class MainDatePicker: UIDatePicker {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.preferredDatePickerStyle = .wheels
        self.datePickerMode = .date
    }
    
}
