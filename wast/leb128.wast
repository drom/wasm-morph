(module
  (memory 256 256)
  (export "memory" memory)
  (export "unpack_uint32" $unpack_uint32)
  (func $unpack_uint32 (param $iptr i32) (param $optr i32) (result i32)
    (local $res i32)
    (local $i i32)
    (local $dat i32)
    (loop $label$break$L1 $label$continue$L1
      (set_local $res
        (i32.or
          (i32.shl
            (get_local $res)
            (i32.const 7)
          )
          (i32.and
            (set_local $dat
              (i32.load8_u
                (get_local $iptr)
              )
            )
            (i32.const 127)
          )
        )
      )
      (br_if $label$break$L1
        (i32.eqz
          (i32.and
            (get_local $dat)
            (i32.const 128)
          )
        )
      )
      (set_local $iptr
        (i32.add
          (get_local $iptr)
          (i32.const 1)
        )
      )
      (br_if $label$continue$L1
        (set_local $i
          (i32.sub
            (get_local $i)
            (i32.const 1)
          )
        )
      )
    )
    (i32.store
      (get_local $optr)
      (get_local $res)
    )
    (return
      (get_local $iptr)
    )
  )
)
