//
//  ExternalLinkView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 09/06/21.
//

import SwiftUI

struct ExternalLinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!))
                }
                .foregroundColor(.accentColor)
            }
        }//GROUPBOX
    }
}

struct ExternalLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
