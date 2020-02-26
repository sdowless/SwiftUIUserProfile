//
//  ContentView.swift
//  InstagramProfile
//
//  Created by Stephen Dowless on 2/22/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct ContentView: View {
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        VStack {
            ProfileHeader()
            
            ASCollectionView(data: viewModel.posts) { post, _ in
                PostCell(post: post)
            }
            .layout(self.layout)
            .alwaysBounceVertical()
            .padding(.top, -54)
            .edgesIgnoringSafeArea(.all)
            .shadow(color: .white, radius: 24, x: 0, y: 0)
        }
    }
    
    var layout: ASCollectionLayout<Int> {
        ASCollectionLayout(scrollDirection: .vertical, interSectionSpacing: 0) {
            ASCollectionLayoutSection {
                // width of cell
                let width = NSCollectionLayoutDimension.fractionalWidth(1 / 3)
                
                // item size
                let itemSize = NSCollectionLayoutSize(widthDimension: width,
                                                        heightDimension: .fractionalHeight(1.0))
                
                // item
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // insets
                let inset = CGFloat(0.5)
                item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset,
                                                             bottom: inset, trailing: inset)
                
                // layout size
                let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: width)
                
                // item group
                let itemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
                
                // return section
                return NSCollectionLayoutSection(group: itemGroup)
            }
        }
    }
}
