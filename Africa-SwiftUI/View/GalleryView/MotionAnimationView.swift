//
//  MotionAnimationView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 11/06/21.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //MARK: - function
    
    //1. random coordinate
    func randomCoor(max: CGFloat) -> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    
    //2. random size
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    
    //3. random scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. random speed
    func randomSpeed() -> Double{
        return Double.random(in: 0.025...1.0)
    }
    
    //5. random delay
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoor(max: geometry.size.width),
                                  y: randomCoor(max: geometry.size.height))
                        .animation(Animation
                                    .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .repeatForever()
                                    .speed(randomSpeed())
                                    .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//LOOP
            }//ZSTACK
            .drawingGroup()
        }//GEOMETRY
    }
}

//MARK: - preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
