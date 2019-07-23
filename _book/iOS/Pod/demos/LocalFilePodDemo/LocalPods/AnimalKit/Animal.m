//
//  Animal.m
//  LocalFilePodDemo
//
//  Created by liuweizhen on 2019/3/29.
//  Copyright © 2019 daliu. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void)eat {
    NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)drink {
    NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)think {
    NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

@end
