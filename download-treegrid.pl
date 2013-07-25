#http://www.dhtmlx.com/docs/products/dhtmlxGrid/codebase/dhtmlxgrid.css
#http://www.dhtmlx.com/docs/products/dhtmlxTreeGrid/codebase/dhtmlxtreegrid.js
use LWP::Simple;
#my $root = 'http://www.dhtmlx.com/docs/products/dhtmlxGrid/codebase/';
#chdir 'F:\workspace_f\MR\web2\WebContent\dhtmlx\lib';
#
##getstore($root.'dhtmlxgrid.css','dhtmlxgrid.css');
##getstore('http://www.dhtmlx.com/docs/products/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css','dhtmlxgrid_dhx_skyblue.css');
##
##getstore('http://www.dhtmlx.com/docs/products/dhtmlxTreeGrid/codebase/dhtmlxtreegrid.js','dhtmlxtreegrid.js');
##getstore('http://www.dhtmlx.com/docs/products/dhtmlxGrid/codebase/dhtmlxgridcell.js','dhtmlxgridcell.js');
##getstore('http://www.dhtmlx.com/docs/products/dhtmlxGrid/codebase/ext/dhtmlxtreegrid_lines.js','dhtmlxgridcell.js');
#
##getstore('http://www.dhtmlx.com/docs/products/dhtmlxTreeGrid/samples/common/treegrid.xml','treegrid.xml');
#getstore('http://www.dhtmlx.com/docs/products/dhtmlxGrid/samples/common/data.json','data.json');

use Cwd;
chdir 'F:\workspace_f\MR4\webtest\WebContent\js';
getstore('http://i18next.com/public/download/versions/i18next-1.6.0.js','i18next-1.6.0.js');
 
print "done";