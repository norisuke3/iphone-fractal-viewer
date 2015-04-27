//
//  FractalViewController.m
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/22.
//  Copyright FireDictionary.com 2009. All rights reserved.
//

#import "FractalViewController.h"
#import "TouchSensitiveView.h"
#import "Canvas.h"
#import "RevertableScrollView.h"

@implementation FractalViewController

@synthesize mapClassName;
@synthesize mCanvas;

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        SCROLL_VIEW_BOUNDS_ORIGIN = CGPointMake(320.0, 460.0);
        lastOffset = CGPointMake(0.0, 0.0);
    }
    UIView* view = self.view;

    return self;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        SCROLL_VIEW_BOUNDS_ORIGIN = CGPointMake(320.0, 460.0);
    }
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSString* mapClassName = [ud stringForKey:@"mapClassName"];

    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    CGRect canvasRect = CGRectMake(0.0, 0.0, 960.0, 1380.0);
    
    self.navigationController.navigationBarHidden = YES;
    
    mCanvas = [[[[Canvas alloc] initWithFrame:canvasRect mapClassName:mapClassName] autorelease] retain];
    mCanvas.backgroundColor = [UIColor whiteColor];
    mCanvas.dataSource = self;
    
    RevertableScrollView* scrollView = [[RevertableScrollView alloc] initWithFrame:rect];
    [scrollView initContentSize:mCanvas.frame.size];
    scrollView.maximumZoomScale = 1000.0;
    scrollView.minimumZoomScale = 1.0;
    scrollView.delegate = self;
    scrollView.boundsOrigin = SCROLL_VIEW_BOUNDS_ORIGIN;
    
    [scrollView addSubview:mCanvas];
    self.view = scrollView;
    
    [scrollView release];
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView
                      withView:(UIView *)view
                       atScale:(float)scale
{
    [(Canvas*)mCanvas zoom:scale onOffset:lastOffset];
    
    [(RevertableScrollView*)scrollView revert];

    [mCanvas resetRect];
    [mCanvas setNeedsDisplay];
}

-(void)setCanvasOrigin:(UIScrollView*)scrollView{
    if (scrollView.bounds.origin.x < 100 ||
        scrollView.bounds.origin.y < 100 ||
        scrollView.bounds.origin.x > 540 ||
        scrollView.bounds.origin.y > 820
        ) {
        CGPoint offset = scrollView.bounds.origin;
        
        [(Canvas*)mCanvas setOrigin:offset];
        
        [(RevertableScrollView*)scrollView revert];
        
        [mCanvas resetRect];
        [mCanvas setNeedsDisplay];
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!decelerate) {
        [self setCanvasOrigin:scrollView];
        lastOffset = CGPointMake(scrollView.bounds.origin.x - 320, scrollView.bounds.origin.y - 460);
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self setCanvasOrigin:scrollView];
    lastOffset = CGPointMake(scrollView.bounds.origin.x - 320, scrollView.bounds.origin.y - 460);
}


- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [scrollView.subviews objectAtIndex:0];
}

- (void)saveLogisticMapToPhotoAlbum{
    [(Canvas*)mCanvas drawToImageContext];
}

- (void)backToTheMapMenu{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet*)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0){
        [self backToTheMapMenu];
        
    } else if (buttonIndex == 1){
        [self saveLogisticMapToPhotoAlbum];
        
    }
    [actionSheet release];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [mCanvas release];
    [mapClassName release];
    [super dealloc];
}

@end
