//
//  VideoPlayerHelper.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 09/06/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func PlayVideo(fileName: String, fileFormat: String) -> AVPlayer{
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil{
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}

