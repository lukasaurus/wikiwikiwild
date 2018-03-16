var g = argument0;  //the grid
var cur = argument1; //the cell to find neighbours for
var h = ds_grid_height(g);
var w = ds_grid_width(g);
var cx = cur[0];
var cy = cur[1];
var neighbours = ds_list_create();
var c;

//check NORTH neighbour
if cy >=2{
    if ds_grid_get(g,cx,cy-2)   == 0 ds_list_add(neighbours, "N")  
}
//check SOUTH neighbour
if cy <= h-3{
    if ds_grid_get(g,cx,cy+2)   == 0 ds_list_add(neighbours,"S")
}
//check EAST neighbour
if cx <= w-3{
    if ds_grid_get(g,cx+2,cy)   == 0 ds_list_add(neighbours,"E")
}

//check WEST neighbour
if cx >= 2{
    if ds_grid_get(g,cx-2,cy)  == 0 ds_list_add(neighbours,"W")
}

return neighbours
