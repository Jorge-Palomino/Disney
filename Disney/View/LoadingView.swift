//
//  LoadingView.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandColour
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {  }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
            
        }
    }
}
