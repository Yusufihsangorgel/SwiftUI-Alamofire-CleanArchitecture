//
//  DogCardWidget.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import SwiftUI
import Kingfisher

struct DogCardWidget: View {

    let dog: Dog

    var body: some View {
        VStack {
            KFImage(URL(string: dog.imageUrl)).resizable().aspectRatio(contentMode: .fit).frame(height: 200, alignment: .center)
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 5, content: {
                    Text("Status Code").fontWeight(.light).font(.system(size: 10))
                    Text("\(dog.code)").bold()
                })
                Spacer()
            }

        }.fixedSize(horizontal: false, vertical: true)
    }
}

struct DogCardWidget_Previews: PreviewProvider {
    static var previews: some View {
        DogCardWidget(dog: Dog(code: 100, dogMockDescription: "Doggs", imageUrl: "https://httpstatusdogs.com/img/100.jpg")).previewLayout(.sizeThatFits)
    }
}


