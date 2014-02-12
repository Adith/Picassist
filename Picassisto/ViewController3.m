//
//  ViewController3.m
//  Picassisto
//
//  Created by Adith Srinivasamurthy Tekur on 2/7/14.
//  Copyright (c) 2014 Adith Tekur. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3
@synthesize sun, artificial, color, flame;

static int photoCount;
static int randomInterval = 2;
NSString * imagesPath, *regex;
NSError * error;
NSArray * contents;
NSPredicate *predicate;

- (void)viewDidLoad
{
    imagesPath = [[NSBundle mainBundle] resourcePath];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    contents = [fileManager contentsOfDirectoryAtPath:imagesPath error:nil];
    regex = @"squares_people_faces_sun[a-z_0-9.]*";
    predicate = [NSPredicate predicateWithFormat:@"description MATCHES %@", regex];
    sun = [contents filteredArrayUsingPredicate:predicate];
    regex = @"squares_people_faces_artificial[a-z_0-9.]*";
    predicate = [NSPredicate predicateWithFormat:@"description MATCHES %@", regex];
    artificial = [contents filteredArrayUsingPredicate:predicate];
    regex = @"squares_people_faces_color[a-z_0-9.]*";
    predicate = [NSPredicate predicateWithFormat:@"description MATCHES %@", regex];
    color = [contents filteredArrayUsingPredicate:predicate];
    regex = @"squares_people_faces_flame[a-z_0-9.]*";
    predicate = [NSPredicate predicateWithFormat:@"description MATCHES %@", regex];
    flame = [contents filteredArrayUsingPredicate:predicate];
    
    [super viewDidLoad];
    //    self.Photos = people;
    //    self.Image1.image = [UIImage imageNamed:[self.Photos objectAtIndex:0]];
    //    randomInterval = minRandomTimeInterval + arc4random() % (maxRandomTimeInterval - minRandomTimeInterval );
    [NSTimer scheduledTimerWithTimeInterval:randomInterval target:self selector:@selector(transitionPhotos) userInfo:nil repeats:YES];
}

- (UIImageView *) returnRandomView:(int)randomView {
    switch (randomView) {
        default:
        case 1:
            return self.Image1;
        case 2:
            return self.Image2;
        case 3:
            return self.Image3;
        case 4:
            return self.Image4;
    }
}

- (NSArray *) returnSubjectArray:(int)randomView {
    switch (randomView) {
        default:
        case 1:
            return self.sun;
        case 2:
            return self.artificial;
        case 3:
            return self.color;
        case 4:
            return self.flame;
    }
}

-(void)transitionPhotos{
    int randomView = 1 + arc4random() % 4;
    
    if (photoCount < [[self returnSubjectArray:randomView] count] - 1){
        photoCount ++;
    }else{
        photoCount = 0;
    }
    [UIView transitionWithView:[self returnRandomView:randomView]
                      duration:2.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{ [self returnRandomView:randomView].image = [UIImage imageNamed:[[self returnSubjectArray:randomView]  objectAtIndex:photoCount]]; }
                    completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pullUp:(id)sender {
}
@end


