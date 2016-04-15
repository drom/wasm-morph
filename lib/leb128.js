
function asmFunc(global, env, buffer) {
  'use asm';
  var HEAPU8 = new global.Uint8Array(buffer);
  var HEAPU32 = new global.Uint32Array(buffer);

  function unpack_uint32 (iptr, optr) {
    iptr = iptr |0;
    optr = optr |0;
    var i = 5, res = 0, dat = 0;
    L1: do {
      dat = HEAPU8[iptr >> 0] |0;
      res = (res << 7) | (dat & 127);
      if (!(dat & 128)) break L1;
      i = (i - 1) |0;
      iptr = (iptr + 1) |0;
    } while (i);
    HEAPU32[optr >> 2] = res;
    return iptr;
  }

  return {
    unpack_uint32: unpack_uint32
  };
}

module.exports = asmFunc;
