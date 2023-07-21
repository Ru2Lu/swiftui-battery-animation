import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    
    var body: some View {
        VStack {
            BatteryAnimationView(progress: $progress, size: 300)
                        
            Button(action: randomizeProgress) {
                Text("Update")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
        .onAppear {
            withAnimation(.interpolatingSpring(
                stiffness: 20.0,
                damping: 8.0)) {
                self.progress = 1.0
            }
        }
    }
    
    private func randomizeProgress() {
        withAnimation(.interpolatingSpring(stiffness: 20.0, damping: 8.0)) {
            self.progress = Double.random(in: 0.0...1.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
