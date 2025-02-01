//
//  GameDetailView.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 31/01/25.
//

import SwiftUI

struct GameDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: GameDetailViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: viewModel.gameSelected.thumbnail ?? "")) { result in
                    result.resizable().scaledToFit().frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                }.frame(maxWidth: .infinity)
                
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Genre:").font(.headline)
                    .foregroundColor(.gray)
                Text(viewModel.gameSelected.genre ?? "").font(.title2)
                    .foregroundColor(.accentColor).frame(maxWidth: .infinity,alignment: .leading)
                Text("Description:").font(.headline)
                    .foregroundColor(.gray)
                Text(viewModel.gameSelected.short_Description ?? "").font(.body)
                    .foregroundColor(.accentColor)
                HStack(alignment: .center) {
                    Text("Rate:").font(.headline).foregroundStyle(.gray)
                    Picker("Rate", selection: $viewModel.rate) {
                        ForEach(0...5, id:\.self) { index in
                            Text("\(index)").tag(index).font(.body)
                                .foregroundColor(.accent)
                        }
                    }.pickerStyle(.menu)
                    Image(systemName: "star.fill")
                }
                Text("Comments:").font(.headline)
                    .foregroundColor(.gray)
                TextEditor(text: $viewModel.comments).font(.body).foregroundStyle(Color.accentColor).padding().background(.gray.opacity(0.2)).cornerRadius(8).scrollContentBackground(.hidden).frame(height: 150)
                HStack(spacing: 8) {
                    Button {
                        viewModel.delete()
                        dismiss()
                    } label: {
                        Text("Delete").font(.headline).foregroundStyle(.white).frame(maxWidth: .infinity).padding().background(Color.red).cornerRadius(8)
                    }
                    Button {
                        viewModel.update()
                        dismiss()
                    } label: {
                        Text("Save").font(.headline).foregroundStyle(.white).frame(maxWidth: .infinity).padding().background(Color.accentColor).cornerRadius(8)
                    }
                    
                }
                
            }.padding(.horizontal, 8).padding(.bottom, 20)
            
        }.navigationTitle(viewModel.gameSelected.title ?? "").toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 0) {
                    Button {
                        viewModel.isFavorite.toggle()
                    } label: {
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.red)
                    }
                    Button {
                        viewModel.update()
                        dismiss()
                    } label: {
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.accentColor)
                    }
                    Button {
                        viewModel.delete()
                        dismiss()
                    } label: {
                        Image(systemName: "trash.square.fill")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.red)
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    //GameDetailView()
}
