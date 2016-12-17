//
//  PSMainViewController.m
//  MotionJpegImageView
//
//  Created by Anthony Marchenko on 12/17/16.
//  Copyright © 2016 ThinkFlood Inc. All rights reserved.
//

#import "PSMainViewController.h"
#import "MotionJpegImageView.h"
#import "PSApiManager.h"

@interface PSMainViewController ()


@property (retain, nonatomic) IBOutlet MotionJpegImageView *imageView;
@property (retain, nonatomic) IBOutlet UIWebView *webView;

@property (retain, nonatomic) IBOutlet UIView *congtrolView;
@property (retain, nonatomic) IBOutlet UIButton *leftButton;
@property (retain, nonatomic) IBOutlet UIButton *rigthButton;
@property (retain, nonatomic) IBOutlet UIButton *upButton;
@property (retain, nonatomic) IBOutlet UIButton *downButton;

@end

@implementation PSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.webView = [[UIWebView alloc] initWithFrame:self.webView.bounds];
  self.webView.userInteractionEnabled = NO;
  CGFloat scaleRatio = self.view.frame.size.height/self.view.frame.size.width;
  CGAffineTransform scalingTransform =
  CGAffineTransformScale(CGAffineTransformIdentity, scaleRatio, scaleRatio);
  [self.webView setTransform:scalingTransform];
  CGRect webFrame = _webView.frame;
  webFrame.origin.y = 0.0;
  webFrame.origin.x = 0.0;
  self.webView.frame = webFrame;
//  NSURL *url = [NSURL URLWithString:@"http://192.168.43.122:8080/stream"];
   NSURL *url = [NSURL URLWithString:@"http://195.67.26.73/mjpg/video.mjpg"];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
//  [self.view addSubview:self.webView];
  [self.webView loadRequest:request];
  
  webFrame.origin.y += webFrame.size.height;
  self.imageView = [[MotionJpegImageView alloc] initWithFrame:webFrame];
  self.imageView.url = url;
  [_imageView play];
  
  [self configureButtons];
}

- (void)configureButtons {
  [self.upButton addTarget:self
                 action:@selector(methodTouchUpInside:)
       forControlEvents: UIControlEventTouchUpInside];
  [self.downButton addTarget:self
                    action:@selector(methodTouchUpInside:)
          forControlEvents: UIControlEventTouchUpInside];
  [self.leftButton addTarget:self
                    action:@selector(methodTouchUpInside:)
          forControlEvents: UIControlEventTouchUpInside];
  [self.rigthButton addTarget:self
                    action:@selector(methodTouchUpInside:)
          forControlEvents: UIControlEventTouchUpInside];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
  
}


#pragma mark - IBActions

- (IBAction)resetButtonPressed:(UIButton *)sender {
  [_imageView stop];
  [_imageView play];
}

#pragma mark - SocketRocket Delegate

- (IBAction)leftButtonPressed:(UIButton *)sender {
  [[PSApiManager manager] moveLeft];
}

- (IBAction)rightButtonPressed:(id)sender {
   [[PSApiManager manager] moveRight];
}

- (IBAction)upButtonPressed:(UIButton *)sender {
   [[PSApiManager manager] moveForward];
}

- (IBAction)downButtonPressed:(UIButton *)sender {
   [[PSApiManager manager] moveReverse];
}

- (void)methodTouchUpInside:(id)sender{
  [[PSApiManager manager] stop];
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
  [_webView release];
  [_congtrolView release];
  [_leftButton release];
  [_rigthButton release];
  [_upButton release];
  [_downButton release];
  [super dealloc];
}
- (void)viewDidUnload {
  [self setImageView:nil];
  [super viewDidUnload];
}
@end
