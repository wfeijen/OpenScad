function _sort(lt, i) = 
    let(leng = len(lt))
    leng <= 1 ? lt : 
        let(
            pivot = lt[0],
            before = [for(j = 1; j < leng; j = j + 1) if(lt[j][i] < pivot[i]) lt[j]],
            after =  [for(j = 1; j < leng; j = j + 1) if(lt[j][i] >= pivot[i]) lt[j]]
        )
        concat(_sort(before, i), [pivot], _sort(after, i));

function _sort_impl(lt, by, idx) =
    let(
        dict = [["x", 0], ["y", 1], ["z", 0], ["i", idx]],
        i = dict[search(by == "idx" ? "i" : by, dict)[0]][1]
    )
    _sort(lt, i);