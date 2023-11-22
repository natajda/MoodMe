//
//  MoodView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 05/02/2023.
//

import SwiftUI

struct MoodView: View {
    @ObservedObject var viewModel: MoodViewModel
    
    var body: some View {
        VStack() {
            Text("Your mood swings can be tricky... But don't forget, for every cloud there is a sun hidding behind!")
                .fontWeight(.thin)
                .frame(alignment: .leading)
                .padding(.vertical, 16)
            
            Divider()
            
            VStack() {
                if (viewModel.moodState == MoodState.notPicked) {
                    Text("Pick how you feel right now")
                        .frame(alignment: .leading)
                        .padding(.vertical, 16)
                    
                    HStack {
                        moodEmoji(state: .isHappy, image: "happy", text: "Happy")
                        moodEmoji(state: .isLoved, image: "loved", text: "Loved")
                        moodEmoji(state: .isSad, image: "sad", text: "Sad")
                        moodEmoji(state: .isAngry, image: "angry", text: "Angry")
                    }
                }
                else {
                    HStack{
                        Text("Currently I feel ...")
                            .frame(alignment: .leading)
                            .padding(.vertical, 16)
                        switch viewModel.moodState {
                        case .isHappy:
                            imageRender(emoji: "happy")
                        case .isLoved:
                            imageRender(emoji: "loved")
                        case .isSad:
                            imageRender(emoji: "sad")
                        case .isAngry:
                            imageRender(emoji: "angry")
                        case .notPicked:
                            EmptyView() // not possible
                        }
                    }
                }
            }
            
            Divider()
        }
        
        VStack(alignment: .leading) {
            HStack {
                Text("Recent mood statistics")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                Spacer()
                Button {
                    viewModel.onReset()
                } label: {
                    Label {
                        Text("Reset").fontWeight(.thin)
                            .foregroundColor(.gray)
                    } icon: {
                        Image(systemName: "arrow.clockwise").foregroundColor(.gray)
                    }
                }.padding(.horizontal, 16)
            }
            
            
            HStack(alignment: .center) {
                Image("happy").resizable().scaledToFit()
                    .frame(width: 45, height: 45)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                
                Text("Happy \(viewModel.happy)x")
            }
            
            HStack(alignment: .center) {
                Image("loved").resizable().scaledToFit()
                    .frame(width: 45, height: 45)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                Text("Loved \(viewModel.loved)x")
            }
            
            HStack(alignment: .center) {
                Image("sad").resizable().scaledToFit()
                    .frame(width: 45, height: 45)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                Text("Sad \(viewModel.sad)x")
            }
            
            HStack(alignment: .center) {
                Image("angry").resizable().scaledToFit()
                    .frame(width: 45, height: 45)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                Text("Angry \(viewModel.angry)x")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 16)
        
        Spacer()
    }
    
    func moodEmoji(state: MoodState, image: String, text: String) -> some View {
        VStack {
            Button {
                viewModel.onMoodPicked(mood: state)
            } label: {
                Image(image).resizable().scaledToFit()
            }.frame(width: 45, height: 45)
                .buttonStyle(.plain)
                .padding(.horizontal, 10)
            Text(text)
                .fontWeight(.thin)
        }
    }
    
    func imageRender(emoji: String) -> some View {
        Image(emoji).resizable().scaledToFit()
            .frame(width: 45, height: 45)
    }
}
