//
//  GalleryView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 08/06/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - properties
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    //MARK: - simple grid
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    //MARK: - effective grid
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //MARK: - DYNAMIC GRID
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    //MARK: - body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            //MARK: - IMAGE
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 8))
            
            //MARK: - SLIDER
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                })
            
            //MARK: - GRID
            VStack(alignment: .center, spacing: 10) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//LOOP
                })//LAZY VGRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
        })//SCROLLVIEW
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}


//MARK: - preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
