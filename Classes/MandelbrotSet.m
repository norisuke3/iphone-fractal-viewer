//
//  MandelbrotSet.m
//  LogisticMapTest
//
//  Created by Hamamoto Noriaki on 09/09/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MandelbrotSet.h"


@implementation MandelbrotSet

- (id)init{
    if (self = [super init]) {
        outline = CGRectMake(0.0, 0.0, 1.0, 1.0);
        rect = CGRectMake(-1.5, -2.8, 3.0, 3.0);
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
            CGPoint c = CGPointMake(x, y);
            CGPoint z = CGPointMake(0.0, 0.0);
            for (int i = 0; i<40; i++) {
                z = [self calculateNext:z c:c];
                if ([self distance:z] > 10.0) {
                    break;
                }
            }
            if ([self distance:z] <= 10.0) {
                [self dot:CGPointMake(c.y, c.x)];
            }
        }
    }
}

@end
