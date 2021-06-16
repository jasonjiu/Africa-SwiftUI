//
//  MapView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 08/06/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let location: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //MARK: -   BASIC MAP
        //        Map(coordinateRegion: $region)
        
        //MARK: - ADVANCE MAP
        Map(coordinateRegion: $region, annotationItems: location,
            annotationContent: { item in
                // OLD STYLE (STATIC)
                //                MapPin(coordinate: item.location, tint: .accentColor)
                
                // NEW STYLE (STATIC)
                //                MapMarker(coordinate: item.location, tint: .accentColor)
                
                // CUSTOM BASIC ANOTATION
                //                MapAnnotation(coordinate: item.location){
                //                    Image("logo")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 32, height: 32, alignment: .center)
                //                }
                
                // COMPLEX MAP ANOTATION
                MapAnnotation(coordinate: item.location){
                    MapAnnotationView(locations: item)
                }
            })
            .overlay(
                HStack {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3, content: {
                        HStack{
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                        }
                        Divider()
                        HStack{
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                        }
                    })
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black.cornerRadius(8).opacity(0.6)
                )
                .padding()
                ,alignment: .top
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
