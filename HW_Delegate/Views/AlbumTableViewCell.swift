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

}
