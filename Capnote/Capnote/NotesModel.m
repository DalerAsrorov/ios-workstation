//
//  NotesModel.m
//  Capnote
//
//  Created by Daler Asrorov on 12/7/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "NotesModel.h"

@implementation NotesModel


- (instancetype) init {
    if(self = [super init]) {
         self.ref = [[FIRDatabase database] reference];
    }
    
    return self;
}

// each note has an id (time), title (string), section (string), description (string), files (array)
- (void) addNote: (NSDictionary *) note {
    NSString * key = self.generateKey;
    [[[self.ref child: @"notes"] child: key] setValue: note];
}

- (void) removeNoteAt:(NSInteger) noteID {
    
}

- (NSString *) generateKey {
    NSInteger keyTimeInSeconds = (int)[[NSDate date] timeIntervalSince1970];
    NSString * keyStr = [NSString stringWithFormat:@"%ld", keyTimeInSeconds];
    return keyStr;
}





@end
