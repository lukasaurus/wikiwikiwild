///level creator

//initialise variables

min_room_width = 5;
max_room_width = 10;

min_room_height = 5;
max_room_height = 10;

current_x = irandom
current_y = 0

//creating stack and grid
stk_coords = ds_stack_create();
grd_rooms = ds_grid_create(irandom_range(min_room_width, max_room_width), irandom_range(min_room_height, max_room_height));

//the values in the grid are as follows: R=room P=path 
//1st loop (scanning and assigning rooms and paths)
while 1
    {
    randomize();
    ds_grid_add(grd_rooms, current_x, current_y, "R");// saves current coords to grid
    ds_stack_push(stk_coords, current_x, current_y); //adds current coords to stack
    
    while 1//decides a random direction and checks if its clear
        {
        if irandom_range(0,3) == 0
            {
            if ds_grid_get(grd_rooms, current_x , current_y-2) == noone and if ds_grid_get(grd_rooms, current_x , current_y-2) > 0 and if ds_grid_get(grd_rooms, current_x , current_y-2) < max_room_height //up
                {
                
                }
            }
        if irandom_range(0,3) == 1
            {
            if ds_grid_get(grd_rooms, current_x+2 , current_y) == noone and if ds_grid_get(grd_rooms, current_x+2 , current_y) > 0 and if ds_grid_get(grd_rooms, current_x+2 , current_y) < max_room_height //right
                {
                
                }
            }
        if irandom_range(0,3) == 2
            {
            ds_grid_get(grd_rooms, current_x , current_y+1) == noone //down
                {
                
                }
            }
        if irandom_range(0,3) == 3
            {
            ds_grid_get(grd_rooms, current_x-1, current_y ) == noone //left
                {
                
                }
            }
        }
        
    //Moves in that direction and sets the room inbetween as a path
    if dir == "0"
        {
        y -= 1;
        ds_grid_add(grd_rooms, x/room_size, y/room_size, "P");
        y -= 1;
        }
    else if dir == "90"
        {
        x += 1;
        ds_grid_add(grd_rooms, x/room_size, y/room_size, "P");
        x += 1;
        }
    else if dir == "180"
        {
        y += 1;
        ds_grid_add(grd_rooms, x/room_size, y/room_size, "P");
        y += 1;
        }
    else if dir == "270"
        {
        x -= 1;
        ds_grid_add(grd_rooms, x/room_size, y/room_size, "P");
        x -= 1;
        }
    }
    

