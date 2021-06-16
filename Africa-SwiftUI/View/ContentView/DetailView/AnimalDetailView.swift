//
//  AnimalDetailView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 09/06/21.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - properties
    let animal: Animal
    
    //MARK: - body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20, content: {
                // ANIMAL IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 5)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 5)
                            .offset(y: 25)
                    )
                
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildernes in picture")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //FACT
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know ?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //DESC
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "Nationals Park")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            })//VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        })//scroll
    }
}


//MARK: - preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
