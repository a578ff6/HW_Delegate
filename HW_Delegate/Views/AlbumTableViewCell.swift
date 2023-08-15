//
//  AlbumTableViewCell.swift
//  HW_Delegate
//
//  Created by 曹家瑋 on 2023/8/12.
//

import UIKit

/// TableViewCell 客製化
class AlbumTableViewCell: UITableViewCell {

    /// 相簿封面
    @IBOutlet weak var albumCoverImageView: UIImageView!
    /// 相簿標題
    @IBOutlet weak var albumTitleLabel: UILabel!
    /// 相簿描述
    @IBOutlet weak var albumDescriptionLabel: UILabel!
    /// 相簿拍攝日期
    @IBOutlet weak var albumDateLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// 更新 cell 的內容和外觀
    func update(with album: Album) {
        albumCoverImageView.image = UIImage(named: album.albumCoverImageName)
        albumTitleLabel.text = album.albumTitle
        albumDescriptionLabel.text = album.description
        albumDateLabel.text = album.albumDate
        
        // 設置背景色
        self.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        
        // 設置選中時的背景色
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        self.selectedBackgroundView = selectedBackgroundView
    }
}

/*
 /// 更新 cell 的內容和外觀
 func update(with album: Album) {
     albumCoverImageView.image = UIImage(named: album.albumCoverImageName)
     albumTitleLabel.text = album.albumTitle
     albumDescriptionLabel.text = album.description
     albumDateLabel.text = album.albumDate

     // 設置背景色
     self.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
     // 設置選中時的背景色
     let selectedBackgroundView = UIView()
     selectedBackgroundView.backgroundColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
     self.selectedBackgroundView = selectedBackgroundView
 }
 */

