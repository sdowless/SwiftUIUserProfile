//
//  PostCell.swift
//  InstagramProfile
//
//  Created by Stephen Dowless on 2/22/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(self.post.imageName)
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
            }
        }
    }
}
