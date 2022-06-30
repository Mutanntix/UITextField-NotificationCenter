//
//  ViewController.swift
//  Lesson13_2
//
//  Created by Мурад Чеерчиев on 30.06.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let mainView = UIScrollView()
    private let loginStackView = UserLoginStackView()
    private let mainButton =
    MainButton(title: "Sign in",
               color: mainBtnColor,
               highlightColor: .darkGray)
    private let birthdayDatePicker = MainDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializate()
    }

    private func initializate() {
        setupMainView()
        addSubviews()
        makeConstraints()
        becomeTextFieldsDelegate()
        setupBirhdateTextField()
        startObserveKeyboardNotifications()
    }
    
    deinit {
        stopObserveKeyboardNotifications()
    }
    
}

//MARK: UI
extension MainViewController {
    private func addSubviews() {
        [loginStackView, mainButton].forEach({
            mainView.addSubview($0)
        })
    }
    
    private func setupMainView() {
        view.addSubview(mainView)
        mainView.frame = view.bounds
    }
    
    private func setupToolBar(for textField: UITextField) {
        let toolBar = UIToolbar(frame: .zero)
        let rightBtn =
        UIBarButtonItem(barButtonSystemItem: .done,
                        target: self,
                        action: #selector(doneBtnPressed))
        let leftItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([leftItem, rightBtn], animated: true)
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
}

//MARK: Constraints
extension MainViewController {
    private func makeConstraints() {
        
        loginStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        mainButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.bottomMargin.equalTo(view.snp_bottomMargin)
                .multipliedBy(0.9)
        }
    }
}

//MARK: Methods
extension MainViewController {
    @objc private func doneBtnPressed() {
        view.endEditing(true)
    }
    
    @objc private func keyboardAppeared(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        mainView.contentOffset = CGPoint(x: 0,
                                         y: kbFrameSize.height * 0.6)
    }
    
    @objc private func keyboardDisappeared() {
        mainView.contentOffset = CGPoint(x: 0, y: 0)
    }
}


//MARK: UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginStackView.loginTF:
            loginStackView.nickNameTF.becomeFirstResponder()
        case loginStackView.nickNameTF:
            loginStackView.passwordTF.becomeFirstResponder()
        case loginStackView.passwordTF:
            loginStackView.birthDateTF.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    private func becomeTextFieldsDelegate() {
        [loginStackView.loginTF, loginStackView.nickNameTF,
         loginStackView.birthDateTF, loginStackView.passwordTF].forEach({
            $0.delegate = self
        })
    }
    
    private func setupBirhdateTextField() {
        loginStackView.setDatePickerForKeyboard(picker: birthdayDatePicker)
        setupToolBar(for: loginStackView.birthDateTF)
    }
}

//MARK: NSNotification
extension MainViewController {
    private func startObserveKeyboardNotifications() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardAppeared(_:)),
                         name:UIResponder.keyboardWillShowNotification,
                         object: nil)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardDisappeared),
                         name:UIResponder.keyboardWillHideNotification,
                         object: nil)
        
    }
    
    private func stopObserveKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
}
