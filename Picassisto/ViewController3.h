//
//  ViewController3.h
//  Picassisto
//
//  Created by Adith Srinivasamurthy Tekur on 2/7/14.
//  Copyright (c) 2014 Adith Tekur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3 : UIViewController
//@property (strong, nonatomic) NSArray *Photos;
@property (weak, nonatomic) IBOutlet UIImageView *Image1;
@property (weak, nonatomic) IBOutlet UIImageView *Image2;
@property (weak, nonatomic) IBOutlet UIImageView *Image3;
@property (weak, nonatomic) IBOutlet UIImageView *Image4;
@property (strong, nonatomic) NSArray * sun, * artificial, * color, * flame;

@end