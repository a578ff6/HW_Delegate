//
//  Album.swift
//  HW_Delegate
//
//  Created by 曹家瑋 on 2023/8/13.
//

import Foundation

/// 用於表示一組相本（section）
struct AlbumSection {
    var sectionTitle: String            // section的標題（北部、中部、南部）
    var albums: [Album]                 // 該section內的所有相本集合
}

/// 位於TableVIewCell的相本設置（相本的封面、標題、日期、簡述、相簿的內容）
struct Album {
    var albumCoverImageName: String     // 相本封面圖片名稱
    var albumTitle: String              // 相本標題
    var albumDate: String               // 相本日期
    var description: String             // 相本簡述
    var details: AlbumDetail            // 相本的詳細內容，相片、文字內容（AlbumDetail作為Album的一部分）
}

/// 相本內容（相本圖片、文字內容）
struct AlbumDetail {
    var images: [String] // 保存圖片名稱
    var contentText: String // 相本文字內容
}
