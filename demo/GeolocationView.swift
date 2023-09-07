//
//  GeolocationView.swift
//  demo
//
//  Created by 32 Technologies on 06/07/23.
//

import SwiftUI

struct GeolocationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var firstCircle = 1.0
    @State private var secondCircle = 1.0
    @State private var thirdCircle = 1.0
    
    
    var geolocationHeader:
    some View{
      
        VStack(alignment: .leading) {
            
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label:{
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 20)).foregroundStyle(.white,Color(hex: 0xa8222b)).transition(.offset(x:0, y:850))
                }
                Image("logo01").resizable().aspectRatio(contentMode: .fit).frame(height: 50).padding(.bottom)
            }
            HStack {
                NavigationLink(destination : MusicianPlaylistView().transition(.offset(x:0, y:850))){
                    Text("Search Nearby Artist")
                        .padding(.horizontal,20)
                        .padding(.vertical,5)
                        .background(Color(hex: 0xa8222b))
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
                }
                Image(systemName: "location.fill").padding(.vertical,5).padding(.horizontal,20).background(Color(hex: 0x2c90b5))
                    .foregroundColor(.white).cornerRadius(16)
                
                
            }
        }
        .padding(.horizontal)
//.padding(.top, UIScreen.topSafeArea)
//            .padding(.leading, UIScreen.main.bounds.size.width/8  )
           
            .frame(maxHeight: .infinity , alignment: .top)
        .frame(maxWidth: UIScreen.main.bounds.size.width, alignment: .leading)
    
    }
    var body: some View {
        NavigationStack{
        ZStack {
            Image("b03").resizable().ignoresSafeArea(.all)
            ScrollView{
                ZStack{Circle()
                        .stroke(.white)
                        .scaleEffect(firstCircle)
                        .opacity(2 - firstCircle)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                firstCircle = 3
                            }
                        }
                    
                    Circle()
                        .stroke(.white)
                        .scaleEffect(secondCircle)
                        .opacity(2 - secondCircle)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: false)) {
                                secondCircle = 2
                            }
                        }
                    
                    
                    Circle()
                        .stroke(.white)
                        .frame(width: 380, height: 380)
                    Circle()
                        .stroke(.white)
                        .frame(width: 300, height: 300)
                    Circle()
                        .stroke(.white)
                        .frame(width: 200, height: 200)
                    Image("m05")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height:120)
                        .clipShape(Circle()).overlay{Circle().stroke(.white, lineWidth: 6)}
                    circes().padding(.vertical)
                    
                    
                }}
            geolocationHeader
        }
        //      .edgesIgnoringSafeArea(.top)
        //        .ignoresSafeArea(.top)
        
        
        
    }
       }
   }


extension UIScreen {
    static var topSafeArea: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return (keyWindow?.safeAreaInsets.top) ?? 0
    }
}

struct circes: View{
    var body: some View{
        ScrollView{
        ZStack(alignment: .bottomLeading){
            HStack(){
                circularImageSml(imgName: "m01")
                Spacer()
                circularImageSml(imgName: "m02")
            }
            .padding(.horizontal)
            .frame( width:450, height: 900)
            HStack(){
                circularImageSml(imgName: "m03")
                Spacer()
                circularImageSml(imgName: "m04")
            }
            .padding(.trailing,90)
            .frame( width:310, height:680).frame(maxWidth: .infinity, alignment: .trailing)
            
            VStack{
                circularImageSml(imgName: "m06")
                HStack{
                    circularImageSml(imgName: "g")
                }.frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }.frame(width: 300, height: 660)
            
        }.navigationBarBackButtonHidden()
    }}
}
struct circularImageSml : View{
    var imgName : String
    var body: some View{
        Image(imgName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height:50)
            .clipShape(Circle()).overlay{
                Circle().stroke(.white, lineWidth: 1)
            }
    }
}
struct circularImageSmlAsync : View{
    var imgName : String
    var body: some View{
        
        AsyncImage(
            url: URL(string: imgName),
            content: { image in
                image.resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50).clipShape(Circle()).overlay{
                    Circle().stroke(.white, lineWidth: 1)
                }
            },
            placeholder: {
                ProgressView()
                    .progressViewStyle(.circular).tint(.white).padding()
            }
        )
        
//
//        Image(imgName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 50, height:50)
//            .clipShape(Circle()).overlay{
//                Circle().stroke(.white, lineWidth: 1)
//            }
    }
}
struct GeolocationView_Previews: PreviewProvider {
    static var previews: some View {
        GeolocationView()
    }
}
