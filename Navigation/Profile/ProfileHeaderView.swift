//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сони Авдеева on 08/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit


class ProfileHeaderView: UITableViewHeaderFooterView {
    var profileHeaderView: UIView! = {
        let hv = UIView()
        hv.backgroundColor = .lightGray
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "major.jpg")
        image.layer.cornerRadius = 60
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var profileTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textColor = .black
        title.text = "Major Tom"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
        
    }()
    var profileInfo: UILabel = {
        let info = UILabel()
        info.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        info.textColor = .gray
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Ground Control to Major Tom"
        return info
    }()
    var textField: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 12
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return text
    }()
    var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
       private var statusText: String?

    @objc func buttonPressed() {
        print("\(profileInfo.text!)")
        if let statusText = statusText {
            profileInfo.text = statusText
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileImage)
        profileHeaderView.addSubview(profileTitle)
        profileHeaderView.addSubview(profileInfo)
        profileHeaderView.addSubview(textField)
        profileHeaderView.addSubview(statusButton)
        
        profileHeaderView.snp.makeConstraints{ make in
            make.top.trailing.leading.equalTo(contentView)
            make.height.equalTo(220)
        }
        profileTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(27)
            make.leading.equalTo(contentView).inset(152)
            make.height.equalTo(30)
            make.width.equalTo(180)
        }
        profileImage.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(16)
            make.height.width.equalTo(120)
        }
        statusButton.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(16)
            make.trailing.equalTo(contentView).offset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(16)
        }
        profileInfo.snp.makeConstraints { make in
            make.leading.equalTo(profileTitle)
            make.height.equalTo(20)
            make.width.equalTo(statusButton).dividedBy(2)
            make.bottom.equalTo(profileTitle).inset(-16)
        }
        textField.snp.makeConstraints { make in
            make.bottom.equalTo(statusButton).inset(65)
            make.leading.equalTo(profileTitle)
            make.height.equalTo(40)
            make.width.equalTo(statusButton).dividedBy(2)
        }
        
    }
}

