//
//  6502.swift
//  AppleOne
//
//  Created by Thiago Auler dos Santos on 02/05/2018.
//  Copyright © 2018 Thiago Auler dos Santos. All rights reserved.
//

import Foundation

typealias db = UInt8  // data byte   (1 byte)
typealias dw = UInt16 // data word   (2 bytes)
typealias dd = UInt32 // data double (4 bytes)

enum opcodes_table: db
{
    case
    ///        aaa00            aaa01            aaa10
    /* aaa *///================================================
    /* 000 */  ORA = 0b00001,   ASL = 0b00010,
    /* 001 */  BIT = 0b00100,   AND = 0b00101,   ROL = 0b00110,
    /* 010 */  JPA = 0b01000,   EOR = 0b01001,   LSR = 0b01010,
    /* 011 */  JMP = 0b01100,   ADC = 0b01101,   ROR = 0b01110,
    /* 100 */  STY = 0b10000,   STA = 0b10001,   STX = 0b10010,
    /* 101 */  LDY = 0b10100,   LDA = 0b10101,   LDX = 0b10110,
    /* 110 */  CPY = 0b11000,   CMP = 0b11001,   DEC = 0b11010,
    /* 111 */  CPX = 0b11100,   SBC = 0b11101,   INC = 0b11110
}

enum opcodes_list: db
{
    case
    BRK = 0x00, BPL = 0x10, JSR = 0x20, BMI = 0x30, RTI = 0x40, BVC = 0x50,
    RTS = 0x60, BVS = 0x70, BCC = 0x90, BCS = 0xB0, BNE = 0xD0, BEQ = 0xF0,
    PHP = 0x08, CLC = 0x18, PLP = 0x28, SEC = 0x38, PHA = 0x48, CLI = 0x58, PLA = 0x68, SEI = 0x78,
    DEY = 0x88, TYA = 0x98, TAY = 0xA8, CLV = 0xB8, INY = 0xC8, CLD = 0xD8, INX = 0xE8, SED = 0xF8,
    TXA = 0x8A, TXS = 0x9A, TAX = 0xAA, TSX = 0xBA, DEX = 0xCA, NOP = 0xEA
}

enum address_mode: db
{
    case
    immediate   = 0b000,
    zero_page   = 0b001,
    accumulator = 0b010,
    absolute    = 0b011,
    indirect_y  = 0b100,
    zero_page_x = 0b101,
    absolute_y  = 0b110,
    absolute_x  = 0b111,
    indirect_x,
    zero_page_y,
    relative
}


class processor {
    
    private var pc: dw // program counter
    private var sp: db // stack pointer
    private var sr: db // status register
    private var ir: db // instruction register
    private var ac: db // accumulator
    private var x : db // x register
    private var y : db // y register
    
    init() {
        // pc is set using 0xFFFC
        self.pc = 0x0000 //read_word(0xFFFC);
        self.sp = 0xFF
        self.sr = 0x20
        self.ir = 0x00
        self.ac = 0x00
        self.x  = 0x00
        self.y  = 0x00
    }
    
    func doSomething() {
        print("\n\n... doing... something...");
    }
}
