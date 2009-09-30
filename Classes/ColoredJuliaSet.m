//
//  ColoredJuliaSet.m
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/29.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import "ColoredJuliaSet.h"


@implementation ColoredJuliaSet

- (id)init{
    if (self = [super init]) {
        outline = CGRectMake(0.0, 0.0, 1.0, 1.0);
        rect = CGRectMake(-2.0, -2.0, 3.0, 3.0);
        scale = 1.0 / 3.0;
        initialLineWidth = 0.001;
    }
    
    return self;
}

-(CGPoint)calculateNext:(CGPoint)z c:(CGPoint)c{
    return CGPointMake(z.x * z.x - z.y * z.y + c.x,
                         2 * z.x * z.y + c.y);
}

-(float)distance:(CGPoint)p{
    return sqrt(p.x * p.x + p.y * p.y);
}

- (void)draw{
    [super draw];
    
    for(float x = rect.origin.y; x <= rect.origin.y + rect.size.height ; x += rect.size.height / resolution.height){
        for(float y = rect.origin.x; y <= rect.origin.x + rect.size.width ; y += rect.size.width / resolution.width){
            CGPoint c = CGPointMake(0.2, 0.5);
            CGPoint z = CGPointMake(x, y);
            CGPoint z0 = z;
            for (int i = 0; i<40; i++) {
                z = [self calculateNext:z c:c];
                if ([self distance:z] > 5.0) {
                    break;
                }
            }
            if ([self distance:z] <= 5.0) {
                [[UIColor blackColor] set];
                [self dot:CGPointMake(z0.y, z0.x)];
                [self stroke];
            } else if ([self distance:z] <= 7.0) {
                [[UIColor blueColor] set];
                [self dot:CGPointMake(z0.y, z0.x)];
                [self stroke];
            } else if ([self distance:z] <= 10.0) {
                [[UIColor greenColor] set];
                [self dot:CGPointMake(z0.y, z0.x)];
                [self stroke];
            }
        }
    }
}

@end
