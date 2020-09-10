//
//  ContentView.swift
//  Carousel
//
//  Created by lenbo lan on 2020/9/8.
//  Copyright © 2020 lenbo lan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
