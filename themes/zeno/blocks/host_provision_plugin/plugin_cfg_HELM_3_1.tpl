{$list->unserial($host_server.provision_plugin_data, "plugin_data")}
 
<table width="100%" border="0" cellspacing="3" cellpadding="1" class="row1">
  <tr valign="top"> 
    <td width="50%"> *Helm Host</td>
    <td width="50%"> 
      <input type="text" name="host_server_provision_plugin_data[host]" value="{$plugin_data.host}" class="form_field" size="30">
      ie: cp.site.com</td>
  </tr>
  <tr valign="top"> 
    <td width="50%"> *Helm Login</td>
    <td width="50%"> 
      <input type="text" name="host_server_provision_plugin_data[user]" value="{$plugin_data.user}" class="form_field">
    </td>
  </tr>
  <tr valign="top"> 
    <td width="50%"> *Helm Password</td>
    <td width="50%"> 
      <input type="password" name="host_server_provision_plugin_data[pass]" value="{$plugin_data.pass}" class="form_field">
    </td>
  </tr>
  <tr valign="top"> 
    <td width="50%"> *Helm Reseller Username (must have hosting plans configured 
      for this reseller)</td>
    <td width="50%"> 
      <input type="text" name="host_server_provision_plugin_data[reseller]" value="{$plugin_data.reseller}" class="form_field">
    </td>
  </tr>
  <tr valign="top">
    <td width="50%">* = required fields</td>
    <td width="50%">&nbsp;</td>
  </tr>
</table>
 