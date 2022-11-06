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
  
  // Login details
  @State var phNo = ""
  
  var body: some View {
    VStack{
      ZStack{
        Color("background_color")
          .ignoresSafeArea()
        
        VStack{
          animatedView(show: $show)
          // Default frame
            .frame(height: UIScreen.main.bounds.height / 2)
          
          VStack{
            HStack{
              VStack(alignment: .leading, spacing: 10){
                Text("Welcome!")
                  .font(.title)
                  .bold()
                  .foregroundColor(.black)
                
                Text("Enter your number phone to continue")
                  .foregroundColor(.gray)
              }
              Spacer(minLength: 15)
            }
            
            VStack{
              
              HStack(spacing: 15){
                Text("+51")
                  .foregroundColor(.black)
                
                Rectangle()
                  .fill(Color("background_color"))
                  .frame(width: 1, height: 18)
                
                TextField("", text: $phNo)
              }
              
              Divider()
                .background(Color("background_color"))
              
            }.padding(.vertical)
          
          }
          .padding()
          .background(.white)
          .cornerRadius(20)
          .padding()
          
        }
        
      }
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
    
    viewAnimation.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    
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

