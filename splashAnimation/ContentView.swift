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
  
  @State var show = false
  
  var body: some View {
    VStack{
      ZStack{
        animatedView(show: $show)        
      }.background(Color("background_color"))
        .ignoresSafeArea()
    }
  }
  
}

// Animated view
struct animatedView: UIViewRepresentable {
  
  @Binding var show: Bool
  
  func makeUIView(context: Context) -> UIView {
    
    let view = UIView()
    
    let viewAnimation = LottieAnimationView(name: "splash.json", bundle: Bundle.main)
    viewAnimation.contentMode = .scaleAspectFit
    
    viewAnimation.frame = CGRect(x: 0, y: (viewAnimation.frame.size.height / 2) - 50, width: 400, height: 400)
    
    view.addSubview(viewAnimation)

    viewAnimation.play{ (status) in
      if status {
        // Toggling view
        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.7)){
          show.toggle()
        }
        
      }
    }
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
  
}

