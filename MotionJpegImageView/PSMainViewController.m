//
//  PSMainViewController.m
//  MotionJpegImageView
//
//  Created by Anthony Marchenko on 12/17/16.
//  Copyright © 2016 ThinkFlood Inc. All rights reserved.
//

#import "PSMainViewController.h"
#import "MotionJpegImageView.h"
#import <SocketRocket/SRWebSocket.h>
#import "PSApiManager.h"

@interface PSMainViewController ()


@property (retain, nonatomic) IBOutlet MotionJpegImageView *imageView;
@property (retain, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation PSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//  self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
  self.webView.userInteractionEnabled = NO;
  CGFloat scaleRatio = 1;
  CGAffineTransform scalingTransform =
  CGAffineTransformScale(CGAffineTransformIdentity, scaleRatio, scaleRatio);
  [self.webView setTransform:scalingTransform];
  CGRect webFrame = _webView.frame;
  webFrame.origin.y = 0.0;
  webFrame.origin.x = 0.0;
  self.webView.frame = webFrame;
  NSURL *url = [NSURL URLWithString:@"http://192.168.43.122:8080/stream"];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.view addSubview:self.webView];
  [self.webView loadRequest:request];
  
  webFrame.origin.y += webFrame.size.height;
  self.imageView = [[MotionJpegImageView alloc] initWithFrame:webFrame];
  self.imageView.url = url;
  [_imageView play];
  
  [self confgureWebSockets];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)confgureWebSockets {
  
  NSURL *url = [NSURL URLWithString:@"wss://ws.pusherapp.com/app/4e0ebd7a8b66fa3554a4?protocol=6&client=js&version=2.0.0&flash=false"];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  SRWebSocket *rusSocket = [[SRWebSocket alloc] initWithURLRequest:request];
  rusSocket.delegate = self;
  [rusSocket open];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
  [_imageView stop];
  [_imageView play];
}

#pragma mark - SocketRocket Delegate

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
 // NSString *helloMsg = @"{\"event\":\"pusher:subscribe\",\"data\":{\"channel\":\"chat_ru\"}}";
 // [webSocket send:helloMsg];
  //webSocket sen
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
  [super dealloc];
}
- (void)viewDidUnload {
  [self setImageView:nil];
  [super viewDidUnload];
}
@end
