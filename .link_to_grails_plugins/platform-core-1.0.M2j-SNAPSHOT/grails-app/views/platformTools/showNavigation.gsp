
<html>
    <head>
        <title>Navigation</title>
        <meta name="layout" content="platform/dev"/>
        <style>
        .usernav { float: right; }
        </style>
    </head>
    <body>
        <div class="usernav">
            <p>This is our user navigation</p>
            <nav:menu scope="user"/>
        </div>

        <h1>Navigation</h1>
        
        <p>The current active path is "${nav.activePath().encodeAsHTML()}", which means the active node is ${nav.activeNode()?.id.encodeAsHTML()}</p>

        <p>Show navigation for the active path:</p>
        <g:form action="showNavigation">
            <input name="activePath" value="${params.activePath}" size="80"/>
            <input type="submit"/>
        </g:form>

        <p>First active node for this path is: ${nav.firstActiveNode(path:params.activePath)?.id}</p>
        <p>Primary navigation for this path:</p>
        <nav:primary scope="${nav.scopeForActivationPath(path:params.activePath)}" path="${params.activePath}"/>

        <p>Secondary navigation for this path:</p>
        <nav:secondary path="${params.activePath}"/>

        <p>Breadcrumb for this path:</p>
        <nav:breadcrumb path="${params.activePath}"/>
        
        <p>Breadcrumb for this path with custom render:</p>
        <nav:breadcrumb path="${params.activePath}" custom="true">
            <p:callTag tag="p:smartLink" attrs="${linkArgs}"/>
            <g:if test="${!last}">
                &raquo;
            </g:if>
        </nav:breadcrumb>
        
        <p>Two-deep menu for this path:</p>
        <nav:menu scope="${params.activePath}" path="${params.activePath}" depth="2"/>

        <p>Two-deep menu for this path with custom render:</p>
        <nav:menu scope="${params.activePath}" path="${params.activePath}" custom="true" depth="2">
            Item: <p:callTag tag="p:smartLink" attrs="${linkArgs}"/>
        </nav:menu>

        <p>The available navigation scopes are:
            <ul>
            <g:each in="${navScopes}" var="scope"> 
                <li>${scope.name.encodeAsHTML()}
                <nav:items scope="${scope}" var="item">
                    id: ${item.id.encodeAsHTML()}
                        <g:if test="${item.id == params.activePath}"><strong>ACTIVE</strong></g:if>
                        <br/>
                        name: ${item.name.encodeAsHTML()}<br/>
                        order: ${item.order.encodeAsHTML()}<br/>
                        link args: ${item.linkArgs.encodeAsHTML()} (<p:callTag tag="g:link" attrs="${new HashMap(item.linkArgs)}">Test</p:callTag>)<br/>
                        action aliases: ${item.actionAliases?.encodeAsHTML()}<br/>
                        title: ${item.titleMessageCode.encodeAsHTML()} (<g:message code="${item.titleMessageCode}" encodeAs="HTML"/>)<br/>
                        default title: ${item.titleDefault.encodeAsHTML()}<br/>
                        data: ${item.data.encodeAsHTML()}<br/>
                        visible: ${item.visibleClosure ? 'from Closure' : item.visible}<br/>
                        enabled: ${item.enabledClosure ? 'from Closure' : item.enabled}<br/>
                </nav:items>
                </li>
            </g:each>
            </ul>
        </p>
        
        <footer>
            <p>This is our footer navigation</p>
            <nav:menu scope="footer"/>
        </footer>
    </body>
</html>