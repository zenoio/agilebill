
{ $method->exe("tax","search_form") }
{ if ($method->result == FALSE) }
    { $block->display("core:method_error") }
{else}

<form name="tax_search" method="post" action="">
  
<table width=100% border="0" cellspacing="0" cellpadding="0" class="table_background">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr valign="top">
          <td width="65%" class="table_heading">
            <center>
              {translate module=tax}title_search{/translate}
            </center>
          </td>
        </tr>
        <tr valign="top">
          <td width="65%" class="row1">
            <table width="100%" border="0" cellspacing="3" cellpadding="1" class="row1">
                   <tr valign="top">
                    <td width="35%">
                        {translate module=tax}
                            field_country_id
                        {/translate}</td>
                    <td width="65%">
                        { $list->menu("", "tax_country_id", "country", "name", "all", "form_menu") }
                    </td>
                  </tr>
                   <tr valign="top">
                    <td width="35%">
                        {translate module=tax}
                            field_zone
                        {/translate}</td>
                    <td width="65%">
                        <input type="text" name="tax_zone" value="{$VAR.tax_zone}" {if $tax_zone == true}class="form_field_error"{/if}> &nbsp;&nbsp;{translate}search_partial{/translate}
                    </td>
                  </tr>
                   <tr valign="top">
                    <td width="35%">
                        {translate module=tax}
                            field_description
                        {/translate}</td>
                    <td width="65%">
                        <input type="text" name="tax_description" value="{$VAR.tax_description}" {if $tax_description == true}class="form_field_error"{/if}> &nbsp;&nbsp;{translate}search_partial{/translate}
                    </td>
                  </tr>
                   <tr valign="top">
                    <td width="35%">
                        {translate module=tax}
                            field_rate
                        {/translate}</td>
                    <td width="65%">
                        <input type="text" name="tax_rate" value="{$VAR.tax_rate}" {if $tax_rate == true}class="form_field_error"{/if} size="5"> &nbsp;&nbsp;{translate}search_partial{/translate}
                    </td>
                  </tr>
                           <!-- Define the results per page -->
                  <tr class="row1" valign="top">
                    <td width="35%">{translate}search_results_per{/translate}</td>
                    <td width="65%">
                      <input type="text"  name="limit" size="5" value="{$tax_limit}">
                    </td>
                  </tr>

                  <!-- Define the order by field per page -->
                  <tr class="row1" valign="top">
                    <td width="35%">{translate}search_order_by{/translate}</td>
                    <td width="65%">
                      <select  name="order_by">
        		          {foreach from=$tax item=record}
                            <option value="{$record.field}">{$record.translate}</option>
        		          {/foreach}
                      </select>
                    </td>
                  </tr>

                  <tr class="row1" valign="top">
                    <td width="35%"></td>
                    <td width="65%">
                      <input type="submit" name="Submit" value="{translate}search{/translate}" class="form_button">
                      <input type="hidden" name="_page" value="core:search">
                      <input type="hidden" name="_escape" value="Y">
                      <input type="hidden" name="module" value="tax">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
{ $block->display("core:saved_searches") }
{ $block->display("core:recent_searches") }
{/if}
