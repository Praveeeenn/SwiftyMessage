//
//  MessageCell.swift
//  Demo1
//
//  Created by Praveen on 02/02/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

import UIKit

class ChatMessageCell: BaseCell {
    
    let nameLabel:UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textColor = .lightGray;
        label.text = "Name";
        label.font = UIFont.systemFont(ofSize: 10);
        return label;
    }()
    
    let bubbleView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 4;
        view.layer.masksToBounds = false;
        view.clipsToBounds = false;
        view.layer.borderColor = UIColor.gray.cgColor;
        //view.layer.borderWidth = 0.1;
        view.layer.contentsScale = UIScreen.main.scale;
        view.layer.shadowColor = UIColor.gray.cgColor;
        view.layer.shadowOffset = CGSize.zero;
        view.layer.shadowRadius = 1.5;
        view.layer.shadowOpacity = Float(0.5);
        return view;
    }();
    
    let textView: UITextView = {
        let tv = UITextView();
        tv.text = "demo";
        tv.font = UIFont.systemFont(ofSize: 16);
        tv.translatesAutoresizingMaskIntoConstraints = false;
        tv.backgroundColor = .clear
        tv.textColor = UIColor.darkGray
        tv.isEditable = false;
        return tv;
    }();
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView();
        imageView.image = UIImage(named: "dp");
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.layer.cornerRadius = 20;
        imageView.layer.masksToBounds = true;
        imageView.contentMode = .scaleAspectFill;
        return imageView;
    }();
    
    let statusBackGroundView:UIView = {
        let view = UIView();
        view.backgroundColor = UIColor.white;
        view.layer.cornerRadius = 6;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let statusView:UIView = {
        let view = UIView();
        view.backgroundColor = UIColor.green;
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let messageImageView : UIImageView = {
        let imageView = UIImageView();
        imageView.image = UIImage(named: "image");
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = false;
        imageView.clipsToBounds = true;
        imageView.layer.borderColor = UIColor.gray.cgColor;
        //view.layer.borderWidth = 0.1;
        imageView.layer.contentsScale = UIScreen.main.scale;
        imageView.layer.shadowColor = UIColor.gray.cgColor;
        imageView.layer.shadowOffset = CGSize.zero;
        imageView.layer.shadowRadius = 1.5;
        imageView.layer.shadowOpacity = Float(0.5);
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = .scaleAspectFill
        return imageView;
    }();
    
    let attachmentView : UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor.white;
        view.layer.cornerRadius = 4;
        view.layer.masksToBounds = false;
        view.clipsToBounds = false;
        view.layer.borderColor = UIColor.gray.cgColor;
        //view.layer.borderWidth = 0.1;
        view.layer.contentsScale = UIScreen.main.scale;
        view.layer.shadowColor = UIColor.gray.cgColor;
        view.layer.shadowOffset = CGSize.zero;
        view.layer.shadowRadius = 1.5;
        view.layer.shadowOpacity = Float(0.5);
        return view;
    }();
    
    let attachmentLowerView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.layer.masksToBounds = false;
        view.clipsToBounds = false;
        view.layer.borderColor = UIColor.gray.cgColor;
        //view.layer.borderWidth = 0.1;
        view.layer.contentsScale = UIScreen.main.scale;
        view.layer.shadowColor = UIColor.gray.cgColor;
        view.layer.shadowOffset = CGSize.zero;
        view.layer.shadowRadius = 1.5;
        view.layer.shadowOpacity = Float(0.5);
        view.backgroundColor = UIColor.green
        return view;
    }();
    
    let attchmentIconView  : UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor.white;
        view.layer.cornerRadius = 20;
        view.layer.masksToBounds = false;
        view.clipsToBounds = false;
        view.layer.borderColor = UIColor.gray.cgColor;
        //view.layer.borderWidth = 0.1;
        view.layer.contentsScale = UIScreen.main.scale;
        view.layer.shadowColor = UIColor.gray.cgColor;
        view.layer.shadowOffset = CGSize.zero;
        view.layer.shadowRadius = 1.5;
        view.layer.shadowOpacity = Float(0.5);
        return view;
    }();
    
    let attachmentIcon : UIImageView = {
        let imageView = UIImageView();
        imageView.image = UIImage(named: "file");
        imageView.layer.masksToBounds = true;
        imageView.tintColor = .black;
        imageView.backgroundColor = .white;
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = .scaleAspectFit;
        return imageView;
    }();
    
    
    
    let fileNameLabel:UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textColor = .black;
        label.text = "FileName.pdf";
        label.font = UIFont.systemFont(ofSize: 10);
        return label;
    }();
    
    var bubbleWidthAnchor: NSLayoutConstraint?;
    var bubbleRightAnchor: NSLayoutConstraint?;
    var bubbleLeftAnchor: NSLayoutConstraint?;
    
    
    override func setupViews() {
        super.setupViews();
        //setupWithoutProfileImage();
        setupWithProfileImage();
        setupAttachmentView();
    }
    
    func setupAttachmentView(){
        
        //addView and contraint
        addSubview(attachmentView);
        attachmentView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor).isActive = true;
        attachmentView.topAnchor.constraint(equalTo: bubbleView.topAnchor).isActive = true;
        attachmentView.widthAnchor.constraint(equalTo: bubbleView.widthAnchor).isActive = true;
        attachmentView.heightAnchor.constraint(equalTo: bubbleView.heightAnchor).isActive = true;
        
        //add and setup LowerView
        attachmentView.addSubview(attachmentLowerView);
        attachmentLowerView.leftAnchor.constraint(equalTo: attachmentView.leftAnchor).isActive = true;
        attachmentLowerView.rightAnchor.constraint(equalTo: attachmentView.rightAnchor).isActive = true;
        attachmentLowerView.bottomAnchor.constraint(equalTo: attachmentView.bottomAnchor).isActive = true;
        attachmentLowerView.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        
        //add and setup icon of file
        attachmentView.addSubview(attchmentIconView);
        attchmentIconView.leftAnchor.constraint(equalTo: attachmentView.leftAnchor, constant: 10).isActive = true;
        attchmentIconView.bottomAnchor.constraint(equalTo: attachmentLowerView.topAnchor, constant: 20).isActive = true;
        attchmentIconView.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        attchmentIconView.widthAnchor.constraint(equalToConstant: 40).isActive = true;
        
        
        //add and setup ICon
        attchmentIconView.addSubview(attachmentIcon);
        attachmentIcon.centerXAnchor.constraint(equalTo: attchmentIconView.centerXAnchor).isActive = true;
        attachmentIcon.centerYAnchor.constraint(equalTo: attchmentIconView.centerYAnchor).isActive = true;
        attachmentIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true;
        attachmentIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true;
        
        //add and setup Label which shows filename
        attachmentLowerView.addSubview(fileNameLabel);
        fileNameLabel.bottomAnchor.constraint(equalTo: attachmentLowerView.bottomAnchor, constant: -5).isActive = true;
        fileNameLabel.leftAnchor.constraint(equalTo: attachmentLowerView.leftAnchor, constant: 10).isActive = true;
        fileNameLabel.rightAnchor.constraint(equalTo: attachmentLowerView.rightAnchor, constant: 5).isActive = true;
        fileNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true;
    }
    
    
    func setupWithoutProfileImage(){
        addSubview(bubbleView);
        //x,y,w,h
        
        bubbleRightAnchor = bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8);
        bubbleRightAnchor?.isActive = true;
        
        bubbleLeftAnchor = bubbleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8);
        //bubbleLeftAnchor?.isActive = false ;
        
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - UIScreen.main.bounds.width/3);
        bubbleWidthAnchor?.isActive = true;
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        
        addSubview(textView);
        //x,y,w,h
        //textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true;
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: 0).isActive = true;
        
        //textView.widthAnchor.constraint(equalToConstant: 200).isActive = true;
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
    }
    
    func setupWithProfileImage(){
        addSubview(bubbleView);
        //x,y,w,h
        
        bubbleRightAnchor = bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15);
        bubbleRightAnchor?.isActive = true;
        
        bubbleLeftAnchor = bubbleView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8);
        //bubbleLeftAnchor?.isActive = false ;
        
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-(UIScreen.main.bounds.width/3+20));
        bubbleWidthAnchor?.isActive = true;
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        
        addSubview(textView);
        //x,y,w,h
        //textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true;
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: 0).isActive = true;
        
        //textView.widthAnchor.constraint(equalToConstant: 200).isActive = true;
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        setupProfileImageView();
        
        bubbleView.addSubview(messageImageView);
        //x,y,w,h
        messageImageView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor).isActive = true;
        messageImageView.topAnchor.constraint(equalTo: bubbleView.topAnchor).isActive = true;
        messageImageView.widthAnchor.constraint(equalTo: bubbleView.widthAnchor).isActive = true;
        messageImageView.heightAnchor.constraint(equalTo: bubbleView.heightAnchor).isActive = true;
        
        bubbleView.addSubview(nameLabel);
        nameLabel.leftAnchor.constraint(equalTo: bubbleView.leftAnchor).isActive = true;
        nameLabel.bottomAnchor.constraint(equalTo: bubbleView.topAnchor).isActive = true;
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        
    }
    
    func setupProfileImageView(){
        addSubview(profileImageView);
        //x,y,w,h
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true;
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true;
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true;
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        //setupStatusView();
    }
    
    func setupStatusView() {
        addSubview(statusBackGroundView);
        addSubview(statusView);
        statusBackGroundView.rightAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 0).isActive = true;
        statusBackGroundView.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 0).isActive = true;
        statusBackGroundView.widthAnchor.constraint(equalToConstant: 12).isActive = true;
        statusBackGroundView.heightAnchor.constraint(equalToConstant: 12).isActive = true;
        
        statusView.centerXAnchor.constraint(equalTo: statusBackGroundView.centerXAnchor).isActive = true;
        statusView.centerYAnchor.constraint(equalTo: statusBackGroundView.centerYAnchor).isActive = true;
        statusView.widthAnchor.constraint(equalToConstant: 10).isActive = true;
        statusView.heightAnchor.constraint(equalToConstant: 10).isActive = true;
    }
}

extension UIView{
    func addConstraintWithFormat(_ format: String, views: UIView...)  {
        var viewsDictionary:[String:UIView] = [String:UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)";
            viewsDictionary[key] = view;
            view.translatesAutoresizingMaskIntoConstraints=false;
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

class BaseCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupViews();
    }
    
    func setupViews()  {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
