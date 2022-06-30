//
//  UserLoginStackView.swift
//  Lesson13_2
//
//  Created by Мурад Чеерчиев on 30.06.2022.
//

import UIKit

class UserLoginStackView: UIStackView {
    let loginTF = MainTextField(frame: .zero,
                                placeholder: "Enter your login",
                                isSecure: false)
    let nickNameTF = MainTextField(frame: .zero,
                                 placeholder: "Enter your nickname",
                                 isSecure: false)
    let passwordTF = MainTextField(frame: .zero,
                                   placeholder: "Enter your password",
                                   isSecure: true)
    let birthDateTF = MainTextField(frame: .zero,
                                    placeholder: "Choose your birhdate",
                                    isSecure: false)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.axis = .vertical
        self.distribution = .equalCentering
        self.alignment = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
        addSubviews()
    }
    
    public func setDatePickerForKeyboard(picker: UIDatePicker) {
        birthDateTF.inputView = picker
    }
    
    private func addSubviews() {
        [loginTF, nickNameTF,
         passwordTF, birthDateTF].forEach({
            self.addArrangedSubview($0)
            $0.returnKeyType = .continue
        })
    }
    
}
