//
//  AnimalGridView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 14/06/21.
//

import SwiftUI

struct AnimalGridView: View {
    //MARK: - properties
    let animal: Animal
    
    //MARK: - body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//MARK: - preview
struct AnimalGridView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        
        AnimalGridView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
