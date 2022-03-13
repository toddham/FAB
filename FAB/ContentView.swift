//
//  ContentView.swift
//  FAB
//
//  Created by Todd Hamilton on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var fabOn = false
    @State var fabScale  = false

    var body: some View {
        
        ZStack {
            Color(.systemGray6)
            ZStack{
                
                
                if fabOn {
                    ZStack{
                        Circle()
                            .fill(Color(.white))
                            .frame(width:60,height:60)
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.black)
                    }
                    .shadow(color: .black.opacity(0.24), radius: 2, x: 0, y: 1)
                    .offset(y: -228)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.825).delay(0.1)),
                            removal: AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.825).delay(0.0))
                        )
                    )
                    
                    ZStack{
                        Circle()
                            .fill(Color(.white))
                            .frame(width:60,height:60)
                        Image(systemName: "bell.fill")
                            .foregroundColor(.black)

                    }
                    .shadow(color: .black.opacity(0.24), radius: 2, x: 0, y: 1)
                    .offset(y:-152)
                    .transition(.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.825).delay(0.05)))
                    
                    ZStack{
                        Circle()
                            .fill(Color(.white))
                            .frame(width:60,height:60)
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                    }
                    .shadow(color: .black.opacity(0.24), radius: 2, x: 0, y: 1)
                    .offset(y: -76)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.825).delay(0)),
                            removal: AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.825).delay(0.1))
                        )
                    )
                }
                
                
                ZStack{
                    Circle()
                        .fill(fabOn ? Color(.systemRed) : Color(.systemGreen))
                        .frame(width:60,height:60)
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(Color.white)
                        .frame(width:32,height:4)
                        .rotationEffect(.degrees(fabOn ? 45 : 0))
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(Color.white)
                        .frame(width:32,height:4)
                        .rotationEffect(.degrees(fabOn ? -45 : 90))
                }
                .shadow(color: fabOn ? Color(.systemRed).opacity(0.75) : Color(.systemGreen).opacity(0.75), radius: 8, x: 0, y: 4)
                .scaleEffect(fabScale ? 0.9 : 1)
                .animation(.spring())
                .onTapGesture {
                    withAnimation(Animation.spring()){
                        fabOn.toggle()
                        fabScale.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            fabScale.toggle()
                        }
                    }
                }
            }
        }.ignoresSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
