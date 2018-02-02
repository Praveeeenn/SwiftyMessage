//
//  MessageViewController.swift
//  Demo1
//
//  Created by Praveen on 02/02/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellId = "ChatCellId";
    
    
    var messages: [Message] = Message.getMessages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0);
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ChatMessageCell.self, forCellWithReuseIdentifier: cellId);
        collectionView?.alwaysBounceVertical = true;
        collectionView?.isScrollEnabled = true;
        collectionView?.keyboardDismissMode = .interactive;

    }
}

extension MessageViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatMessageCell;
        let msg = messages[indexPath.item]
        cell.textView.text = msg.text
        cell.nameLabel.text = msg.name
        if !msg.text.isEmpty{
            cell.bubbleWidthAnchor?.constant = estimateFrameForText(text: msg.text).width + 25;
        }
        setupCell(cell: cell, message: msg)
            return cell;
    }
    
    private func setupCell(cell: ChatMessageCell,message: Message){
        
        if "text" == "text"{
            //handle text Message
            cell.messageImageView.isHidden = true;
            cell.attachmentLowerView.isHidden = true;
            cell.attachmentView.isHidden = true;
            cell.attchmentIconView.isHidden = true;
            cell.fileNameLabel.isHidden = true;
        }else if "message.type" == "image"{
//            let attachment = localDatabase.fetchDataFromAttachemntTableByID(attachment_id: message.id);
//            let imageURL = "https://bits.sg/web/content/\(attachment.id)-force/\(attachment.checksum)?download=true";
//            print("+++++++++++++++++++++++**********************+++++++++++++++++++");
            //print(imageURL);
            //cell.messageImageView.sd_setImage(with: URL(string: imageURL));
            cell.bubbleWidthAnchor?.constant = UIScreen.main.bounds.width/2;
            cell.messageImageView.isHidden = false;
            cell.attachmentLowerView.isHidden = true;
            cell.attachmentView.isHidden = true;
            cell.attchmentIconView.isHidden = true;
            cell.fileNameLabel.isHidden = true;
            cell.bubbleView.backgroundColor = .clear
        }else{
            //handle other attachment
            cell.bubbleWidthAnchor?.constant = UIScreen.main.bounds.width/2+40;
            cell.fileNameLabel.text = "message.fileName";
            cell.messageImageView.isHidden = false;
            cell.attachmentLowerView.isHidden = false;
            cell.attachmentView.isHidden = false;
            cell.fileNameLabel.isHidden = false;
            cell.attchmentIconView.isHidden = false;
            cell.messageImageView.isHidden = true;
            cell.bubbleView.backgroundColor = .clear
        }
        
        if "1" == message.id{
            cell.bubbleView.backgroundColor = UIColor.white
            cell.profileImageView.isHidden = true;
            //cell.textView.textColor = UIColor.rgb(26.0, green: 0.0, blue: 0.0);
            cell.bubbleRightAnchor?.isActive = true;
            cell.bubbleLeftAnchor?.isActive = false;
            cell.statusView.isHidden = false;
            cell.statusBackGroundView.isHidden = false;
            
        }else{
            cell.bubbleView.backgroundColor = UIColor.white;
            //cell.textView.textColor = UIColor.rgb(26.0, green: 0.0, blue: 0.0);
            cell.profileImageView.isHidden = false;
            cell.bubbleRightAnchor?.isActive = false;
            cell.bubbleLeftAnchor?.isActive = true;
            cell.statusBackGroundView.isHidden = false;
            cell.statusView.isHidden = false;
        }
        
        
        if "direct" == "direct"{
            cell.nameLabel.isHidden = true;
        }else{
            if message.id == "1"{
                cell.nameLabel.isHidden = true;
            }else{
                cell.nameLabel.isHidden = false;
            }
        }
    }
    
    
    func estimateFrameForText(text: String) -> CGRect {
        let size = CGSize(width: UIScreen.main.bounds.width-(UIScreen.main.bounds.width/3+20) , height: 1000);
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin);
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], context: nil);
    }
    
    
}

extension MessageViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 80;
        
        if "text" == "text"{
            let text = messages[indexPath.item].text
            height = estimateFrameForText(text: text).height+20;
            
        }else if "message.type" == "image"{
            height = UIScreen.main.bounds.width/2;
        }else{
            height = 70;
        }
        //==
        let text =  messages[indexPath.item].text
        height = estimateFrameForText(text: text).height+20;
        //====
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: height);
    }
}

