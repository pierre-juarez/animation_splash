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
            .padding(.bottom,-35)
          
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
            
            Button(action: {}, label: {
              Text("Verify your number")
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,10)
                .frame(width: UIScreen.main.bounds.width - 60)
                .background(Color("background_color"))
                .clipShape(Capsule())
            })
            
            HStack{
              Rectangle()
                .fill(.black.opacity(0.3))
                .frame(height: 1)
              
              Text("OR")
                .bold()
                .foregroundColor(.black.opacity(0.3))
              
              Rectangle()
                .fill(.black.opacity(0.3))
                .frame(height: 1)
            }.padding(.vertical)
            
            HStack(spacing: 20){
              
              Button(action: {}, label: {
              
                HStack(spacing: 10){
                  
                  Image("facebook_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                  
                  Text("Facebook")
                    .bold()
                    .foregroundColor(.white)
                }
                .padding(.vertical,10)
                .frame(width: (UIScreen.main.bounds.width - 80) / 2 )
                .background(Color("facebook_color"))
                .clipShape(Capsule())
              })
              
              Button(action: {}, label: {
              
                HStack(spacing: 10){
                  
                  Image("google_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                  
                  Text("Google")
                    .bold()
                    .foregroundColor(.white)
                }
                .padding(.vertical,10)
                .frame(width: (UIScreen.main.bounds.width - 80) / 2 )
                .background(Color("google_color"))
                .clipShape(Capsule())
              })
              
            }
          
          }
          .padding()
          .background(.white)
          .cornerRadius(20)
          .padding()
          // Botom to up transition
          // We can acheive this by frame property...
          .frame(height: show ? nil : 0)
          .opacity(show ? 1 : 0)
          
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

