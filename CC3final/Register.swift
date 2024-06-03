//
//  CC3_Login.swift
//  CC3-App
//
//  Created by user on 7/5/2024.
//

import SwiftUI

struct Register: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var userName = ""
    @State var password = ""
    @State var wrongPassword = 0
    @State var wrongUsername = 0
    @State var showinLoginScreen = false
    @State var confirmePassword = ""
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
                  Text("Register")
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
                  SecureField("Confirme PassWord",text: $password)
                      .padding()
                      .frame(width:300,height:50)
                      .background(Color.black.opacity(0.25))
                      .cornerRadius(10)
                      .border(.red,width: CGFloat(wrongUsername))
                 
                  NavigationLink(destination: ContentView()){
                      Text("Register")
                      
          
                      
                  } .foregroundColor(.white)
                    .frame(width:300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                  NavigationLink(destination: Login()){
                      Text("login?")
           
                        
          
                      
                  }
                    
                  
          }
               
          }.navigationBarHidden(true)
      }
  }
    func validate(username:String , password:String){
        if username.count > 5{
            wrongUsername = 0
            if password.count > 5 && confirmePassword == password {
                wrongPassword = 0
                showinLoginScreen = true
              
            }else{
                wrongPassword = 2
            }
        }else{
            wrongUsername = 2}
    }
   
    }



struct RegisterView_Previews: PreviewProvider {
   static var previews: some View {
       Register()
   }
}
 

