//
//  ContentView.swift
//  Carousel
//
//  Created by lenbo lan on 2020/9/8.
//  Copyright © 2020 lenbo lan. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }.onReceive(self.timer) { _ in
            self.currentPage = (self.currentPage + 1) % (self.viewControllers.count == 0 ? 1 : self.viewControllers.count)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
