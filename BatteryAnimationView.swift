import SwiftUI

struct BatteryAnimationView: View {
   @Binding var progress: Double
   let size: CGFloat
   
     private var gaugeColor: Color {
         if progress <= 0.1 {
             return .red
         } else if progress <= 0.2 {
             return .yellow
         } else {
             return .green
         }
     }

   var body: some View {
       ZStack {
           HStack(spacing: 0) {
               // Battery frame
               Rectangle()
                   .stroke(.black, lineWidth: size / 50)
                   .frame(width: size, height: size / 2)
                   .background(
                       // Battery gauge
                       Rectangle()
                             .fill(gaugeColor)
                           .scaleEffect(
                               x: progress,
                               y: 1,
                               anchor: .leading
                           )
                   )
               // Battery head
               Rectangle()
                   .fill(.black)
                   .frame(width: size / 20, height: size / 5)
           }
           
           Text("\(Int(self.progress * 100))%")
               .foregroundColor(.black)
               .font(.system(size: size / 6))
               .animation(nil)
       }
   }
}

struct BatteryAnimationView_Previews: PreviewProvider {
   static var previews: some View {
       BatteryAnimationView(progress: .constant(0.7), size: 300)
   }
}
