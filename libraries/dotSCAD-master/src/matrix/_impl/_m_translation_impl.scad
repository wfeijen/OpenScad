function _to_3_elems_translation_vect(v) =
     let(leng = len(v))
     leng == 3 ? v : (
         leng == 2 ? [v[0], v[1], 0] : [v[0], 0, 0]
     );

function _to_translation_vect(v) = is_num(v) ? [v, 0, 0] : _to_3_elems_translation_vect(v);

function _m_translation_impl(v) = 
    let(vt = _to_translation_vect(v))
    [
        [1, 0, 0, vt[0]],
        [0, 1, 0, vt[1]],
        [0, 0, 1, vt[2]],
        [0, 0, 0, 1]
    ];