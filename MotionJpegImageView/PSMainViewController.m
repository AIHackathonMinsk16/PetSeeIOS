//
//  PSMainViewController.m
//  MotionJpegImageView
//
//  Created by Anthony Marchenko on 12/17/16.
//  Copyright © 2016 ThinkFlood Inc. All rights reserved.
//

#import "PSMainViewController.h"
#import "MotionJpegImageView.h"

@interface PSMainViewController ()

@property (strong, nonatomic) UIWebView *webView;
@property (retain, nonatomic) IBOutlet MotionJpegImageView *imageView;

@end

@implementation PSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
  self.webView.userInteractionEnabled = NO;
  CGFloat scaleRatio = 1;
  CGAffineTransform scalingTransform =
  CGAffineTransformScale(CGAffineTransformIdentity, scaleRatio, scaleRatio);
  [self.webView setTransform:scalingTransform];
  CGRect webFrame = _webView.frame;
  webFrame.origin.y = 0.0;
  webFrame.origin.x = 0.0;
  self.webView.frame = webFrame;
  
  NSURL *url = [NSURL URLWithString:@"http://195.67.26.73/mjpg/video.mjpg"];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.view addSubview:self.webView];
  [self.webView loadRequest:request];
  
  webFrame.origin.y += webFrame.size.height;
  self.imageView = [[MotionJpegImageView alloc] initWithFrame:webFrame];
  self.imageView.url = url;
  [_imageView play];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
  [_imageView release];
  [super dealloc];
}
- (void)viewDidUnload {
  [self setImageView:nil];
  [super viewDidUnload];
}
@end
