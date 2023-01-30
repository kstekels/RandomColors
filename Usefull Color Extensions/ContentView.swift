//
//  ContentView.swift
//  Usefull Color Extensions
//
//  Created by karlis.stekels on 30/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var rectangleColors: [Color] = [
        .maroon,
        .darkRed,
        .brown1,
        .firebrick,
        .crimson,
        .red1,
        .tomato,
        .coral,
        .indianRed
    ]
    @State var rectangleColors1: [Color] = [
        .darkGoldenRod,
        .goldenRod,
        .paleGoldenRod,
        .darkKhaki,
        .khaki,
        .olive,
        .yellow1,
        .yellowGreen,
        .darkOliveGreen
    ]
    @State var rectangleColors2: [Color] = [
        .teal1,
        .darkCyan,
        .aqua,
        .cyan1,
        .lightCyan,
        .darkTurquoise,
        .turquoise,
        .mediumTurquoise,
        .paleTurquoise
    ]
    
    @State var textColor: Color = .white
    @State var backgroundColor: Color = .black
    
    var body: some View {
        VStack {
            Spacer()
            
            Grid {
                ColorRow(rectangleColors: rectangleColors, lowerIndex: 0, upperIndex: 3, dim: 75, radius: 10)
                ColorRow(rectangleColors: rectangleColors1, lowerIndex: 0, upperIndex: 3, dim: 75, radius: 10)
                ColorRow(rectangleColors: rectangleColors2, lowerIndex: 0, upperIndex: 3, dim: 75, radius: 10)
                
            }
            
            Spacer()
            
            Button {
                rectangleColors = Color.randomColorsN(n: rectangleColors.count)
                rectangleColors1 = Color.randomColorsN(n: rectangleColors1.count)
                rectangleColors2 = Color.randomColorsN(n: rectangleColors2.count)
            } label: {
                Text("Random Colors")
                    .foregroundColor(textColor)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(backgroundColor))
            }
        }
        .padding()
    }
}

struct ColorRow: View {
    let rectangleColors: [Color]
    let lowerIndex: Int
    let upperIndex: Int
    let dim: CGFloat
    let radius: CGFloat
    
    var body: some View {
        GridRow {
            ForEach(lowerIndex..<upperIndex, id: \.self) { i in
                RectColor(
                    color: rectangleColors[i],
                    dim: dim,
                    radius: radius
                )
            }
        }
    }
}

struct RectColor: View {
    
    let color: Color
    let dim: CGFloat
    let radius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(color)
            .frame(width: dim, height: dim)
            .overlay(
                RoundedRectangle(cornerRadius: radius).stroke()
            )
            .shadow(radius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
