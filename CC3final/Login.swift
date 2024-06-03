//
//  CC3_Login.swift
//  CC3-App
//
//  Created by user on 7/5/2024.
//

import SwiftUI

struct Login: View {
    @State var userName = ""
    @State var password = ""
    @State var wrongPassword = 0
    @State var wrongUsername = 0
    @State var showinLoginScreen = false
  var body: some View {
     
      NavigationView{
          ZStack{
              
              Color.blue
                  .ignoresSafeArea()
              Circle()
                  .scale(1.7)
                  .foregroundColor(.white.opacity(0.15))
              Circle()
                  .scale(1.35)
                  .foregroundColor(.white)
              VStack(){
                  Text("Login")
                      .font(.largeTitle)
                      .bold()
                      .padding()
                  TextField("User Name",text: $userName)
                      .padding()
                      .frame(width:300,height:50)
                      .background(Color.black.opacity(0.25))
                      .cornerRadius(10)
                      .border(.red,width:CGFloat(wrongUsername))
                  SecureField("PassWord",text: $password)
                      .padding()
                      .frame(width:300,height:50)
                      .background(Color.black.opacity(0.25))
                      .cornerRadius(10)
                      .border(.red,width: CGFloat(wrongUsername))
                  
                  NavigationLink(destination: ContentView()){
                      Text("Login")
           
                        
          
                      
                  }.foregroundColor(.white)
                      .frame(width:300,height: 50)
                      .background(Color.blue)
                      .cornerRadius(10)
                  NavigationLink(destination: Register()){
                      Text("register?")
           
                        
          
                      
                  }
                    
                  
          }
               
          }.navigationBarHidden(true)
      }
  }
    func validate(username:String , password:String){
        if username.count > 5{
            wrongUsername = 0
            if password.count > 5{
                wrongPassword = 0
                showinLoginScreen = true
              
            }else{
                wrongPassword = 2
            }
        }else{
            wrongUsername = 2}
    }
}

struct swiftLogin_Previews: PreviewProvider {
  static var previews: some View {
      Login()
  }
}

