//
//  DogsDetailView.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import SwiftUI
import Kingfisher

struct DogsDetailView: View {
    
    let dog : Dog
    
    var body: some View {
        VStack(content: {
            Spacer()
            Text("Code: \(dog.code)").font(.headline).foregroundColor(.white)
            KFImage(URL(string: dog.imageUrl)).resizable().aspectRatio(contentMode: .fit).frame(height: 200, alignment: .center)
            Text("Description:").font(.caption).foregroundColor(.white)
            Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(dog.dogMockDescription)
            Spacer()
        }).frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background((LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottom)))
        
    }
}

struct DogsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogsDetailView(dog: Dog(code: 111, dogMockDescription: "asdasd", imageUrl: "https://picsum.photos/200"))
    }
}
