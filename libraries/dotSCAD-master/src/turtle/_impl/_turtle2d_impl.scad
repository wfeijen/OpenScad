function _turtle2d_turtle(x, y, angle) = [[x, y], angle];

function _turtle2d_set_point(turtle, point) = [point, _turtle2d_get_angle(turtle)];

function _turtle2d_set_x(turtle, x) = [[x, _turtle2d_get_y(turtle)], _turtle2d_get_angle(turtle)];
function _turtle2d_set_y(turtle, y) = [[_turtle2d_get_x(turtle), y], _turtle2d_get_angle(turtle)];
function _turtle2d_set_angle(turtle, angle) = [_turtle2d_get_pt(turtle), angle];

function _turtle2d_forward(turtle, leng) = 
    _turtle2d_turtle(
        _turtle2d_get_x(turtle) + leng * cos(_turtle2d_get_angle(turtle)), 
        _turtle2d_get_y(turtle) + leng * sin(_turtle2d_get_angle(turtle)), 
        _turtle2d_get_angle(turtle)
    );

function _turtle2d_turn(turtle, angle) = [_turtle2d_get_pt(turtle), _turtle2d_get_angle(turtle) + angle];

function _turtle2d_get_x(turtle) = turtle[0][0];
function _turtle2d_get_y(turtle) = turtle[0][1];
function _turtle2d_get_pt(turtle) = turtle[0];
function _turtle2d_get_angle(turtle) = turtle[1];

function _turtle2d_three_args_command(cmd, arg1, arg2, arg3) = 
    cmd == "create" ? _turtle2d_turtle(arg1, arg2, arg3) : _turtle2d_two_args_command(cmd, arg1, arg2);

function _turtle2d_two_args_command(cmd, arg1, arg2) =
    is_undef(arg2) ? _turtle2d_one_arg_command(cmd, arg1) : 
    cmd == "pt" ? _turtle2d_set_point(arg1, arg2) : 
    cmd == "x" ? _turtle2d_set_x(arg1, arg2) : 
    cmd == "y" ? _turtle2d_set_y(arg1, arg2) : 
    cmd == "angle" ? _turtle2d_set_angle(arg1, arg2) : 
    cmd == "forward" ? _turtle2d_forward(arg1, arg2) : 
    cmd == "turn" ? _turtle2d_turn(arg1, arg2) : undef;
    
function _turtle2d_one_arg_command(cmd, arg) =
    cmd == "x" ? _turtle2d_get_x(arg) : 
    cmd == "y" ? _turtle2d_get_y(arg) : 
    cmd == "angle" ? _turtle2d_get_angle(arg) : 
    cmd == "pt" ? _turtle2d_get_pt(arg) : undef;

function _turtle2d_impl(cmd, arg1, arg2, arg3) = 
    _turtle2d_three_args_command(cmd, arg1, arg2, arg3);
