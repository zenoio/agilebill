
{ $method->exe("task","view") } { if ($method->result == FALSE) } { $block->display("core:method_error") } {else}

{literal}
	<script src="themes/{/literal}{$THEME_NAME}{literal}/view.js"></script>
    <script language="JavaScript"> 
        var module 		= 'task';
    	var locations 	= '{/literal}{$VAR.module_id}{literal}';		
		var id 			= '{/literal}{$VAR.id}{literal}';
		var ids 		= '{/literal}{$VAR.ids}{literal}';    	 
		var array_id    = id.split(",");
		var array_ids   = ids.split(",");		
		var num=0;
		if(array_id.length > 2) {				 
			document.location = '?_page='+module+':view&id='+array_id[0]+'&ids='+id;				 		
		}else if (array_ids.length > 2) {
			document.write(view_nav_top(array_ids,id,ids));
		}
		
    	function delete_record(id,ids)
    	{				
    		temp = window.confirm("{/literal}{translate}alert_delete{/translate}{literal}");
    		if(temp == false) return;
    		
    		var replace_id = id + ",";
    		ids = ids.replace(replace_id, '');		
    		if(ids == '') {
    			var url = '?_page=core:search&module=' + module + '&do[]=' + module + ':delete&delete_id=' + id + COOKIE_URL;
    			window.location = url;
    			return;
    		} else {
    			var page = 'view&id=' +ids;
    		}		
    		
    		var doit = 'delete';
    		var url = '?_page='+ module +':'+ page +'&do[]=' + module + ':' + doit + '&delete_id=' + id + COOKIE_URL;
    		window.location = url;	
    	}
    //  END -->
    </script>
{/literal}

<!-- Loop through each record -->
{foreach from=$task item=task} <a name="{$task.id}"></a>

<!-- Display the field validation -->
{if $form_validation}
   { $block->display("core:alert_fields") }
{/if}

<!-- Display each record -->
<form name="task_view" method="post" action="">

<table width=100% border="0" cellspacing="0" cellpadding="0" class="table_background">
  <tr>
    <td>
        <table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr valign="top"> 
            <td width="65%" class="table_heading"> 
              <center>
                {translate module=task}
                title_view
                {/translate}
              </center>
            </td>
          </tr>
          <tr valign="top"> 
            <td width="65%" class="row1"> 
              <table width="100%" border="0" cellspacing="3" cellpadding="1" class="row1">
                <tr valign="top"> 
                  <td width="35%">
                    {translate module=task}
                    field_name 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_name" value="{$task.name}"  size="32">
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%">
                    {translate module=task}
                    field_date_last 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    {$list->date_time($task.date_last)}
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%">
                    {translate module=task}
                    field_date_start 
                    {/translate}
                  </td>
                  <td width="65%">
                    { $list->calender_view("task_date_start", $task.date_start, "form_field", $task.id) }
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_date_expire 
                    {/translate}
                  </td>
                  <td width="65%">
                    { $list->calender_view("task_date_expire", $task.date_expire, "form_field", $task.id) }
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_description 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <textarea name="task_description" cols="40" rows="5" >{$task.description}</textarea>
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_type 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <select name="task_type" >
                      <option value="0" {if $task.type == "0"}selected{/if}> 
                      {translate module="task"}
                      type_method 
                      {/translate}
                      </option>
                      <option value="1" {if $task.type == "1"}selected{/if}> 
                      {translate module="task"}
                      type_system 
                      {/translate}
                      </option>
                    </select>
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_command 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_command" value="{$task.command}"  size="32">
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_int_min 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_int_min" value="{$task.int_min}"  size="32">
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_int_hour 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_int_hour" value="{$task.int_hour}"  size="32">
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_int_month_day 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_int_month_day" value="{$task.int_month_day}"  size="32">
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_int_month 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_int_month" value="{$task.int_month}"  size="32">
                  </td>
                </tr>
                <tr valign="top"> 
                  <td width="35%"> 
                    {translate module=task}
                    field_int_week_day 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="task_int_week_day" value="{$task.int_week_day}"  size="32">
                  </td>
                </tr>
                <tr class="row1" valign="middle" align="left"> 
                  <td width="35%"></td>
                  <td width="65%"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td> 
                          <input type="submit" name="Submit" value="{translate}submit{/translate}" class="form_button">
                        </td>
                        <td align="right"> 
                          <input type="button" name="delete" value="{translate}delete{/translate}" class="form_button" onClick="delete_record('{$task.id}','{$VAR.id}');">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr valign="top">
            <td width="65%" class="row1">
              <table width="100%" border="0" cellspacing="0" cellpadding="5" class="row1">
                <tr> 
                  <td width="54%"><a href="?_page=core:search&module=task_log&task_log_task_id={$task.id}&_escape=1&order_by=date_orig&desc="> 
                    </a></td>
                  <td width="46%" align="right"> <a href="?_page=task:view&id={$task.id}&ids={$VAR.ids}&do%5B%5D=task:run">
                    {translate module=task}
                    run 
                    {/translate}
                    </a></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <input type="hidden" name="_page" value="task:view">
    <input type="hidden" name="task_id" value="{$task.id}">
    <input type="hidden" name="do[]" value="task:update">
    <input type="hidden" name="id" value="{$VAR.id}">
  </form>  
  {/foreach}
{/if}
