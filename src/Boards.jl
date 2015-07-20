module Boards

using PyCall
@pyimport gpu_lock2 as gg

export
    getboard

function getboard()
    board_id = gg.obtain_lock_id()

    if board_id < 0
        error("could not obtain lock")
    end

    board_id
end

end # module
