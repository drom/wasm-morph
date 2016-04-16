'use strict';

var lib = require('../lib'),
    expect = require('chai').expect;

describe('leb128', function () {
    var buffer, HEAPU8, HEAPU32, HEAP32, leb128, tests;

    buffer = new global.ArrayBuffer(128);
    HEAPU8 = new global.Uint8Array(buffer);
    HEAPU32 = new global.Uint32Array(buffer);
    // HEAP32 = new global.Int32Array(buffer);

    [
      0x55, // 85
      0xE5, 0x8E, 0x26, // 624485
      0x9b, 0xf1, 0x59  // -624485 0xFFF6789b
    ].forEach(function (e, i) {
        HEAPU8[i] = e;
    });

    leb128 = lib.leb128(global, null, buffer);
    tests = {
        unpack_uint32_1: {
          fn: leb128.unpack_uint32,
          iptr: 0, optr: 64, res: 1, ores: 0x55
        },
        unpack_int32_1: {
          fn: leb128.unpack_int32,
          iptr: 0, optr: 64, res: 1, ores: 0xFFFFFFD5
        },
        unpack_uint32_3: {
          fn: leb128.unpack_uint32,
          iptr: 1, optr: 64, res: 4, ores: 624485
        },
        unpack_int32_3: {
          fn: leb128.unpack_int32,
          iptr: 4, optr: 64, res: 7, ores: -624485
        }
    };

    Object.keys(tests).forEach(function (name) {
        var test = tests[name];
        it(name, function (done) {
            var iptr = test.fn(test.iptr, test.optr);
            expect(iptr).eq(test.res);
            expect(HEAPU32[test.optr >> 2]).eq(test.ores >>> 0);
            done();
        });
    });

});
