//
//  Coordinate.h
//  DrawSample
//
//  Created by Nori@FireDictionary on 09/09/22.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Coordinate : NSObject {
    CGRect rect, outline;
    CGSize resolution;
    float scale, initialLineWidth;
    CGContextRef context;
    UIColor* color;
}

@property CGContextRef context;
@property (readonly)float lineWidth;
@property (retain)UIColor* color;
@property (readonly)CGRect rect;
@property (readonly)float outlineWidth;

- (void)modifyRect:(CGPoint)origin scale:(float)scale;


- (void)dot:(CGPoint)point;
- (void)draw;
- (void)stroke;

@end
