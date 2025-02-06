import SwiftUI

struct ContentView: View {
    @State private var playerChoice: Sign? = nil
    @State private var computerChoice: Sign = Sign.allCases.randomElement()!
    @State private var gameState: GameState = .Start
    
    var body: some View {
        VStack {
            Text(gameState.message)
                .font(.title)
                .foregroundColor(gameState == .Win ? .green: gameState == .Lose ? .red: gameState == .Draw ? .yellow: .black)
                .padding()
            
            Text("🤖")
                .font(.system(size: 50))
                .padding()
            
            HStack {
                ForEach(Sign.allCases, id: \.self) { sign in
                    Button(action: {
                        self.play(sign)
                    }) {
                            Text(sign.rawValue)
                                .font(.system(size: 50))
                                .padding()
                    }
                }
            }
            .padding()
            
            Button("Play Again") {
                resetGame()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
    
    func play(_ playerChoice: Sign) {
        self.playerChoice = playerChoice
        self.computerChoice = Sign.allCases.randomElement()!
        self.gameState = playerChoice.checkWinner(computer: computerChoice)
    }
    
    func resetGame() {
        self.playerChoice = nil
        self.computerChoice = Sign.allCases.randomElement()!
        self.gameState = .Start
    }
}


extension Sign: CaseIterable {
    static var allCases: [Sign] {
        return [.Rock, .Paper, .Scissors]
    }
}
#Preview {
    ContentView()
}
