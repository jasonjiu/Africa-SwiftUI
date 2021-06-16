//
//  VideoListView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 08/06/21.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImapct =  UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List{
                ForEach(videos){ item in
                    NavigationLink(
                        destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name),
                        label: {
                            VideoListItemView(video: item)
                                .padding(.vertical, 8)
                        })
                       
                }//LOOP
            }//LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        videos.shuffle()
                        hapticImapct.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        }//NAV
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
