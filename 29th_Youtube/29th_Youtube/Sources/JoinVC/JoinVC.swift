//
//  JoinVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit

class JoinVC: BaseVC {

    var safeButton = UIButton()
    var safeLabel = UILabel()
    var nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(safeButton)
        view.addSubview(safeLabel)
        view.addSubview(nextButton)
        
        mainLabelLayout(labelName: "회원가입")
        infoLabelLayout(labelName: "")
        safeButtonLayout()
        safeLabelLayout()
        nextButtonLayout()
    }

    private func safeButtonLayout(){
        safeButton.tintColor = .googleBlue
        safeButton.layer.borderColor = UIColor.lightGray.cgColor
        safeButton.layer.borderWidth = 1
        safeButton.layer.cornerRadius = 3
        safeButton.snp.makeConstraints{ (make) in
            make.width.height.equalTo(17)
            make.leading.equalTo(30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(15)
        }
        
        nextButton.addTarget(self, action: #selector(toSafe), for: .touchUpInside)
    }
    
    private func safeLabelLayout(){
        safeLabel.text = "비밀번호 표시"
        safeLabel.textColor = .black
        safeLabel.font = UIFont.systemFont(ofSize: 12.0)
        safeLabel.sizeToFit()
        safeLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(safeButton)
            make.top.equalTo(self.pwTF.snp.bottom).offset(15)
            make.left.equalTo(safeButton.snp.right).offset(10)
        }
    }
    
    private func nextButtonLayout(){
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 10
        nextButton.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.height.equalTo(40)
            make.trailing.equalTo(-30)
            make.leading.equalTo(30)
            make.top.equalTo(self.safeButton.snp.bottom).offset(60)
        }
        
        nextButton.addTarget(self, action: #selector(toWelcome), for: .touchUpInside)
    }
    
    @objc func toSafe(){
        pwTF.isSecureTextEntry = false
    }
    
    @objc func toWelcome(){
        let nextVC = WelcomeVC()
        nextVC.name = nameTF.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

