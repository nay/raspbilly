

YAHOO.widget.Calendar.prototype._arender=YAHOO.widget.Calendar.prototype.render;
YAHOO.widget.Calendar.prototype.render=function(x,y,obj,val){
    if (obj)
    {
        this.onSelect=function(){
        	if (obj._skip_detach==-1) return;
			obj._skip_detach=false;        	
            obj.grid.editStop();//detach(this);
        }
    }

    if (val) {
        var z=val.split("/");
        this.setYear(z[2]);
        this.setMonth(z[0]-1);

        obj._skip_detach=-1;
        this.select((z[0])+"/"+z[1]+"/"+z[2]);
        obj._skip_detach=true;
        }
    this._arender();
    if (x){
    this._myCont.style.display="";
    this._myCont.style.position="absolute";
    this._myCont.zIndex="19";
    this._myCont.style.top=y+"px";
    this._myCont.style.left=x+"px";
    }

}
YAHOO.widget.Calendar.prototype.hide=function(){
    this._myCont.style.display="none";
}



function  _grid_calendar_init(){
var z=document.createElement("DIV");
z.style.display="none";
z.id="_cal_"+((new Date()).valueOf());
document.body.appendChild(z);


window._grid_calendar = new YAHOO.widget.Calendar("_grid_calendar", z.id);
window._grid_calendar._myCont=z;
window._grid_calendar.render();
window._grid_calendar.hide();
}
