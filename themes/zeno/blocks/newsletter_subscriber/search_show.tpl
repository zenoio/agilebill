

{$method->exe("newsletter_subscriber","search_show")}
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
    	var module 		= 'newsletter_subscriber';		
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
    <SCRIPT SRC="themes/{/literal}{$THEME_NAME}{literal}/search.js"></SCRIPT>
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
              <td width="34" class="table_heading">&nbsp;</td>
              <td width="117" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=newsletter_subscriber}field_date_orig{/translate}{literal}','date_orig'));
				 </script>
                {/literal}
              </td>
              <td width="155" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=newsletter_subscriber}field_newsletter_id{/translate}{literal}','newsletter_id'));
				 </script>
                {/literal}
              </td>
              <td width="170" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=newsletter_subscriber}field_email{/translate}{literal}','email'));
				 </script>
                {/literal}
              </td>
              <td width="164" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=newsletter_subscriber}field_last_name{/translate}{literal}','last_name'));
				 </script>
                {/literal}
              </td>
              <td width="128" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=newsletter_subscriber}field_html{/translate}{literal}','html'));
				 </script>
                {/literal}
              </td>
              <!-- LOOP THROUGH EACH RECORD -->
              {foreach from=$newsletter_subscriber item=record}
            <tr id="row{$record.id}" onClick="row_sel('{$record.id}',1);" onDblClick="window.location='?_page=newsletter_subscriber:view&id={$record.id},';" onMouseOver="row_mouseover('{$record.id}', 'row_mouse_over_select', 'row_mouse_over');" onMouseOut="row_mouseout('{$record.id}', '{$record._C}', 'row_select');" class="{$record._C}"> 
              <td align="center" width="34"> 
                <input type="checkbox" name="record{$record.id}" value="{$record.id}" onClick="row_sel('{$record.id}',1,'{$record._C}');">
              </td>
              <td width="117">&nbsp; 
                {$list->date($record.date_orig)}
              </td>
              <td width="155">&nbsp; 
                {$record.newsletter_id}
              </td>
              <td width="170">&nbsp; 
                {$record.email}
              </td>
              <td width="164">&nbsp; 
                {$record.last_name}
                , 
                {$record.first_name}
              </td>
              <td width="128"> &nbsp; 
                {if $record.html == "1"}
                {translate}
                true 
                {/translate}
                {else}
                {translate}
                false 
                {/translate}
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
{if $VAR._print != TRUE}<br>
<center>
<input type="submit" name="Submit" value="{translate}view_edit{/translate}" 	onClick="mass_do('', module+':view', limit, module);" 		class="form_button">
<input type="submit" name="Submit" value="{translate}delete{/translate}" 		onClick="mass_do('delete', module+':search_show&search_id={$search_id}&page={$page}&order_by={$order}&{$sort}', limit, module);" class="form_button">
<input type="submit" name="Submit" value="{translate}select_all{/translate}" 	onClick="all_select(record_arr);" 		class="form_button">
<input type="submit" name="Submit" value="{translate}deselect_all{/translate}" 	onClick="all_deselect(record_arr);" 	class="form_button">
<input type="submit" name="Submit" value="{translate}range_select{/translate}" 	onClick="all_range_select(record_arr,limit);" class="form_button">
<br>
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
        <td valign="middle" align="center"> <a href="#" onClick="NewWindow('ExportWin','toolbar=no,status=no,width=300,height=185','?_page=core:export_search&module=newsletter_subscriber&_escape=1&search_id={$search_id}&page={$page}&order={$order}&sort={$sort}');"><img src="themes/{$THEME_NAME}/images/icons/exp_32.gif" alt="{translate}search_export_image{/translate}" border="0"></a> 
          <a href="?_page=newsletter_subscriber:search_show&_print=true&order_by={$order}&search_id={$search_id}&limit={$limit}&page={$page}"><img src="themes/{$THEME_NAME}/images/icons/print_32.gif" border="0" alt="{translate}search_print_image{/translate}"></a> 
          <a href="?_page=newsletter_subscriber:search_form"><img src="themes/{$THEME_NAME}/images/icons/srch_32.gif" border="0" alt="{translate}search_new_image{/translate}"></a> 
          <a href="?_page=newsletter_subscriber:add"><img src="themes/{$THEME_NAME}/images/icons/add_32.gif" border="0" alt="{translate module=newsletter_subscriber}title_add{/translate}"></a> 
        </td>
  </tr>
</table>
</center>
{/if}
{/if}
</div>
