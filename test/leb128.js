'use strict';

var lib = require('../lib'),
    expect = require('chai').expect;

describe('leb128', function () {
    var buffer, HEAPU8, HEAPU32, leb128;
    before(function () {
        buffer = new global.ArrayBuffer(128);
        HEAPU8 = new global.Uint8Array(buffer);
        HEAPU32 = new global.Uint32Array(buffer);
        [0xE5, 0x8E, 0x26, 4, 5, 6, 7, 8].forEach(function (e, i) {
            HEAPU8[i] = e;
        });
        leb128 = lib.leb128(global, null, buffer);
    });
    it('unpack_uint32', function (done) {
        var iptr = leb128.unpack_uint32(0, 64);
        expect(iptr).eq(2);
        console.log(HEAPU32[64 >> 2].toString(16));
        expect(HEAPU32[64 >> 2]).eq(0x00010101);
        done();
    });
});
