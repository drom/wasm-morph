(module
  (memory 256 256)
  (export "memory" memory)
  (export "unpack_uint32" $unpack_uint32)
  (export "unpack_int32" $unpack_int32)
  (func $unpack_uint32 (param $iptr i32) (param $optr i32) (result i32)
    (local $res i32)
    (local $dat i32)
    (set_local $res
      (i32.or
        (get_local $res)
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
    (set_local $iptr
      (i32.add
        (get_local $iptr)
        (i32.const 1)
      )
    )
    (if
      (i32.and
        (get_local $dat)
        (i32.const 128)
      )
      (block
        (set_local $res
          (i32.or
            (get_local $res)
            (i32.shl
              (i32.and
                (set_local $dat
                  (i32.load8_u
                    (get_local $iptr)
                  )
                )
                (i32.const 127)
              )
              (i32.const 7)
            )
          )
        )
        (set_local $iptr
          (i32.add
            (get_local $iptr)
            (i32.const 1)
          )
        )
        (if
          (i32.and
            (get_local $dat)
            (i32.const 128)
          )
          (block
            (set_local $res
              (i32.or
                (get_local $res)
                (i32.shl
                  (i32.and
                    (set_local $dat
                      (i32.load8_u
                        (get_local $iptr)
                      )
                    )
                    (i32.const 127)
                  )
                  (i32.const 14)
                )
              )
            )
            (set_local $iptr
              (i32.add
                (get_local $iptr)
                (i32.const 1)
              )
            )
            (if
              (i32.and
                (get_local $dat)
                (i32.const 128)
              )
              (block
                (set_local $res
                  (i32.or
                    (get_local $res)
                    (i32.shl
                      (i32.and
                        (set_local $dat
                          (i32.load8_u
                            (get_local $iptr)
                          )
                        )
                        (i32.const 127)
                      )
                      (i32.const 21)
                    )
                  )
                )
                (set_local $iptr
                  (i32.add
                    (get_local $iptr)
                    (i32.const 1)
                  )
                )
                (if
                  (i32.and
                    (get_local $dat)
                    (i32.const 128)
                  )
                  (block
                    (set_local $res
                      (i32.or
                        (get_local $res)
                        (i32.shl
                          (i32.and
                            (set_local $dat
                              (i32.load8_u
                                (get_local $iptr)
                              )
                            )
                            (i32.const 15)
                          )
                          (i32.const 28)
                        )
                      )
                    )
                    (set_local $iptr
                      (i32.add
                        (get_local $iptr)
                        (i32.const 1)
                      )
                    )
                  )
                )
              )
            )
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
  (func $unpack_int32 (param $iptr i32) (param $optr i32) (result i32)
    (local $res i32)
    (local $dat i32)
    (set_local $res
      (i32.or
        (get_local $res)
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
    (set_local $iptr
      (i32.add
        (get_local $iptr)
        (i32.const 1)
      )
    )
    (if
      (i32.and
        (get_local $dat)
        (i32.const 128)
      )
      (block
        (set_local $res
          (i32.or
            (get_local $res)
            (i32.shl
              (i32.and
                (set_local $dat
                  (i32.load8_u
                    (get_local $iptr)
                  )
                )
                (i32.const 127)
              )
              (i32.const 7)
            )
          )
        )
        (set_local $iptr
          (i32.add
            (get_local $iptr)
            (i32.const 1)
          )
        )
        (if
          (i32.and
            (get_local $dat)
            (i32.const 128)
          )
          (block
            (set_local $res
              (i32.or
                (get_local $res)
                (i32.shl
                  (i32.and
                    (set_local $dat
                      (i32.load8_u
                        (get_local $iptr)
                      )
                    )
                    (i32.const 127)
                  )
                  (i32.const 14)
                )
              )
            )
            (set_local $iptr
              (i32.add
                (get_local $iptr)
                (i32.const 1)
              )
            )
            (if
              (i32.and
                (get_local $dat)
                (i32.const 128)
              )
              (block
                (set_local $res
                  (i32.or
                    (get_local $res)
                    (i32.shl
                      (i32.and
                        (set_local $dat
                          (i32.load8_u
                            (get_local $iptr)
                          )
                        )
                        (i32.const 127)
                      )
                      (i32.const 21)
                    )
                  )
                )
                (set_local $iptr
                  (i32.add
                    (get_local $iptr)
                    (i32.const 1)
                  )
                )
                (if
                  (i32.and
                    (get_local $dat)
                    (i32.const 128)
                  )
                  (block
                    (set_local $res
                      (i32.or
                        (get_local $res)
                        (i32.shl
                          (i32.and
                            (set_local $dat
                              (i32.load8_u
                                (get_local $iptr)
                              )
                            )
                            (i32.const 15)
                          )
                          (i32.const 28)
                        )
                      )
                    )
                    (set_local $iptr
                      (i32.add
                        (get_local $iptr)
                        (i32.const 1)
                      )
                    )
                  )
                )
              )
              (if
                (i32.and
                  (get_local $dat)
                  (i32.const 64)
                )
                (set_local $res
                  (i32.or
                    (get_local $res)
                    (i32.const -2097152)
                  )
                )
              )
            )
          )
          (if
            (i32.and
              (get_local $dat)
              (i32.const 64)
            )
            (set_local $res
              (i32.or
                (get_local $res)
                (i32.const -16384)
              )
            )
          )
        )
      )
      (if
        (i32.and
          (get_local $dat)
          (i32.const 64)
        )
        (set_local $res
          (i32.or
            (get_local $res)
            (i32.const -128)
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
