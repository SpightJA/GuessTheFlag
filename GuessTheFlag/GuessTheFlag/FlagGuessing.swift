//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Jon Spight on 4/12/24.
//

import SwiftUI

struct FlagGuessing: View {
    @State var viewModel = FlagGuessingViewModel()
    
    var body: some View {
        ZStack {
            backgroundView()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                        Text(viewModel.countries[viewModel.correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            viewModel.rotateAmount += 360
                            viewModel.selected.toggle()
                            viewModel.flagTapped(number)
                        }
                        label: {
                            FlagImage(viewModel: viewModel, flagIndex: number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()
                Text("Score \(viewModel.score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
        }
        .alert(viewModel.scoreTitle, isPresented: $viewModel.showingScore) {
            Button("Continue", action: {
                viewModel.askQuestion()
                viewModel.selected.toggle()
            })
        }message: {
            Text("Your score is \(viewModel.score)")
                .foregroundStyle(.white)
                .font(.title.bold())
        }
    }
}



#Preview {
    FlagGuessing()
}

struct FlagImage: View {
    @StateObject var viewModel : FlagGuessingViewModel
    var flagIndex : Int
    
    var body: some View {
        
        Image(viewModel.countries[flagIndex])
            .clipShape(.capsule)
            .shadow(radius: 5)
            .opacity(viewModel.selected ? 0.25 : 1.0)
            .rotation3DEffect(
                .degrees(viewModel.rotateAmount),axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
            )
    }
}

struct backgroundView: View {
    var body: some View {
        RadialGradient(stops: [
            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
            .init(color: .gray, location: 0.3),
        ], center: .top, startRadius: 200, endRadius: 400)
        .ignoresSafeArea()
    }
}
