//
//  SheetViewController.swift
//  Lesson13_2
//
//  Created by Мурад Чеерчиев on 30.06.2022.
//

import UIKit

class SheetViewController: UIViewController {
    var user: User!
    
    let userInfoLabel = HeaderLabel(fontColor: .black,
                                    font: .boldSystemFont(ofSize: 20),
                                    .center)

    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()
    }
    
    private func initialization() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        addSubviews()
        setupUserInfoLabel()
    }

}

extension SheetViewController {
    private func addSubviews() {
        [userInfoLabel].forEach({
            view.addSubview($0)
        })
    }
    
    private func setupUserInfoLabel() {
        let text = """
Your user login: \(user.login)
Your nickname: \(user.nickname)
Your password: \(user.getPassword())
Your birthdate: \(user.birhdate)
"""
        
        userInfoLabel.text = text
        
        userInfoLabel.frame.size =
        CGSize(width: view.bounds.width * 0.9,
               height: view.bounds.height * 0.5)
        userInfoLabel.center.x = view.center.x
        userInfoLabel.frame.origin.y = view.bounds.origin.y + 40
    }
}
