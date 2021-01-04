<aura:application controller="ComplaintsAppController" extends="force:slds">
    <aura:attribute name="userId" type="String"/>
    <aura:attribute name="userName" type="String" />
    <aura:attribute name="customer" type="Customer__c" />
    
    <aura:handler  name="init" value="{!this}" action="{!c.doinit}"/>
    
    <!--Navbar-->
    <div class="navbar-container">
        <div class="navbar slds-grid slds-grid_align-spread slds-p-around_small">
            <div class="nav-left slds-col">
                <div class="brand"><h3>Complaint App</h3></div>
            </div>
            <div class="nav-right slds-col"> 
                Welcome, {!v.userName}
                <button class="logout-btn" aura:id="logout_btn" onclick="{!c.logout}">Logout</button>
                <button class="register-btn" aura:id="register_btn" onclick="{!c.showRegister}">Register</button>
                <button class="history-btn" aura:id="history_btn">Show History</button>
                <button class="login-btn" aura:id="login_btn" onclick="{!c.showLogin}">Login</button>
            </div>
        </div>
    </div>
	
    
    
    <aura:attribute name="username_value" type="String" />
    <aura:attribute name="email_value" type="String" />
    <aura:attribute name="errorMsg" type="String" />
    <!--Login Form-->
    
    <div class="login-form-container" aura:id="login_form">
        <h1>Login Form</h1>
        <form class="slds-form-element">
            <lightning:input label="Username" type="text" aura:id="text-login-username" placeholder="Enter your Username" required="true" value="{!v.username_value}" />

            <lightning:input type="email" label="Email" aura:id="text-login-email" placeholder="Enter your Email ID" required="true" value="{!v.email_value}" />

          	<lightning:input value="Login" type="submit" aura:id="text-input-submit" onclick="{!c.login}"/>
        </form>
        <h1>{!v.errorMsg}</h1>
    </div>
    
    <!--Register Form-->
    <aura:attribute name="register_fullname" type="String" />
    <aura:attribute name="register_phone" type="String" />
    
    <div class="register_form_container" aura:id="register_form">
        <h1>Register Form</h1>
        <form class="slds-form-element">
            <lightning:input label="Full Name" type="text" aura:id="text-register-fullname" placeholder="Enter your Full Name" required="true" value="{!v.register_fullname}" />
            <lightning:input label="Username" type="text" aura:id="text-register-username" placeholder="Enter your Username" required="true" value="{!v.username_value}" />

            <lightning:input type="email" label="Email" aura:id="text-register-email" placeholder="Enter your Email ID" required="true" value="{!v.email_value}" />
			<lightning:input label="Phone Number" type="text" aura:id="text-register-phone" placeholder="Enter your Phone Number" required="true" value="{!v.register_phone}" />
          	<lightning:input type="submit" value="Register" aura:id="text-input-submit" onclick="{!c.register}"/>
        </form>
        <h1>{!v.errorMsg}</h1>
    </div>

    <!--Complaint Form-->
    <aura:attribute name="title" type="String" />
    <aura:attribute name="description" type="String" />
    <aura:attribute name="severity" type="String" />
    <aura:attribute name="main_category" type="String" />
    <aura:attribute name="sub_category" type="String" />
    
    <div class="complaint_form_container" aura:id="complaint_form">
        <h1>Complaint Form</h1>
        <form>
            <lightning:input label="Complaint Title" type="text" aura:id="text-complaint-title" placeholder="Enter Complaint Title" required="true" value="{!v.title}"/>
            <lightning:textarea label="Complaint Description" type="text" aura:id="text-complaint-title" placeholder="Enter Complaint Title" required="true" value="{!v.description}"/>
            
                        <lightning:select label="Severity" aura:id="severity" value="{!v.severity}">
                            <option value="Low">Low</option>
                            <option value="Medium">Medium</option>
                            <option value="High">High</option>
                        </lightning:select>

                        <lightning:select label="Main Category" aura:id="main_category" required="true" value="{!v.main_category}">
                            <option value="">None</option>
                            <option value="Software">Software</option>
                            <option value="Hardware">Hardware</option>
                            <option value="Whistle Blower">Whistle Blower</option>
                        </lightning:select>
                  
                        <lightning:select label="Sub Category" aura:id="sub_category" required="true" value="{!v.sub_category}">
                            <option value="">None</option>
                            <option value="Outdated OS">Outdated OS</option>
                            <option value="Subscription Ended">Subscription Ended</option>
                            <option value="Pirated Software">Pirated Software</option>
                            <option value="Mouse">Mouse</option>
                            <option value="Keyboard">Keyboard</option>
                            <option value="Monitor">Monitor</option>
                            <option value="Electrcity">Electrcity</option>
                            <option value="Integrity Breach">Integrity Breach</option>
                            <option value="Financial Irregularities">Financial Irregularities</option>
                            <option value="POSH">POSH</option>
                            <option value="Intellectual Property">Intellectual Property</option>
                        </lightning:select>
                             
            <lightning:input type="submit" value="Submit Complaint" aura:id="complaint-submit" onclick="{!c.complaint}"/> 
		</form>
    </div>
    
    
    
    <!--Complaint History-->
    <c:ComplaintForm/>
    
</aura:application>