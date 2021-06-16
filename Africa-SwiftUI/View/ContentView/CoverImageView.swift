//
//  CoverImageView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 08/06/21.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - properties
    let coverImage: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    //MARK: - body
    var body: some View {
        TabView {
            ForEach(coverImage) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }// LOOP
        }// PAGE TAB VIEW
        .tabViewStyle(PageTabViewStyle())
    }
}

//MARK: - preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
