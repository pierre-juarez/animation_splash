//
//  ContentView.swift
//  splashAnimation
//
//  Created by Pierre Juarez U. on 5/11/22.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
       splashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct splashScreen: View {
  
  var body: some View {
    VStack{
      animatedView()
    }
  }
  
}

// Animated view
struct animatedView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    
    let view = UIView()
    
    let viewAnimation = LottieAnimationView(name: "splash.json", bundle: Bundle.main)
    viewAnimation.contentMode = .scaleAspectFit
    
    viewAnimation.frame = CGRect(x: 0, y: (viewAnimation.frame.size.height / 2) - 50, width: 400, height: 400)
    
    view.addSubview(viewAnimation)

    viewAnimation.play()
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
  
}

