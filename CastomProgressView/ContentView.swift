//
//  ContentView.swift
//  CastomProgressView
//
//  Created by Roman Riepa on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animantionTrigger: Bool = false
    
    var body: some View {
        
        let animation = Animation.linear(duration: 3).repeatForever(autoreverses: false)
        
        ZStack {
            ProgressViewPartOne(degrees: animantionTrigger ? 360 : 45)
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap.round))
            
            ProgressViewPartTwo(degrees: animantionTrigger ? 180 : -135)
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap.round))
        }
        .frame(width: 300, height: 150)
        .onAppear {
            withAnimation(animation) {
                animantionTrigger.toggle()
            }
        }
    }
}


struct ProgressViewPartOne: Shape {
    var degrees: Double
    var animatableData: Double {
        get {
            degrees
        } set {
            degrees = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 4, y: rect.midY),
                radius: rect.width / 4,
                startAngle: Angle(degrees: 45),
                endAngle: Angle(degrees: degrees),
                clockwise: false)
        }
    }
}

struct ProgressViewPartTwo: Shape {
    var degrees: Double
    var animatableData: Double {
        get {
            degrees
        } set {
            degrees = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: rect.width * 3 / 4, y: rect.midY),
                radius: rect.width / 4,
                startAngle: Angle(degrees: -135),
                endAngle: Angle(degrees: degrees),
                clockwise: false)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
