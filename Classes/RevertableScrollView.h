//
//  RevertableScrollView.h
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/23.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RevertableScrollView : UIScrollView {
    CGPoint boundsOrigin;
    CGSize contentSize;
}

@property CGPoint boundsOrigin;

-(CGPoint)boundsOrigin;
-(void)setBoundsOrigin:(CGPoint)origin;
-(void)initContentSize:(CGSize)size;
-(void)revert;

@end
