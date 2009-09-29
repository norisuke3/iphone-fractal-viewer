//
//  Coordinate.m
//  DrawSample
//
//  Created by Nori@FireDictionary on 09/09/22.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import "Coordinate.h"

@implementation Coordinate

@synthesize context;
@synthesize color;
@synthesize rect;

- (id)init{
    if (self = [super init]) {
        resolution = CGSizeMake(320 * 3, 460 * 3);
        scale = 1.0;
        initialLineWidth = 0.0001;
        self.color = [UIColor redColor];
    }
    
    return self;
}

-(void)dot:(CGPoint)point{
    CGContextMoveToPoint(context, point.x, point.y);
    CGContextAddLineToPoint(context, point.x, point.y + 1.0 / (scale * resolution.height));
}

- (float)lineWidth{
    return initialLineWidth / scale;
}

-(void)draw{
    [color set];
    CGContextSetLineWidth(context, self.lineWidth);
}

-(void)stroke{
    CGContextStrokePath(context);
}

- (void)modifyRect:(CGPoint)origin scale:(float)_scale{
    scale = _scale;
    rect = CGRectMake(
                      origin.x,
                      origin.y,
                      outline.size.width / scale,
                      outline.size.height / scale);
}

-(float)outlineWidth{
    return outline.size.width;
}

-(void)dealloc{
    [color release];
    [super dealloc];
}

@end
