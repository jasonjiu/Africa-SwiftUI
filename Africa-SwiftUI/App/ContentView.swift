//
//  ContentView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 08/06/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridView: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    
    //MARK: - function
    
    //CHANGE NUMBER OF COLUMN OF GRID
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }//SWITCH CASE
    }
    //MARK: - body
    var body: some View {
        NavigationView{
            Group{
                if !isGridView {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals){ animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListView(animal: animal)
                                })//LINK
                        }//LOOP
                    }//LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridView(animal: animal)
                                    })
                            }//LOOP
                        })
                    })//SCROILL
                }//CONDITION
            }//GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16){
                        
                        Button(action: {
                            print("list view")
                            isGridView = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridView ? .primary : .accentColor)
                        })//LIST BTN
                        
                        Button(action: {
                            print("grid view")
                            isGridView = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridView ? .accentColor : .primary)
                        })//GRID BTN
                    }// HSTACK
                }//TOOLBARITEM
            })//TOOLBAR
        }//NAV VIEW
    }
}

//MARK: - preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
