//
//  RevertableScrollView.m
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/23.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import "RevertableScrollView.h"


@implementation RevertableScrollView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        boundsOrigin = self.bounds.origin;
    }
    return self;
}

-(CGPoint)boundsOrigin{
    return boundsOrigin;
}

-(void)setBoundsOrigin:(CGPoint)origin{
    CGRect bounds = self.bounds;
    bounds.origin = origin;
    [self setBounds:bounds];
    
    boundsOrigin = origin;
}

-(void)initContentSize:(CGSize)size{
    [super setContentSize:size];
    contentSize = size;
}

-(void)revert{
    [super setContentSize:contentSize];
    
    CGRect bounds = self.bounds;
    bounds.origin = boundsOrigin;
    [self setBounds:bounds];
}

@end
