<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    
                <script language="c#" runat="server">
                    string pageID = "43735";
                </script>
                <!-- #include virtual="/scripts/cov/ypTransform.aspx" -->
            

        
    <head><!-- PageID 43735 -->
        <title>
            
                        Find out if you are registered to vote
                    
             | City of Vancouver
        </title>

        <link rel="icon" href="/images/cov/ui/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="/images/cov/ui/favicon.ico" type="image/x-icon" /> 
        <link rel="canonical" href="http://cmsuat.vancouver.ca/your-government/are-you-registered-to-vote.aspx" />
        
        
        
        
        
              
        
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="en" />
        <meta http-equiv="content-script-type" content="text/javascript" />
        <meta http-equiv="content-style-type" content="text/css" />
        
        <meta name="description" content="Find out now if you are registered to vote in the upcoming municipal election." />
        <meta name="keywords" content="" />
        <meta name="author" content="City of Vancouver" />
        <meta name="rating" content="general" />
        <meta name="robots" content="index, follow" />
        
        <meta name="published" content="Wed, 13 Sep 2017 15:16:35" />
        <meta name="modified" content="Mon, 31 Jul 2017 11:58:06" />
        <meta name="guid" content="6B44ACF534A74E1799C32985936BEFDD" />
        <meta name="id" content="43735" />
        
        <link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
        <link rel="schema.DCTERMS" href="http://purl.org/dc/terms/" />

        <meta property="og:image" content="http://cmsuat.vancouver.ca/images/cov/feature/elections-facebook-young.jpg" />
        
        <meta property="og:title" content="Are you registered to vote? Find out now" />
        <meta property="og:description" content="Find out now if you are registered to vote in the upcoming municipal election, and learn what you need to do if you are not registered and want to vote." />
        <meta property="og:url" content="http://cmsuat.vancouver.ca/your-government/are-you-registered-to-vote.aspx" />
        
        <meta name="DC.title" content="Are you registered to vote? Find out now" />
        <meta name="DC.description" content="Find out now if you are registered to vote in the upcoming municipal election." />
        <meta name="DC.creator" content="City of Vancouver" />
        <meta name="DC.publisher" content="RedDot CMS" />
        <meta name="DC.rights" content="" />
        <meta name="DC.language" content="en-US" scheme="DCTERMS.RFC4646" />
        <meta name="DC.date" content="Mon, 31 Jul 2017 11:58:06" scheme="DCTERMS.W3CDTF" />
        <meta name="DC.format" content="Text" scheme="DCTERMS.IMT" />
        <meta name="DC.type" content="text/xml" scheme="DCTRERMS.DCMIType" />

        <meta name="WT.cg_n" content="" />
        <meta name="WT.cg_s" content="" />
        
        <link type="text/css" rel="stylesheet" href="/js/cov/simplePagination.css"/>
<!-- JavaScript -->
<script type="text/javascript" src="/js/cov/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/js/cov/jquery.simplePagination.js"></script>
<script type="text/javascript" src="/js/cov/handlebars.js"></script>
        
<!-- Data Layer -->
    <script>
dataLayer = [{
'contentGroup':'2017 By-election'
}];
    </script>
<!-- End Data Layer -->
<!-- Optimizely -->
    <!--script src="//cdn.optimizely.com/js/565901011.js"></script//-->
<!-- End Optimizely -->
<!-- Google Tag Manager -->
    <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-KMLTDN" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-KMLTDN');</script>
<!-- End Google Tag Manager -->

        <link rel="stylesheet" href="/css/cov/layout.css?v201701" />
        <link rel="stylesheet" href="/css/cov/layout-wide.css?v201605" />
        <!--[if lte IE 8]><link rel="stylesheet" href="/css/cov/ieonly.css" /><![endif]-->
        <link rel="stylesheet" media="print" href="/css/cov/print.css" />
        <link rel="stylesheet" href="/css/cov/nivo-slider.css?v201605" />
        <link rel="stylesheet" href="/css/cov/activenet.css" />

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type='text/javascript'>
function checkVoterList() {
var outputDiv = $('#voterListResults');
if ($.trim($("#txtStreetNumber").val()) != '' && $.trim($("#txtStreetName").val()) != '' && $.trim($("#txtFirstName").val()) != '' && $.trim($("#txtLastName").val()) != '')
{
$.ajax(
{
post: 'POST',
contentType: 'application/json; charset=utf-8',
dataType: 'json',
url: '/scripts/cov/getIVLInfo.aspx?t=1&snum=' +
$("#txtStreetNumber").val() + '&sname=' + $("#txtStreetName").val() + '&fname=' + $("#txtFirstName").val() + '&lname=' + $("#txtLastName").val(),
success: function (result) {
var returnItem;
$("#txtStreetNumber").removeClass("errorCode");
$("#txtStreetName").removeClass("errorCode");
$("#txtFirstName").removeClass("errorCode");
$("#txtLastName").removeClass("errorCode");
if (result != null) {
returnItem = "<p><b>";
if (result == "YES")
{
returnItem += "Yes, you are on the voters list.";
dataLayer.push({
'voter_registration_status': 'Registered',
'event': 'Checked for registration'
});
}
else
{
returnItem += "No, you are not on the voters list.";
dataLayer.push({
'voter_registration_status': 'Not Registered',
'event': 'Checked for registration'
});
}
returnItem += "</p></b>";
}
else {
returnItem = "We were unable to find your details.<br/>Please check your address and if you are still having difficulty contact 311";
dataLayer.push({
'election_registration_status': 'ERROR',
'event': 'Checked for registration'
});
}
$("#voterListResults").removeClass("errorWarning");
outputDiv.html(returnItem);
},
error: function () {
//alert('Fail Test Get Dynamic');
outputDiv.html("We were unable to find your details.<br/>Please check your address and if you are still having difficulty contact 311");
dataLayer.push({
'election_registration_status': 'ERROR',
'event': 'Checked for registration'
});
}
});
}
else
{
outputDiv.html("Please complete all required fields and click Submit.");
$("#voterListResults").addClass("errorWarning");
if ($.trim($("#txtStreetName").val()) != '') {
$("#txtStreetName").removeClass("errorCode");
}
else {
$("#txtStreetName").addClass("errorCode");
$("#txtStreetName").focus();
}
if ($.trim($("#txtStreetNumber").val()) != '') {
$("#txtStreetNumber").removeClass("errorCode");
}
else {
$("#txtStreetNumber").addClass("errorCode");
$("#txtStreetNumber").focus();
}
if ($.trim($("#txtFirstName").val()) != '') {
$("#txtFirstName").removeClass("errorCode");
}
else {
$("#txtFirstName").addClass("errorCode");
$("#txtFirstName").focus();
}
if ($.trim($("#txtLastName").val()) != '') {
$("#txtLastName").removeClass("errorCode");
}
else {
$("#txtLastName").addClass("errorCode");
$("#txtLastName").focus();
}
}
return false;
}
function formReset() {
$('#txtStreetNumber').val("");
$("#txtStreetNumber").removeClass("errorCode");
$('#txtStreetName').val("");
$("#txtStreetName").removeClass("errorCode");
$('#txtFirstName').val("");
$("#txtFirstName").removeClass("errorCode");
$('#txtLastName').val("");
$("#txtLastName").removeClass("errorCode");
$("#voterListResults").removeClass("errorWarning");
$('#voterListResults').html("");
$("#txtStreetNumber").focus();
}
</script>
<script type='text/javascript'>
function SearchSuggest() {
var o_name;
var selected_row = -1;
var number_rows = 0;
var max_rows = 20;
var qs_name;
var path = '/scripts/cov/';
var $suggest_container;
var $error_container;
var $textbox;
var request;
this.init = function (name, tb_id, err_id, div_id, qs) {
if (window.XMLHttpRequest) {
request = new XMLHttpRequest();
} else if (window.ActiveXObject) {
request = new ActiveXObject("Microsoft.XMLHTTP");
} else {
alert("Your browser does not support advanced functionality of this site. Please upgrade your browser or contact DataFix for assistance.");
}
o_name = name;
$textbox = $("#" + tb_id);
$error_container = $("#" + err_id);
$suggest_container = $("#" + div_id);
qs_name = qs;
};
this.hide = function () {
if ($suggest_container) {
$suggest_container.html('');
$suggest_container.css('visibility', 'hidden');
}
};
this.show = function () {
if ($suggest_container) {
$suggest_container.css('visibility', 'visible');
}
};
this.suggest = function (e) {
var kc = e.keyCode || window.event.keyCode;
$error_container.css('display', 'none');
if (kc == 40) {
this.moveIndexUp();
return;
} else if (kc == 38) {
this.moveIndexDown();
return;
}
selected_row = -1;
if (request.readyState == 4 || request.readyState == 0) {
var str = $textbox.val();
str = str.replace('<', '').replace('>', '');
str = escape(str);
window.suggest_ref = this;
request.open("GET", path + 'getIVLInfo.aspx?str=' + str, true);
request.onreadystatechange = this.handleResponse;
request.send(null);
}
};
this.handleResponse = function () {
var s = window.suggest_ref;
if (request.readyState == 4) {
$suggest_container.html('');
number_rows = 0;
var str = request.responseText.split("|");
str[str.length - 1] = str[str.length - 1].substr(0, str[str.length - 1].indexOf("<"));
var i;
for (i = 0; i < str.length; i++) {
if (str[i].length < 50) {
var div = $(document.createElement('div'));
div.attr('class', 'suggest_link');
div.attr('id', 'suggest' + i);
div.html(str[i]);
div.click(function () { s.setSearch($(this).html()); }); // click has to be declared first, as ie7 won't fire it otherwise
div.mouseover(function () { s.suggestOver($(this)); });
div.mouseout(function () { s.suggestOut($(this)); });
$suggest_container.append(div);
number_rows++;
}
}
if (number_rows > max_rows) {
number_rows = max_rows;
}
if ($suggest_container.html() == '') {
s.hide();
} else {
s.show();
}
}
};
this.suggestOver = function (div) {
$(div).attr('class', 'suggest_link_over');
};
this.suggestOut = function (div) {
$(div).attr('class', 'suggest_link');
};
this.setSearch = function (val) {
val = val.replace(/\&amp;/g, '&');
$textbox.val(val);
$suggest_container.html('');
this.hide();
return false;
};
this.handleEnter = function (e) {
var kc = e.keyCode || window.event.keyCode;
if (kc == 13) {
this.hide();
return false;
}
};
this.updateText = function () {
if ($("#suggest" + selected_row)) {
$("#suggest" + selected_row).attr('class', 'suggest_link_over');
$textbox.val($("#suggest" + selected_row).html());
}
};
this.moveIndexDown = function () {
if ($("#suggest" + selected_row)) {
$("#suggest" + selected_row).attr('class', 'suggest_link');
}
if (selected_row > 0) {
selected_row--;
}
this.updateText();
};
this.moveIndexUp = function () {
if ($("#suggest" + selected_row)) {
$("#suggest" + selected_row).attr('class', 'suggest_link');
}
if ((selected_row < number_rows - 1) && ($("#suggest" + (selected_row + 1)))) {
selected_row++;
}
this.updateText();
};
};
</script>
<style>
.resultBox, .resultBox2, .resultBox3
{
float: left;
display: inline;
margin-left: 30px;
padding-left: 10px;
padding-right: 10px;
border-top: 1px solid #000000;
border-left: 1px solid #000000;
border-right: 2px solid #000000;
border-bottom: 2px solid #000000;
}
.resultBox
{
width: 220px;
}
.resultBox2
{
width: 560px;
color: #000000;
margin-top: 60px;
}
.resultBox3
{
width: 420px;
margin-bottom: 16px;
}
.captchaLink
{
font-size: 10pt;
color: #848484;
}
.mapLink
{
color: #848484 !important;
}
img
{
border: 0px;
}
.suggest
{
border:solid 1px #dedede;
display:block;
background-color: #ffffAA;
text-align: left;
visibility: hidden;
position:absolute;
z-index:220;
width: 145px;
max-height: 70px;
overflow: auto;
left: 0px;
margin-left: 40.5%;
margin-top: 3.5%;
}
.suggest_link
{
padding-right: 6px;
padding-left: 6px;
padding-bottom: 1px;
padding-top: 1px;
background-color: #FFFFEE;
z-index:20;
cursor:pointer;
line-height: 1em;
}
.suggest_link_over
{
padding-right: 6px;
padding-left: 6px;
padding-bottom: 0px;
cursor: hand;
padding-top: 0px;
background-color: #dedede;
color: #000000;
z-index: 20;
cursor:pointer;
}
.Address {
width: 60px;
float: left;
}
.StreetNum
{
height: 40px;
padding-left: 3px;
padding-right: 3px;
width: 70px;
float: left;
text-align: center;
}
.StreetNum input
{
width: 60px;
display: block;
margin : 0 auto;
}
.StreetName
{
padding-right: 5px;
float: left;
text-align: center;
width: 120px;
}
.StreetName input
{
float: left;
}
.medtext {
font-size: 0.8em;
}
.locationInfo
{
line-height: normal;
}
/*.seperator
{
width: 60px;
float: left;
text-align: center;
height: 40px;
}*/
#lblPostalCode
{
width: px;
float: left;
}
#txtPostalCode
{
margin-left: 8px;
}
.postalCodeDiv
{
height: 40px;
}
.electionTextbox
{
width: 120px;
}
.electionLabel
{
float: left;
width: 100px;
}
.errorCode
{
border: 1px red solid;
}
.errorWarning
{
color: Red;
}
#voterListResults
{
color: Red;
font-size: 1.3em;
padding-top: 1em;
}
@media screen and (max-width: 640px) {
/* set the block width to expand to the window width */
.Address, .StreetNum, .StreetName, .Firstname, .Lastname {
width: 100%;
text-align: left;
padding-left: 0;
}
/* position labels to the left instead of top */
body .StreetNum label,
body .StreetName label {
width: 20%; min-width: 4em;
float: left;
}
body .StreetNum label .medtext,
body .StreetName label .medtext {
font-size: 1em;
}
/* inputs float beside the labels */
body .StreetNum input, body .StreetName input {
margin-left: 0;
}
/* remove line breaks in the HTML */
.StreetNum br, .StreetName br {
display: none;
}
.suggest
{
margin-left: 19.5%;
margin-top: 4.5%;
}
/* fix street field wrapping when line break is removed */
.AddressExample {
display: block;
}
/* structural formatting improves readability and UX */
.Address {
margin-bottom: 1em;
}
.Address label {
font-weight: bold;
}
}
@media screen and (max-width: 380px) {
.suggest
{
margin-left: 21%;
margin-top: 7%;
}
}
</style>
        <script type="text/javascript" src="/js/cov/common.js"></script>
        <script type="text/javascript" src="/js/cov/tweener.js"></script>
        <script type="text/javascript" src="/js/cov/mediaGallery.js"></script>
        <script type="text/javascript" src="/js/cov/ypGoogleMap.js"></script>
        <script type="text/javascript" src="/js/cov/jquery.nivo.slider.js"></script>
        <script type="text/javascript" src="/js/cov/addThis.js"></script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50918dcc6f6bf65d"></script>        

        <!-- Widgets CSS/JS -->
        <link rel="stylesheet" href="/css/cov/widgets.css?v201605" />
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="/js/cov/jquery.event.move.js"></script>
        <script type="text/javascript" src="/js/cov/widgets.js"></script>
        <script type="text/javascript" src="/js/cov/fusioncharts.js"></script>
        <script type="text/javascript" src="/js/cov/fusioncharts.theme.js"></script>

        
<%
// Prevent Lagan-IE7 from loading responsive scripts
if ( Request.UserAgent.IndexOf("MSIE 7") < 0 ) { 
%>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="/css/cov/responsive.css?v201605" />
        <script type="text/javascript" src="/js/cov/responsive.js"></script>
<%
}
%>
                
    </head>
    <body class="content p6B44ACF534A74E1799C32985936BEFDD  showHelp">
        
        
        
        
           
     
        
        
        <div id="doc">
            <div id="doc2" class="contentWide">
                <!--googleoff: all-->
                <div id="header">
                    <a id="logo" href="/default.aspx"><img src="/images/cov/ui/covLogo.png" alt="City Of Vancouver" title="City of Vancouver home" /></a>
                   
<a id="neighbourhoodsDropDown" href="/news-calendar/10989.aspx" class="lnkDropdown" style="display:none;">Areas of the city</a>

<div class="tools">
    <div id="howdoi">
    	<a id="howdoiheading" class="heading">How to ... <i class="fa fa-lg fa-angle-down"></i></a>
    </div>
    <div id="search">
	    <form class="header-searchbox searchbox-open" method="get" action="//cmsuat.vancouver.ca/search.aspx">
		<label for="header-site-search" class="hidden">Site Search:</label>
		<input id="header-site-search" type="search" placeholder="Search......" name="q" class="header-searchbox-input" onkeyup="headerSearchButtonUp();" required>
		<input type="submit" class="searchbox-submit" value="Go">
		<input type="hidden" id="searchEngine" name="searchEngine" value="GSA" />
		<span title="Search" class="header-searchbox-icon"><i class="fa fa-search"></i></span>
	    </form>
	</div>
	<a href="/your-government/contact-the-city-of-vancouver.aspx" rel="nofollow"><div id="phone"><i class="fa fa-phone"></i> 3-1-1</div></a>
	<a href="/online-services.aspx" rel="nofollow" style="display: none;"><div id="apps"><i class="fa fa-cloud-download"></i> Apps</div></a>
</div>

<script type="text/javascript">
    function SetBackImage(SectionGuid)
    {
        if(SectionGuid == '')
        {
            SectionGuid = 'Default';
        }
        var BackGroundImages = $('#background-image-data .' + SectionGuid);
        var NumberofBackgrounds = $(BackGroundImages).length;
        if(NumberofBackgrounds == 0)
        {
            BackGroundImages = $('#background-image-data .' + SectionGuid);
            NumberofBackgrounds = $(BackGroundImages).length;
        }
        var BackGroundImage = $(BackGroundImages).filter(':eq(' + Math.floor((Math.random()*NumberofBackgrounds)) + ')').text();
        //$('body').css('background-image', 'url(' + BackGroundImage + ')');  

        SetBodyClass(SectionGuid);
    }
    
    function SetBodyClass(SectionGuid)
    {
        $('body').addClass('s' + SectionGuid);
    }

    function InheritFromLinkInBreadCrumb(BreadcrumbLinkPosition, SourceAndTargetDomId)
    {
        if(BreadcrumbLinkPosition == null)
            return;

        var BreadcrumbLinkObject = $('.crumbNav a:eq(' + (BreadcrumbLinkPosition-1) + ')');

        if($(BreadcrumbLinkObject).length > 0)
        {
            
            var BreadcrumbLink = $(BreadcrumbLinkObject).attr('href');
            $.get(BreadcrumbLink , function(data) {
                $('#' + SourceAndTargetDomId).append($(data).find('#' + SourceAndTargetDomId));
            });
            
            
            
        }
    }
</script>
                    <script type="text/javascript">
                        SetBackImage('5785640C8B3C4775A3C50AC844695609');
                    </script>
                    <ul id="topNav">
                        <li id="s66ED949F063F4F5186AA9B8C51ECF602" class="isParent notSelected s66ED949F063F4F5186AA9B8C51ECF602"><a href="/green-vancouver.aspx">Green Vancouver</a></li><li id="s5785640C8B3C4775A3C50AC844695609" class="isParent isSelected s5785640C8B3C4775A3C50AC844695609"><a href="/your-government.aspx">Your government</a></li><li id="s40817C78182C4DF6A38920F36FFA0369" class="isParent notSelected s40817C78182C4DF6A38920F36FFA0369"><a href="/about-vancouver.aspx">About Vancouver</a></li><li id="s3D48BA295D9A4E8FAE0F95755D65318D" class="isParent notSelected s3D48BA295D9A4E8FAE0F95755D65318D"><a href="/parks-recreation-culture.aspx">Parks, recreation, and culture</a></li><li id="s95C37A60D9EF4577B6E4DAFDE81CD315" class="isParent notSelected s95C37A60D9EF4577B6E4DAFDE81CD315"><a href="/home-property-development.aspx">Home, property, and development</a></li><li id="sC2B4C2DC13D8429385393D092BE31D4A" class="isParent notSelected sC2B4C2DC13D8429385393D092BE31D4A"><a href="/people-programs.aspx">People and programs</a></li><li id="s1B48E3BC89AD4680B2E902C48640C64A" class="isParent notSelected s1B48E3BC89AD4680B2E902C48640C64A"><a href="/streets-transportation.aspx">Streets and transportation</a></li><li id="s83B05EAE7905419981E4FC0BE75FA7D8" class="isParent notSelected s83B05EAE7905419981E4FC0BE75FA7D8"><a href="/doing-business.aspx">Doing business</a></li>
                    </ul>
                    <p id="cov-cta"><a href="/your-government/contact-the-city-of-vancouver.aspx" rel="nofollow">&nbsp;</a></p>
                </div>
                <div class="crumbNav">
                    <a href="/default.aspx">Home</a>&nbsp;&gt;&nbsp;<a href="/your-government.aspx">Your government</a>&nbsp;&gt;&nbsp;<a href="/your-government/civic-elections.aspx">Municipal elections</a>&nbsp;&gt;&nbsp;<a href="/your-government/2017-by-election.aspx">2017 by-election</a>&nbsp;&gt;&nbsp;<a href="/your-government/information-for-voters.aspx">Information for voters</a>&nbsp;&gt;&nbsp;Are you registered to vote?
                </div>
                <div id="leftRail">
                    <a class="topmenulink" href="/your-government.aspx"><h2>Your government</h2></a>
<ul>
    <li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/vancouver-city-council.aspx">Vancouver City Council</a></li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/vancouver-board-of-parks-and-recreation.aspx">Vancouver Board of Parks and Recreation</a></li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/citizen-involvement.aspx">Citizen involvement</a></li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/get-government-information.aspx">Get government information</a></li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/city-operations.aspx">City Hall operations and policies</a></li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/municipal-agencies.aspx">City boards and agencies</a></li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/work-for-the-city-of-vancouver.aspx">Jobs and careers</a></li><li class="
isParent isSelected 
"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/civic-elections.aspx">Municipal elections</a>
    
                <ul>
                    <li class="
isParent isSelected 
"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/2017-by-election.aspx">2017 by-election</a>
    
                <ul>
                    <li class="
isParent isSelected 
"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/information-for-voters.aspx">Information for voters</a>
    
                <ul>
                    <li class="
isLast isCurrent 
"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/are-you-registered-to-vote.aspx">Are you registered to vote?</a>
    
</li><li class="
isLast 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/voting-locations-map-and-hours.aspx">Voting locations map and hours</a></li>
                </ul>
            
</li><li class="
isLast 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/by-election-employment-opportunities.aspx">By-election employment opportunities</a></li>
                </ul>
            
</li><li class="
isParent 
notSelected"><a href="#" onclick="window.location = $(this).next().attr('href');"><div></div></a><a class="menulink" href="/your-government/previous-elections.aspx">Previous elections</a></li>
                </ul>
            
</li>
</ul>
                </div>
                <!--googleon: all-->
                <div id="contentContainer">
                    <div id="content">
                        <div id="addThisDiv">
                            <div class="addthis_toolbox addthis_default_style ">
                                <a class="addthis_button_print"></a>
                                <a class="addthis_button_email"></a>
                                <a class="addthis_button_facebook"></a>
                                <a class="addthis_button_twitter"></a>
                                <a class="addthis_button_compact" title="More sharing services"></a>
                            </div>
                        </div>

                        
                        
                        
                        
                                        
                                    

                        
                        

                        
                        <h1>Are you registered to vote? Find out now</h1>
                        
                        

                        

                        
                        <div class="imgallpadding">
                            
        <p>Before you can vote, you must be registered. Enter your name and address below to find out if you are registered. </p>
        <p>Please enter information in all fields, and follow these formats when you enter your street name:</p>
        <ul>
            <li>24th Ave W </li>
            <li>Broadway W </li>
            <li>Willow St </li>
        </ul>
                            
                        </div>
                    </div>
                    
                    <div class="modContainer">
                        
                        <div class="">
    
    <div style="padding-top: 10px;">
<div class="LastName">
<span id="lblLastName"class="electionLabel">Last Name:</span>
<input id="txtLastName" maxlength="30" class="electionTextbox"/>
</div>
<br/>
<div style="clear:both;"></div>
<div class="Firstname">
<span id="lblFirstName" class="electionLabel">First Name:</span>
<input id="txtFirstName" maxlength="30" class="electionTextbox"/>
</div>
<br/>
<div style="clear:both;"></div>
<div class="Address">
<br />
Address:
</div>
<div class="StreetNum">
<label id="lblProposedMeetingUnit"><span class="medtext">Unit</span></label>
<input id="txtUnitNumber" maxlength="5" />
</div>
<div class="StreetNum">
<label id="lblProposedMeetingDt"><span class="medtext">Number</span></label>
<input id="txtStreetNumber" maxlength="9" />
</div>
<div class="StreetName">
<label id="lblStreet"><span class="medtext">Street</span></label>
<div>
<input id="txtStreetName" maxlength="40" onkeyup="streetSuggest.suggest(event);" />
<span id="streetSuggest" class="suggest"></span>
<script type="text/javascript">
var streetSuggest = new SearchSuggest();
streetSuggest.init('streetSuggest', 'txtStreetName', 'tdErr', 'streetSuggest', 'street');
</script>
</div>
<br />
</div>
<div style="clear:both;"></div>
<div>
<br/>
<span class="button" style="float:left;padding-right:10px;"><input type="button" value="Submit" onclick="checkVoterList();return false;" id="btnSubmit" /></span>
<span class="button" style="float:left"><input type="button" value="Reset" onclick="formReset();return false;" id="btnReset" /></span>
<div style="clear:both;"></div>
</div>
</div>
<div id="voterListResults"></div>
</div><div id="basicBox43755" class="unstyledTextBlock  " >
    

     
    
        <h2>What to do if you are not registered to vote</h2>
        <p>Register in person on election day, November 15. </p>
        <p>You will need to bring two identification documents with you that show who you are and where you live. One of these two identification documents must include your signature.</p>
        <ul>
            <li>See the list of acceptable identification documents  </li>
        </ul>
    
</div><div id="basicBox43756" class="unstyledTextBlock  " >
    

     
    
        <p style="display: none;"><img alt="" src="/images/cov/icons/advancepoll.jpg" /><img alt="" src="/images/cov/icons/wheelchair.jpg" /></p>
        <p style="display: none;" id="loadingImageDiv"><img alt="" src="/images/cov/icons/loading.gif" /></p>
    
</div>
                    </div>
                    
                 </div>

                <!--googleoff: all-->
                

<div id="footer" class="row fullWidth">
    <div class="row top">
        <div>
            <div>
        		<a href="/online-services.aspx">
        			<img src="/images/cov/ui/footer-phone.jpg" class="pull-left phone" alt="Download our helpful apps" title="Download our helpful apps">
        		</a>
    		</div>
    		<div>
    			<p class="apps-download">
    				<a href="/online-services.aspx">
    					<b>Download our helpful apps</b>
    				</a><br/>
    				Stay connected with us 24/7
    			</p>
                <p class="footer-311"><span><i class="fa fa-phone"></i> 3-1-1</span></p>
                <p class="footer-311"><span><i class="fa fa-phone"></i> 604-873-7000</span></p>
    		</div>
        </div>
        <div>
            <span class="footer-address">
                <p><strong>City Hall</strong><br />
453 West 12th Ave<br />
                Vancouver, BC<br/>V5Y 1V4
            </p>
                        <p class="footer-map-link"><a target="_blank" href="https://vancouver.ca/map.aspx?q=453+West+12th+Ave,+Vancouver,+BC+V5K+1V4,+Canada">View Map</a></p>
            </span>
            <span class="footer-map"><a data-mobile-link="https://vancouver.ca/map.aspx?q=453+West+12th+Ave,+Vancouver,+BC+V5K+1V4,+Canada" href="/your-government/getting-to-city-hall.aspx"><img alt="City Hall is located on the corner of Cambie Street and West 12th Avenue." title="City Hall is located on the corner of Cambie Street and West 12th Avenue." class="footer-map-img" src="/images/cov/ui/map-city-hall-homepage.jpg" /></a></span>
        </div>
        <div>
            <p class="footer-social-media">
                <a href="https://www.facebook.com/CityofVancouver" class="fa-stack fa-lg" title="Facebook" target="_blank">
                <i class="fa fa-facebook-square fa-stack-2x fa-inverse"></i>
                </a>
                <a href="https://twitter.com/CityofVancouver" class="fa-stack fa-lg" title="Twitter" target="_blank">
                <i class="fa fa-twitter-square fa-stack-2x fa-inverse"></i>
                </a>
                <a href="https://youtube.com/CityofVancouver" class="fa-stack fa-lg" title="YouTube" target="_blank">
                <i class="fa fa-youtube-square fa-stack-2x fa-inverse"></i>
                </a>
                <a href="https://www.flickr.com/photos/cityofvancouver/sets/" class="fa-stack fa-lg" title="flickr" target="_blank">
                <i class="fa fa-flickr fa-stack-2x fa-inverse"></i>
                </a>
                <a href="https://instagram.com/cityofvancouver" class="fa-stack fa-lg" title="Instagram" target="_blank">
                <i class="fa fa-instagram fa-stack-2x fa-inverse"></i>
                </a>
                <a href="https://www.linkedin.com/company/city-of-vancouver" class="fa-stack fa-lg" title="LinkedIn" target="_blank">
                <i class="fa fa-linkedin-square fa-stack-2x fa-inverse"></i>
                </a>
            </p>
            <p><a href="/your-government/follow-the-city-on-social-media.aspx">More ways to follow us</a></p>

<p><a href="/your-government/tell-us-online.aspx">Contact the City of Vancouver</a></p>

<p><a href="http://jobs.vancouver.ca" target="_blank">Find and apply for a job</a></p>
        </div>
    </div>
    <div class="row seperator"><hr /></div>
	<div class="row top clearfix footerMiddle">
        <div>
    		<p><a href="/your-government/vancouver-board-of-parks-and-recreation.aspx" title="Vancouver Board of Parks and Recreation">Vancouver Board of Parks and Recreation</a></p>

<p><a href="http://vancouver.ca/police/" target="_blank" title="Vancouver Police Department">Vancouver Police Department</a></p>
        </div>
        <div>
            <p><a href="/your-government/vancouver-fire-and-rescue-services.aspx" title="Vancouver Fire and Rescue Services">Vancouver Fire and Rescue Services</a></p>

<p><a href="http://www.vpl.ca" target="_blank" title="Vancouver Public Library">Vancouver Public Library</a></p>
        </div>
        <div>
    		<p>
        		<a href="/">
        			<img class="cov-logo" src="/images/cov/ui/citylogo.png" alt="City of Vancouver" title="City of Vancouver">
        		</a>
    		</p>
        </div>
	</div>
    <div class="row seperator"><hr /></div>
    <div class="row bottom clearfix">
        <div class="lookingfor">
            <p><a href="/your-government/terms-of-use.aspx">Terms of Use</a><a href="/your-government/privacy-policy.aspx">Privacy policy</a><a href="/your-government/website-accessibility.aspx">Website accessibility</a></p>
        </div>
        <div class="copyright" style="align-self:flex-end;">
            <p><span>&copy; 2017 City of Vancouver</span></p>
        </div>
    </div>
</div>

<script type="text/javascript">
  $("#footer .bottom .copyright .footer-right-seperaor").last().hide();
</script>
 
                <!--googleon: all-->
            </div>
            <div class="ieShadow"></div>
        </div>
        
        
                    <script type="text/javascript" src="/js/cov/mainDropDown2015.js"></script>
                    <script type="text/javascript" src="/js/cov/ypMenu.js"></script>
                
        
        <!-- subnav items -->
        <div style="display:none;">
            
        </div>
        
        <!--googleoff: all-->
        

        <!--googleon: all-->
    </body>
    
</html>