{$method->exe("service","user_search_show")}
{if ($method->result == FALSE)}
    {$block->display("core:method_error")}
{else}
    {if $results == 1}
        {translate results=$results}search_result_count{/translate}
    {else}
        {translate results=$results}search_results_count{/translate}
    {/if}
  <BR>


  {literal}
    <script language="JavaScript">
    <!-- START
    	var module 		= 'service';		
    	{/literal}
    	{if $VAR._print == TRUE}
    	var p 			= '&_escape=y&_print=y';
    	{else}
    	var p 			= '';
    	{/if}{literal}
    	var IMAGE 		= '{/literal}{$NONSSL_IMAGE}{literal}';
    	var order 		= '{/literal}{$order}{literal}';
    	var sort1  		= '{/literal}{$sort}{literal}';
    	var search_id 	= '{/literal}{$search_id}{literal}';
    	var page 		= {/literal}{$page}{literal};
    	var pages		= '{/literal}{$pages}{literal}';
    	var results		= '{/literal}{$results}{literal}';
    	var limit 		= '{/literal}{$limit}{literal}';
    	record_arr = new Array ({/literal}{$limit}{literal});
    	var i = 0;	
    //  END -->
    </script>
    <SCRIPT SRC="themes/{/literal}{$THEME_NAME}{literal}/user_search.js"></SCRIPT>
    {/literal}

    <!-- SHOW THE SEARCH NAVIGATION MENU -->
    <center><script language="JavaScript">document.write(search_nav_top());</script></center>

<!-- BEGIN THE RESULTS CONTENT AREA -->
<div id="search_results" onKeyPress="key_handler(event);">
 <table id="main1" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_background">
  <form id="form1" name="form1" method="post" action="">
    <tr>
        <td> 
          <table id="main2" width="100%" border="0" cellspacing="1" cellpadding="2">
            <!-- DISPLAY THE SEARCH HEADING -->
            <tr valign="middle" align="center" class="table_heading"> 
              <td width="3%" class="table_heading">&nbsp;</td>
              <td width="16%" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=service}field_date_orig{/translate}{literal}','date_orig'));
				 </script>
                {/literal}
              </td>
              <td width="24%" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=service}field_sku{/translate}{literal}','sku'));
				 </script>
                {/literal}
              </td>
              <td width="16%" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=service}field_queue{/translate}{literal}','queue'));
				 </script>
                {/literal}
              </td>
              <td width="15%" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=service}field_price{/translate}{literal}','price'));
				 </script>
                {/literal}
              </td>
              <td width="9%" class="table_heading">&nbsp;</td>
              <!-- LOOP THROUGH EACH RECORD -->
              {foreach from=$service item=record}
            <tr id="row{$record.id}" onClick="row_sel('{$record.id}',1); window.location='?_page=service:user_view&id={$record.id},';" onMouseOver="row_mouseover('{$record.id}', 'row_mouse_over_select', 'row_mouse_over');" onMouseOut="row_mouseout('{$record.id}', '{$record._C}', 'row_select');" class="{$record._C}"> 
              <td align="center" width="3%"> 
                <input type="checkbox" name="record{$record.id}" value="{$record.id}" onClick="row_sel('{$record.id}',1,'{$record._C}');">
              </td>
              <td width="20%">&nbsp; 
                {$list->date($record.date_orig)}
              </td>
              <td width="30%">&nbsp; 
                {$record.sku}
                <font size="1">( 
                {translate module=service}
                {$record.type}
                {/translate}
                ) </font></td>
              <td width="25%"> &nbsp; 
                {if $record.queue != "" && $record.queue!= 'none' }
                {translate module=service}
                {$record.queue}
                {/translate}
                {else}
                {translate module=service}
                queue_none 
                {/translate}
                {/if}
              </td>
              <td width="20%"> 
                <div align="right"> 
                  {$list->format_currency($record.price,"")}
                  &nbsp; </div>
              </td>
              <td width="1%"> 
                {if $record.active == "1"}
                <img title=Active src="themes/{$THEME_NAME}/images/icons/go_16.gif" border="0"> 
                {else}
                <img title=Suspended/Inactive src="themes/{$THEME_NAME}/images/icons/stop_16.gif" border="0"> 
                {/if}
              </td>
            </tr>
            {literal}
            <script language="JavaScript">row_sel('{/literal}{$record.id}{literal}', 0, '{/literal}{$record._C}{literal}'); record_arr[i] = '{/literal}{$record.id}{literal}'; i++; </script>
            {/literal}
            {/foreach}
            <!-- END OF RESULT LOOP -->
          </table>
        </td>
    </tr>
  </form>
 </table>
  {/if}
</div>
