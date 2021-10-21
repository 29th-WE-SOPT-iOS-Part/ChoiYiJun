//
//  WelcomeVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class WelcomeVC: UIViewController {

    var name : String?
    
    private let googleImg = UIImageView().then{
        $0.image = UIImage(named: "googleImg")
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 27.0)
        $0.sizeToFit()
    }
    
    private let okButton = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .googleBlue
        $0.layer.cornerRadius = 10
    }
    
    private let accountLabel = UILabel().then{
        $0.textColor = .googleBlue
        $0.font = UIFont.boldSystemFont(ofSize: 14.0)
        $0.text = "다른 계정으로 로그인하기"
        $0.sizeToFit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        welcomeLabelLayout(labelName: name!)
        setupAutoLayout()
    }
    
    private func setupAutoLayout(){
        view.addSubviews([googleImg, welcomeLabel, okButton, accountLabel])
        
        googleImg.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(118)
            make.height.equalTo(40)
            make.top.equalTo(248)
        }
        
        welcomeLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(googleImg.snp.bottom).offset(23)
        }
        
        okButton.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(53)
            make.leading.trailing.equalToSuperview().inset(22)
        }
        
        accountLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(okButton.snp.bottom).offset(23)
            make.leading.trailing.equalToSuperview().inset(111)
        }
        
        okButton.addTarget(self, action: #selector(toTabBar), for: .touchUpInside)
    }
    
    func welcomeLabelLayout(labelName: String){
        welcomeLabel.text = "\(labelName)님\n환영합니다!"
    }
    
    @objc func toTabBar(){
        let tabBar = BaseTBC()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true, completion: nil)
    }
    
}
