//
//  FirstPipeline.swift
//  CombineLessons
//
//  Created by Александр Кох on 03.08.2022.
//

///  " ❌"
///  "✅"

import SwiftUI
import Combine

struct FirstPipelineView: View {
    
    @StateObject var viewModel = FirstPipelineViewModel()
    
    var body: some View {
        HStack{
            TextField("Ваше имя", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(viewModel.validation)
        }
        .padding()
    }
}

class FirstPipelineViewModel: ObservableObject {
    @Published var validation = ""
    @Published var name = ""
    init() {
        $name
            .map { $0.isEmpty ? "❌" : "✅" }
            .assign(to: &$validation)
    }
}

struct FirstPipelineView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPipelineView()
    }
}
