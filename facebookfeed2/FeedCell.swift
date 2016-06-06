//
//  FeedCell.swift
//  facebookfeed2
//
//  Created by Admin on 28/05/16.
//  Copyright © 2016 THG Digital. All rights reserved.
//

import Foundation
import UIKit

class FeedCell : UICollectionViewCell {
    
    var post: Post? {
        didSet{
            if let name = post?.name {
                
                let attributedText = NSMutableAttributedString(string: name , attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)])
                
                attributedText.appendAttributedString(NSAttributedString(string: "\nDezembro 18 . Rio de janeiro . ", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(12), NSForegroundColorAttributeName: UIColor.rgb(155, green: 161, blue: 171)]))
                
                let paragrapStyle = NSMutableParagraphStyle()
                paragrapStyle.lineSpacing = 4
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragrapStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                let attachmment = NSTextAttachment()
                attachmment.image = UIImage(named: "globe_small")
                attachmment.bounds = CGRectMake(0, -2, 12, 12)
                attributedText.appendAttributedString(NSAttributedString(attachment: attachmment))
                
                nameLabel.attributedText = attributedText
                
            }
            if let statusText = post?.statusText{
                statusTextView.text = statusText
                
            }
            
            if let profileImage = post?.profileImageName{
                profileImageView.image = UIImage(named: profileImage)
                
            }
            if let statusImageName = post?.statusImageName {
                statusImagemView.image = UIImage(named: statusImageName)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let profileImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFit
        imageView.image = UIImage(named: "zuckprofile")
        
        return imageView
        
    }()
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Descricao do facebook"
        textView.font = UIFont.systemFontOfSize(14)
        textView.scrollEnabled = false
        
        return textView;
    }()
    
    let statusImagemView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    let likeCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "480 Likes 10.7k Comment"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        
        return label
    }()
    
    
    
    let dividierViewLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        
        return view
    }()
    
    let likeButton = FeedCell.buttonForTitle("Like", imageName: "like")
    let commentButton: UIButton = FeedCell.buttonForTitle("Comment", imageName: "comment")
    let shareButton: UIButton = FeedCell.buttonForTitle("Share", imageName: "share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), forState: .Normal)
        
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        
        return button
    
    }
    
    func setupViews(){
        
        backgroundColor = UIColor.whiteColor()
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImagemView)
        addSubview(likeCommentsLabel)
        addSubview(dividierViewLine)
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
      //  setupStatusImageViewLoader()
        
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat("H:|[v0]|", views: statusTextView)
        
        addConstraintsWithFormat("H:|-12-[v0]|", views: likeCommentsLabel)
        
        addConstraintsWithFormat("H:|-12-[v0]-12-|", views: dividierViewLine)
        
        //button constraints
        addConstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        addConstraintsWithFormat("V:|-12-[v0]", views: nameLabel)
        
        
        
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusTextView, likeCommentsLabel, dividierViewLine, likeButton)
        
        addConstraintsWithFormat("V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat("V:[v0(44)]|", views: shareButton)
}
}