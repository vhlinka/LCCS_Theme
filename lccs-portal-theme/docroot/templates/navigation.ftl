<nav class="sort-pages modify-pages navbar site-navigation" id="navigation" role="navigation">
	<div class="navbar-inner"> 
		<div class="collapse nav-collapse">
			<ul aria-label="<@liferay.language key="site-pages" />" role="menubar" class="nav nav-collapse yui3-dd-drop">
			
				<li class="lfr-nav-item" id="layout_home" role="presentation">
						<a href="${site_default_url}" role="menuitem"><span>Home</span></a>
				</li>
				<#list nav_items as nav_item>
					<#assign nav_item_attr_has_popup = "" />
					<#assign nav_item_attr_selected = "" />
					<#assign nav_item_css_class = "" />
		
					<#if nav_item.isSelected()>
						<#assign nav_item_attr_has_popup = "aria-haspopup='true'" />
						<#assign nav_item_attr_selected = "aria-selected='true'" />
						<#assign nav_item_css_class = "selected" />
					</#if>
					
					<li ${nav_item_attr_selected} class="${nav_item_css_class} lfr-nav-item" id="layout_${nav_item.getLayoutId()}" role="presentation">
						
					
						<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span>${nav_item.icon()} ${nav_item.getName()}</span></a>
		
						<#if nav_item.hasChildren()>
							<ul class="child-menu dropdown-menu" role="menu">
								<#list nav_item.getChildren() as nav_child>
									<#assign nav_child_attr_selected = "" />
									<#assign nav_child_css_class = "" />
		
									<#if nav_item.isSelected()>
										<#assign nav_child_attr_selected = "aria-selected='true'" />
										<#assign nav_child_css_class = "selected" />
									</#if>
		
									<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
										<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
									</li>
								</#list>
							</ul>
						</#if>
					</li>
				</#list>
				<#if is_signed_in>
					<li ${nav_item_attr_selected} class="${nav_item_css_class} lfr-nav-item" id="layout_last_signout" role="presentation">
							<a aria-labelledby="layout_last_signout" ${nav_item_attr_has_popup} href="/c/portal/logout" role="menuitem"><span>Sign Out</span></a>
					</li>
				</#if>
	</ul>
</nav>

<script>
	Liferay.Data.NAV_LIST_SELECTOR = '.navbar-inner .nav-collapse > ul';
</script>