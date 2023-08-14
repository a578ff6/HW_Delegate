//
//  AlbumDetailViewController.swift
//  HW_Delegate
//
//  Created by 曹家瑋 on 2023/8/13.
//

import UIKit

/// 相簿的內容
class AlbumDetailViewController: UIViewController {
    
    /// 照片圖文標題
    @IBOutlet weak var photoTitleLabel: UILabel!
    /// 顯示的相片
    @IBOutlet weak var photoImageView: UIImageView!
    /// 相片的文字內容
    @IBOutlet weak var photoDescriptionTextView: UITextView!
    
    /// 儲存前一頁的相簿資料，用來在此畫面進行參考和顯示（雖然一定有資料，但一樣使用可選型別）
    var album: Album?
    /// 追蹤當前相片的索引
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 根據 album 屬性更新 UI 元件（解包）
        if let album = album {
            photoTitleLabel.text = album.albumTitle
            updateImage()   // 設置初始圖片
            photoDescriptionTextView.text = album.details.contentText
        }
        
    }
    
    /// 上一頁手勢
    @IBAction func swipeToPreviousImage(_ sender: Any) {
        
        if currentImageIndex > 0 {
            currentImageIndex -= 1
        } else {
            // 如果 album 或後續屬性為 nil，則透過 ?? 給予值 0，但因為一定會有值，基本上不會發生，純粹解包方便。
            currentImageIndex = (album?.details.images.count ?? 0) - 1      // （由於索引是從 0 開始的，所以最後一個圖片的索引將是圖片數量減去 1）
        }
        
        updateImage()
    }
    
    /// 下一頁手勢
    @IBAction func swipeToNextImage(_ sender: Any) {
        // 因為我的album是可選型別
        if let album = album,
           currentImageIndex < album.details.images.count - 1 {
            currentImageIndex += 1
        } else {
            currentImageIndex = 0
        }
        updateImage()
    }
    
    /// 更新圖片顯示（用 currentImageIndex 來取得相對應的圖片名稱，並設置給 photoImageView）
    func updateImage() {
        if let album = album,
           currentImageIndex < album.details.images.count {    // 確保索引在有效範圍內
            let imageName = album.details.images[currentImageIndex]
            photoImageView.image = UIImage(named: imageName)
        }
    }
    
}



