//
//  DataModel.h
//  Capnote
//
//  Created by Daler Asrorov on 12/6/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject


+ (instancetype) sharedModel;  

- (NSUInteger) nNotes;
- (NSDictionary *) noteWithID: (NSInteger) noteID;


@end
