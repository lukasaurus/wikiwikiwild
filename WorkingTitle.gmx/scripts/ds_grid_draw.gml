/// ds_grid_draw(grid,x,y)
//
//  Draws the data of a given grid at a screen location.
//
//      grid        grid data structure, id
//      x,y         screen position, real
//
/// GMLscripts.com/license
{

    var grid = argument0;


    for (i = 0; i<=ds_grid_width(grid)-1; i++)
        for(j=0;j<=ds_grid_height(grid)-1;j++)
        {
            draw_text(i*16,j*16,string(ds_grid_get(grid,i,j)))
        }
}
