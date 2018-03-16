w = argument0 +  argument0 -1 //set the width of the grid
h = argument1 +  argument1 -1 //set height of grid
randomize()
//the doubling and minus one allows for a gap in between "rooms"

tree = ds_grid_create(w,h)

//init tree with 0's. 0's are walls
for(i=0; i<w; i+=1){
    for(j=0; j<h; j+=1){
        ds_grid_set(tree,i,j,0)
    }
}

var current_cell; 
//set initial cell - randomize this later
current_cell[0] = 0;
current_cell[1] = 0;

cells = ds_stack_create()
ds_stack_push(cells, current_cell)

while (not ds_stack_empty(cells))
{
    //get top cell
    current_cell = ds_stack_top(cells)
    //set current cell to wall (1 is wall)
    ds_grid_set(tree,current_cell[0],current_cell[1],1)
    
    //get neighbours
    var neighbours = scr_get_neighbours(tree, current_cell)
    
    //pick a random neighbour
    if ds_list_size(neighbours) > 0
    {
        ds_list_shuffle(neighbours)
        var dir = ds_list_find_value(neighbours,0)
        if dir =="N"
        {
            //create path
            ds_grid_set(tree,current_cell[0],current_cell[1]-1,2)//(2 is path)
            //push next cell onto stack
            var c;
            c[0] = current_cell[0] 
            c[1] = current_cell[1]-2
            
            
            ds_stack_push(cells, c)
        }
        if dir == "S"
        {
            //create path
            ds_grid_set(tree,current_cell[0],current_cell[1]+1,2)//(2 is path)
            //push next cell onto stack
            var c;
            c[0] = current_cell[0] 
            c[1] = current_cell[1]+2
            
            
            ds_stack_push(cells, c)
        }
        if dir == "E"
        {
            //create wall
            ds_grid_set(tree,current_cell[0]+1,current_cell[1],2)//(2 is path)
            //push next cell onto stack
            var c;
            c[0] = current_cell[0]+2 
            c[1] = current_cell[1]
            ds_stack_push(cells, c)
            
        }
        if dir == "W"
        {
            //create wall
            ds_grid_set(tree,current_cell[0]-1,current_cell[1],2)//(2 is path)
            //push next cell onto stack
            var c;
            c[0] = current_cell[0]-2 
            c[1] = current_cell[1]
            ds_stack_push(cells, c)
        }
        
           
    }
       else
    {
        ds_stack_pop(cells) //remove top if no neighbours
    }
 
    

  
}

  for (i = 0; i<=ds_grid_width(tree)-1; i++)
        for(j=0;j<=ds_grid_height(tree)-1;j++)
        {
            if ds_grid_get(tree,i,j) == 0 instance_create(i*32,j*32,obj_test_wall)
        }




