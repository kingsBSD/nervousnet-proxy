# Nervousnet Proxy

<b> How to run it </b>: <br>
 
<b>Step 1: Install and setup mysql </b><br>
        a. Download mysql http://dev.mysql.com/downloads/mysql/ for your system <br>
        b. Install mysql and run it <br>
        c. Create an account for a user **user** having password **password** <br>
        d. Create a database **db** in which you wish your data to be stored. <br>

<b> Step 2: Configure and run the proxy. </b><br>
        a. Download the entire https://github.com/nervousnet/nervousnet-proxy/tree/master/proxy/proxy/buildapp     folder. <br>
        b. Modify the config.xml file, setting the attributed sqlUsername, sqlPassword, sqlDatabase to **user**, **password** and **db**. <br>
        c. Start the proxy from the console by running *bash proxy-start.sh*
        
 <b>Step 3: Stopping the server </b><br>
        In case you want to stop the server just run *bash proxy-stop.sh* <br>
        

