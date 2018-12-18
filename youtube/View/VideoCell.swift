//
//  VideoCell.swift
//  youtube
//
//  Created by 付伦 on 2018/12/16.
//  Copyright © 2018 loopslive. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
    }
}

class VideoCell: BaseCell {
    var video: Video? {
        didSet{
            titlelabel.text = video?.title
            
            
            if let thumbnailImageName = video?.thumbnailImageName{
                thumbnailImageView.image = UIImage(named: thumbnailImageName)
            }
            
            if let profileImageName = video?.channel?.profileImageName{
                 userProfileImageView.image = UIImage(named: profileImageName)
            }
            
            if let name = video?.channel?.name, let numberOfViews = video?.numberOfViews{
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                subTitlelabel.text = "\(name) * \(numberFormatter.string(from: numberOfViews)!) * 2 years ago"
            }
            
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "thumbnail")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taler Swift - Blank Space"
        return label
    }()
    
    let subTitlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TayorSwiftVEVO - 1,604,684,697 views - 2 years"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        //        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        return label
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titlelabel)
        addSubview(subTitlelabel)
        
        addConstraintsWidhFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWidhFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraintsWidhFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView, separatorView)
        
        addConstraintsWidhFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titlelabel, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .top, multiplier: 1, constant: 0))
        // left
        addConstraint(NSLayoutConstraint(item: titlelabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titlelabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titlelabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(NSLayoutConstraint(item: subTitlelabel, attribute: .top, relatedBy: .equal, toItem: titlelabel, attribute: .bottom, multiplier: 1, constant: 4))
        // left
        addConstraint(NSLayoutConstraint(item: subTitlelabel, attribute: .left, relatedBy: .equal, toItem: titlelabel, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subTitlelabel, attribute: .right, relatedBy: .equal, toItem: titlelabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subTitlelabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
}
