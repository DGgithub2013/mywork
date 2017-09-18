<!--/DG**************************************************************************
* author: Yellow Pencil (Christopher Sheldon)
* notes:  Copyright (c) Yellow Pencil. All Rights Reserved. 
*         The code contained within this file is not liscensed for public 
*         usage. Do not reproduce or alter this file complete or in part 
*         without the express written permission of the author. 
* 
***************************************************************************/-->
<!--/**************************************************************************
* stylesheet: Google search (Custom and appliance)
* notes:      This styelsheet is used with data from Google Search to allow
*             custom layout and styling of search information.
* 
***/-->
<xsl:stylesheet
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rootca="http://vancouver.ca"
                xmlns:rootuat="http://cmsuat.vancouver.ca"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="rootca rootuat xhtml"
                version="1.0">
  <xsl:output method="xml" omit-xml-declaration="yes" encoding="utf-8" />
  <!-- include highlight.xsl -->
  <xsl:include href="/xsl/cov/highlight.htm" />
  <!-- parameters from C# -->
  <xsl:param name="queryString" />
  <xsl:param name="pageUrl" />
  <!-- variables -->
  <xsl:variable name="q">
    <xsl:choose>
      <xsl:when test="//GSP/PARAM[@name = 'q']">
        <xsl:choose>
          <xsl:when test="contains($queryString, 'as_ft=')">
            <xsl:value-of select="//GSP/PARAM[@name = 'q']/@value" />
          </xsl:when>
          <xsl:when test="contains($queryString, 'as_filetype=aspx')">
            <xsl:value-of select="//GSP/PARAM[@name = 'q']/@value" />
          </xsl:when>
          <xsl:when test="contains($queryString, 'as_filetype=html')">
            <xsl:value-of select="//GSP/PARAM[@name = 'q']/@value" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="//GSP/PARAM[@name = 'q']/@value" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="searchEngine" select="GSA" />
  <xsl:variable name="as_q" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_q='), '&amp;')" />
  <xsl:variable name="as_epq" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_epq='), '&amp;')" />
  <xsl:variable name="as_oq" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_oq='), '&amp;')" />
  <xsl:variable name="as_eq" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_eq='), '&amp;')" />
  <xsl:variable name="ud">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'ud=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'ud='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>1
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:output media-type="text/html"/>
  <xsl:variable name="output" select="text">
    <!-- 
<xsl:choose><xsl:when test="contains($queryString, 'output=')"><xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'output='), '&amp;')" /></xsl:when><xsl:otherwise>xml_no_dtd</xsl:otherwise>
-->
  </xsl:variable>
  <xsl:variable name="oe">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'oe=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'oe='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>UTF-8
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ie">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'ie=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'ie='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>UTF-8
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="client">
    <xsl:choose>
      <xsl:when test="$cx != ''">google-csbe
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="contains($queryString, 'client=')">
            <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'client='), '&amp;')" />
          </xsl:when>
          <xsl:otherwise>default_frontend
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="archivedDate" select="substring-before(substring-after(concat($queryString, '&amp;'), 'ard='), '&amp;')" />
  <xsl:variable name="cx" select="substring-before(substring-after(concat($queryString, '&amp;'), 'cx='), '&amp;')" />
  <xsl:variable name="safe" select="substring-before(substring-after(concat($queryString, '&amp;'), 'safe='), '&amp;')" />
  <xsl:variable name="as_lr" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_lr='), '&amp;')" />
  <xsl:variable name="as_ft" >
    <xsl:choose>
      <xsl:when test="contains($queryString, 'as_ft=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_ft='), '&amp;')"  />
      </xsl:when>
      <xsl:when test="@as_filetype=''">
        <xsl:value-of select="i"  />
      </xsl:when>
      <xsl:when test="@as_ft='aspx'">
        <xsl:value-of select="e"  />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="all"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="as_dt" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_dt='), '&amp;')" />
  <xsl:variable name="as_sitesearch" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_sitesearch='), '&amp;')" />
  <xsl:variable name="as_occt" select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_occt='), '&amp;')" />
  <xsl:variable name="entqr">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'entqr=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'entqr='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>0
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="sort">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'sort=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'sort='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>date:D:L:d1
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="partialfields">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'partialfields=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'partialfields='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="requiredfields">
    <xsl:choose>
      <xsl:when test="contains($queryString, 'requiredfields=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'requiredfields='), '&amp;')" />
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="site" select="substring-before(substring-after(concat($queryString, '&amp;'), 'site='), '&amp;')" />
  <xsl:variable name="advanced">
    <xsl:choose>
      <xsl:when test="contains($queryString, '%3CADVANCED/%3E')">true
      </xsl:when>
      <xsl:otherwise>false
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- DG added as_filetype**************************************************************************-->
  <xsl:variable name="as_filetype" >
    <xsl:choose>
      <xsl:when test="contains($queryString, 'as_filetype=')">
        <xsl:value-of select="substring-before(substring-after(concat($queryString, '&amp;'), 'as_filetype='), '&amp;')"  />
      </xsl:when>
      <xsl:when test="@as_ft='i'">
        <xsl:value-of select="aspx"  />
      </xsl:when>
      <xsl:when test="@as_ft='e'">
        <xsl:value-of select="aspx"  />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="all"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="baseQuery">site=
    <xsl:value-of select="$site" />
    <xsl:if test="$q != ''">&amp;q=
      <xsl:value-of select="$q" />
    </xsl:if>
    <xsl:if test="$as_q != ''">
      <xsl:value-of select="$as_q" />
    </xsl:if>
    <xsl:if test="$as_epq != ''">
      <xsl:value-of select="$as_epq" />
    </xsl:if>
    <xsl:if test="$as_oq != ''">
      <xsl:value-of select="$as_oq" />
    </xsl:if>
    <xsl:if test="$as_eq != ''">
      <xsl:value-of select="$as_eq" />
    </xsl:if>
    <xsl:if test="$as_lr != ''">&amp;as_lr=
      <xsl:value-of select="$as_lr" />
    </xsl:if>
    <xsl:if test="$as_ft != ''">&amp;as_ft=
      <xsl:value-of select="$as_ft" />
    </xsl:if>
    <xsl:if test="$as_filetype != ''">&amp;as_filetype=
      <xsl:value-of select="$as_filetype" />
    </xsl:if>
    <xsl:if test="$as_dt != ''">&amp;as_dt=
      <xsl:value-of select="$as_dt" />
    </xsl:if>
    <xsl:if test="$as_sitesearch != ''">&amp;as_sitesearch=
      <xsl:value-of select="$as_sitesearch" />
    </xsl:if>
    <xsl:if test="$as_occt != ''">&amp;as_occt=
      <xsl:value-of select="$as_occt" />
    </xsl:if>
    <xsl:if test="$partialfields != ''">&amp;partialfields=
      <xsl:value-of select="$partialfields" />
    </xsl:if>
    <xsl:if test="$requiredfields != ''">&amp;requiredfields=
      <xsl:value-of select="$requiredfields" />
    </xsl:if>
    <xsl:if test="$entqr != ''">&amp;entqr=
      <xsl:value-of select="$entqr" />
    </xsl:if>&amp;ud=
    <xsl:value-of select="$ud" />&amp;output=
    <xsl:value-of select="$output" />&amp;oe=
    <xsl:value-of select="$oe" />&amp;ie=
    <xsl:value-of select="$ie" />&amp;client=
    <xsl:value-of select="$client" />&amp;viewed=
    <xsl:value-of select="$ResultsViewed" />&amp;filter=0&amp;searchEngine=GSA
  </xsl:variable>
  <xsl:variable name="StartResults">
    <xsl:choose>
      <xsl:when test="/GSP/PARAM[@name = 'start']">
        <xsl:value-of select="/GSP/PARAM[@name = 'start']/@value" />
      </xsl:when>
      <xsl:otherwise>0
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ResultsPerPage">
    <xsl:choose>
      <xsl:when test="/GSP/PARAM[@name = 'num']">
        <xsl:value-of select="/GSP/PARAM[@name = 'num']/@value" />
      </xsl:when>
      <xsl:otherwise>10
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ResultsViewed">
    <xsl:choose>
      <xsl:when test="/GSP/PARAM[@name = 'viewed']">
        <xsl:value-of select="/GSP/PARAM[@name = 'viewed']/@value + $ResultsPerPage" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$ResultsPerPage" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ResultPages">20
  </xsl:variable>
  <xsl:variable name="TotalResults">
    <xsl:value-of select="/GSP/RES/M" />
  </xsl:variable>
  <xsl:variable name="TotalResultPages" select="ceiling(/GSP/RES/M div $ResultsPerPage)" />
  <!-- *** spelling suggestions *** -->
  <xsl:variable name="show_spelling">1
  </xsl:variable>
  <xsl:variable name="spelling_text">Search instead for
  </xsl:variable>
  <xsl:variable name="spelling_text_color">#cc0000
  </xsl:variable>
  <!--/**************************************************************************
* template: root
* notes:    This template matches the root xml for the site.
* 
***/-->
  <xsl:template match="/">
    <div class="googleSearch">
      <xsl:choose>
        <xsl:when test="$advanced = 'true'">
          <xsl:call-template name="advancedSearch" />
        </xsl:when>
        <xsl:when test="$q = ''">
          <xsl:call-template name="searchAgain" />
        </xsl:when>
        <xsl:when test="/GSP/RES">
          <xsl:call-template name="searchAgain" />
          <xsl:call-template name="searchDetails" />
          <xsl:call-template name="spelling" />
          <xsl:call-template name="searchResults" />
          <xsl:call-template name="searchNavigation" />
        </xsl:when>
        <xsl:when test="/GSP">
          <xsl:call-template name="searchAgain" />
          <p>Your search - 
            <strong>
              <xsl:value-of select="/GSP/Q" />
            </strong> - did not match any documents.
          </p>
          <p>Suggestions:
          </p>
          <ul>
            <li>Make sure all words are spelled correctly.
            </li>
            <li>Try different keywords.
            </li>
            <li>Try more general keywords.
            </li>
          </ul>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>
            <!-- An unexpected result was retrned from Google. -->
          </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
  <!--/**************************************************************************
* template: start
* notes:    This template creates a search form in the page.
* 
***/-->
  <xsl:template name="start">
    <div class="form">
      <form name="gs" method="get" action="{$pageUrl}">
        <label for="q">Search
        </label>
        <input class="query" type="text" name="q" size="32" maxlength="256" value="{$q}" />
        <input class="button" type="submit" name="btnG" value="Google Search" />
        <input type="hidden" name="ud" value="{$ud}" />
        <input type="hidden" name="client" value="{$client}" />
        <input type="hidden" name="oe" value="{$oe}" />
        <input type="hidden" name="ie" value="{$ie}" />
        <input type="hidden" name="filter" value="0" />
        <input type="hidden" name="output" value="{$output}" />
        <input type="hidden" name="searchEngine" value="GSA" />
        <xsl:if test="$cx = ''">
          <input type="hidden" name="entqr" value="{$entqr}" />
          <input type="hidden" name="sort" value="{$sort}" />
          <input type="hidden" name="site" value="{$site}" />
        </xsl:if>
      </form>
    </div>
  </xsl:template>
  <!--/**************************************************************************
* template: searchDetails
* notes:    This template displays details about the search query results.
* 
***/-->
  <xsl:template name="searchDetails">
    <div class="details">
      About 
      <xsl:value-of select="$TotalResults" /> results 
      (
      <xsl:value-of select="format-number(/GSP/TM, '#.##')" /> seconds)
    </div>
  </xsl:template>
  <!--/**************************************************************************
* template: searchResults
* notes:    This template displays the results from the search.
* 
***/-->
  <xsl:template name="searchResults">
    <div class="links">
      <ul>
        <xsl:for-each select="/GSP/RES/R">
          <xsl:choose>
            <xsl:when test="./SL_RESULTS">
              <li class="subscribed">
                <span class="title">
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="./SL_RESULTS/SL_MAIN/U" />
                    </xsl:attribute>
                    <xsl:value-of select="./SL_RESULTS/SL_MAIN/T" disable-output-escaping="yes" />
                  </xsl:element>
                </span>
                <br />
                <xsl:if test="./SL_RESULTS/SL_MAIN/BODY_LINE/BLOCK/T != ''">
                  <span class="text">
                    <xsl:value-of select="./SL_RESULTS/SL_MAIN/BODY_LINE/BLOCK/T" disable-output-escaping="yes" />
                  </span>
                  <br />
                </xsl:if>
                <span class="url">
                  <xsl:value-of select="./SL_RESULTS_SL_MAIN_BODY_LINE/BLOCK/U" />
                </span>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <li>
                <h3>
                  <span class="title">
                    <!--/**************************************************************************
* notes:    Added Jan 2016 to insert archived flag for news and events
***/-->
                    <xsl:if test="./MT[@N = 'nwType']/@V = 'News Releases' and ./MT[@N = 'nwDate']/@V != '' and ./MT[@N = 'nwDate']/@V &lt;= $archivedDate">
                      <span class='isArchived'>Archived
                      </span> - 
                    </xsl:if>
                    <xsl:if test="./MT[@N = 'evType']/@V != '' and ./MT[@N = 'evDate']/@V != '' and ./MT[@N = 'evDate']/@V &lt;= $archivedDate">
                      <span class='isArchived'>Archived
                      </span> - 
                    </xsl:if>
                    <!--/**************************************************************************
* notes:   DG Added July 2017 to allow filtering and showing the file type flag
***/-->
                    <xsl:if test="substring(./U, string-length(./U) - string-length('.pdf') +1) = '.pdf'">
                      <span class='search-result-pdf'>PDF
                      </span> - 
                    </xsl:if>
                    <xsl:if test="substring(./U, string-length(./U) - string-length('.ps') +1) = '.ps'">
                      <span class='search-result-ps'>PS
                      </span> - 
                    </xsl:if>
                    <xsl:if test="substring(./U, string-length(./U) - string-length('.doc') +1) = '.doc'">
                      <span class='search-result-doc'>DOC
                      </span> - 
                    </xsl:if>
                    <xsl:if test="substring(./U, string-length(./U) - string-length('.xls') +1) = '.xls'">
                      <span class='search-result-xls'>XLS
                      </span> - 
                    </xsl:if>
                    <xsl:if test="substring(./U, string-length(./U) - string-length('.ppt') +1) = '.ppt'">
                      <span class='search-result-ppt'>PPT
                      </span> - 
                    </xsl:if>
                    <xsl:if test="substring(./U, string-length(./U) - string-length('.rtf') +1) = '.rtf'">
                      <span class='search-result-rtf'>RTF
                      </span> - 
                    </xsl:if>
                    <!-- end DG Added July 2017 -->
                    <xsl:element name="a">
                      <xsl:attribute name="href">
                        <xsl:value-of select="./U" />
                      </xsl:attribute>
                      <xsl:value-of select="./T" disable-output-escaping="yes" />
                    </xsl:element>
                  </span>
                </h3>
                <span class="url">
                  <xsl:value-of select="./U" />
                </span>
                <br />
                <xsl:if test="./MT[@N = 'description']/@V != '' or ./S != ''">
                  <span class="text">
                    <xsl:choose>
                      <xsl:when test="./MT[@N = 'description']/@V">
                        <xsl:call-template name="highlight">
                          <xsl:with-param name="text" select="./MT[@N = 'description']/@V" />
                          <xsl:with-param name="keywords" select="$q" />
                          <xsl:with-param name="style">font-weight:bold;
                          </xsl:with-param>
                        </xsl:call-template>
                        <!--<xsl:value-of select="./MT[@N = 'description']/@V" disable-output-escaping="yes" />-->
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./S" disable-output-escaping="yes" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </span>
                  <br />
                </xsl:if>
              </li>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>
  <!--/ DG modified for searching by filetype**************************************************************************
* template: root
* notes:    This template matches the root xml for the site.
* 
***/-->
  <xsl:template name="searchAgain">
  <div style="position:relative;bottom:10px;" >
    <div class="searchContainer">			
		
		  <div class="field" id="content">
			  <form name="gs" method="get" >
				<xsl:attribute name="action">
				  <xsl:if test="$as_filetype=aspx">
					<xsl:value-of select="$pageUrl" />
				  </xsl:if>
				</xsl:attribute>
					
				<input id="searchInput" class="query" type="text" name="q" size="32"  value="{$q}" disable-output-escaping="yes" />	
				<br/>
				  <h2>File type
				  </h2>
				  	<br/>
				  <xsl:choose>
					<xsl:when test="$as_filetype = ''">
					  <input class="query rd" name="as_ft"  type="radio" value="" checked="checked"/> ALL  
					</xsl:when>
					<xsl:otherwise>
					  <input class="query rd" name="as_ft"  type="radio" value="" /> ALL  
					</xsl:otherwise>
				  </xsl:choose>
				  <xsl:choose>
					<xsl:when test="$as_ft ='i'">
					  <input class="query rd" name="as_ft"  type="radio" value="i" checked="checked" /> Pages only
					</xsl:when>
					<xsl:otherwise>
					  <input class="query rd" name="as_ft"  type="radio" value="i" /> Pages only
					</xsl:otherwise>
				  </xsl:choose>
				  <xsl:choose>
					<xsl:when test="$as_ft = 'e'">
					  <input  class="query rd" name="as_ft" type="radio"  value="e" checked="checked"/> Documents only
					</xsl:when>
					<xsl:otherwise>
					  <input  class="query rd" name="as_ft"  type="radio" value="e"/> Documents only
				
					</xsl:otherwise>
				  </xsl:choose>
				  <input  name="as_dt"  value= "e" type="hidden" />
			
				  <input  name="as_sitesearch"  value= "http://cmsuat.vancouver.ca/" type="hidden" />
				  <input  name="ouput"  value= "rss" type="hidden" />
				  <input class="query p1" name="as_filetype"  value= "" type="hidden" />
					
				<input type="hidden" name="searchEngine" value="GSA" />
			   
				  <span class="button right">
					<span>
					  <input class="bG" type="submit" name="btnG" value="Search" />						
					</span>
				  </span>					
					
				<script>
				  var rdval;
				  $(document).ready(function () {
					rdval=document.querySelector('input[name="as_ft"]:checked').value;
					$('.rd').click(setRadio);
				  }
								   );
				  $('.bG').click( function(){
					rdval=document.querySelector('input[name="as_ft"]:checked').value;
					// alert('submit pressed 65 ' + rdval+' --  ');
					setRadio();
				  }
								);
				  function setRadio() {
					
					$('.p1').val('');
					if (rdval == "e") {
					  $('.p1').val('aspx');
					  //alert('setRadio' + document.querySelector('input[name="as_ft"]:checked').value);
					}
					else if (rdval == "i") {
					  $('.p1').val('aspx');
					}
					else if (rdval == "all") {
					  $('.p1').val('aspx');
					}
				  }
				</script>	
			  </form>
		</div>
		
	</div>
 </div>
  </xsl:template>
  <!--/**************************************************************************
* template: searchNavigation
* notes:    This template displays the navigation for pages in the search.
* 
***/-->
  <xsl:template name="searchNavigation">
    <div class="navigation">
      <ul>
        <xsl:if test="$StartResults - $ResultsPerPage &gt;= 0">
          <li>
            <xsl:element name="a">
              <xsl:attribute name="href">
                <xsl:value-of select="$pageUrl" />?
                <xsl:value-of select="$baseQuery" />&amp;start=
                <xsl:value-of select="$StartResults - $ResultsPerPage" />
              </xsl:attribute>
              Previous
            </xsl:element>
          </li>
        </xsl:if>
        <xsl:if test="$TotalResultPages &gt; 1">
          <xsl:call-template name="searchNavigationIterate">
            <xsl:with-param name="x" select="1" />
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$StartResults + $ResultsPerPage &lt; $TotalResults and $StartResults + $ResultsPerPage &lt; 1000">
          <li>
            <xsl:element name="a">
              <xsl:attribute name="href">
                <xsl:value-of select="$pageUrl" />?
                <xsl:value-of select="$baseQuery" />
                &amp;start=
                <xsl:value-of select="$StartResults + $ResultsPerPage" />
              </xsl:attribute>
              Next
            </xsl:element>
          </li>
        </xsl:if>
      </ul>
    </div>
  </xsl:template>
  <!--/**************************************************************************
* template: searchNavigationIterate
* notes:    This template iterates the search page control.
* 
***/-->
  <xsl:template name="searchNavigationIterate">
    <xsl:param name="x" />
    <xsl:if test="$TotalResultPages &gt;= $x and $x &lt;= 100">
      <xsl:if test="(($StartResults div $ResultsPerPage) + ($ResultPages div 2) &gt; $x)">
        <xsl:if test="(($StartResults div $ResultsPerPage) - ($ResultPages div 2) &lt; $x)">
          <xsl:choose>
            <xsl:when test="$x = ceiling($StartResults div $ResultsPerPage) + 1">
              <li class="current">
                <xsl:element name="a">
                  <xsl:attribute name="href">
                    <xsl:value-of select="$pageUrl" />?
                    <xsl:value-of select="$baseQuery" />&amp;start=
                    <xsl:value-of select="($x - 1) * $ResultsPerPage" />
                  </xsl:attribute>
                  <strong>
                    <xsl:value-of select="$x" />
                  </strong>
                </xsl:element>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <li>
                <xsl:element name="a">
                  <xsl:attribute name="href">
                    <xsl:value-of select="$pageUrl" />?
                    <xsl:value-of select="$baseQuery" />&amp;start=
                    <xsl:value-of select="($x - 1) * $ResultsPerPage" />
                  </xsl:attribute>
                  <xsl:value-of select="$x" />
                </xsl:element>
              </li>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:call-template name="searchNavigationIterate"
                           xmlns="http://www.w3.org/1999/xhtml">
          <xsl:with-param name="x" select="$x + 1" />
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <!--/**************************************************************************
* template: advancedSearch
* notes:    This template displays the advanced search form.
* 
***/-->
  <xsl:template name="advancedSearch">
    <div class="advancedForm">
      <form name="gs" method="GET" action="{$pageUrl}">
        <div class="keywords">
          <input type="hidden" id="output" name="output" value="{$output}" />
          <input type="hidden" id="ud" name="ud" value="{$ud}" />
          <input type="hidden" id="oe" name="oe" value="{$oe}" />
          <input type="hidden" id="ie" name="ie" value="{$ie}" />
          <input type="hidden" id="site" name="site" value="{$site}" />
          <input type="hidden" name="searchEngine" value="GSA" />
          <div class="field">
            <label for="as_q">with 
              <strong>all
              </strong> of the words
            </label>
            <input id="as_q" name="as_q" type="text" value="{$as_q}" />
          </div>
          <div class="field">
            <label for="as_epq">with the 
              <strong>exact phrase
              </strong>
            </label>
            <input id="as_epq" name="as_epq" type="text" value="{$as_epq}" />
          </div>
          <div class="field">
            <label for="as_oq">with 
              <strong>at least one
              </strong> of the words
            </label>
            <input id="as_oq" name="as_oq" type="text" value="{$as_oq}" />
          </div>
          <div class="field">
            <label for="as_eq">
              <strong>without
              </strong> the words
            </label>
            <input id="as_eq" name="as_eq" type="text" value="{$as_eq}" />
          </div>
        </div>
        <div class="details">
          <div class="field">
            <label for="as_lr">Return pages written in
            </label>
            <select name="lr">
              <option value="">any language
              </option>
              <option value="lang_ar">Arabic
              </option>
              <option value="lang_zh-CN">Chinese (Simplified)
              </option>
              <option value="lang_zh-TW">Chinese (Traditional)
              </option>
              <option value="lang_cs">Czech
              </option>
              <option value="lang_da">Danish
              </option>
              <option value="lang_nl">Dutch
              </option>
              <option value="lang_en">English
              </option>
              <option value="lang_et">Estonian
              </option>
              <option value="lang_fi">Finnish
              </option>
              <option value="lang_fr">French
              </option>
              <option value="lang_de">German
              </option>
              <option value="lang_el">Greek
              </option>
              <option value="lang_iw">Hebrew
              </option>
              <option value="lang_hu">Hungarian
              </option>
              <option value="lang_is">Icelandic
              </option>
              <option value="lang_it">Italian
              </option>
              <option value="lang_ja">Japanese
              </option>
              <option value="lang_ko">Korean
              </option>
              <option value="lang_lv">Latvian
              </option>
              <option value="lang_lt">Lithuanian
              </option>
              <option value="lang_no">Norwegian
              </option>
              <option value="lang_pl">Polish
              </option>
              <option value="lang_pt">Portuguese
              </option>
              <option value="lang_ro">Romanian
              </option>
              <option value="lang_ru">Russian
              </option>
              <option value="lang_es">Spanish
              </option>
              <option value="lang_sv">Swedish
              </option>
            </select>
          </div>
          <div class="field">
            <select name="as_ft">
              <option value="i">Only
              </option>
              <option value="e">Don't
              </option>
            </select>
            <label for="as_filetype">return results of the file format
            </label>
            <select name="as_filetype">
              <option value="" >any format
              </option>
              <option value="pdf">Adobe Acrobat PDF (.pdf)
              </option>
              <option value="ps">Adobe Postscript (.ps)
              </option>
              <option value="doc">Microsoft Word (.doc)
              </option>
              <option value="xls">Microsoft Excel (.xls)
              </option>
              <option value="ppt">Microsoft Powerpoint (.ppt)
              </option>
              <option value="rtf">Rich Text Format (.rtf)
              </option>
            </select>
          </div>
          <div class="field">
            <label for="as_occt">Return result where my terms occur
            </label>
            <select name="as_occt">
              <option value="any" selected="selected">anywhere in the page
              </option>
              <option value="title">in the title of the page
              </option>
              <option value="url">in the URL of the page
              </option>
            </select>
          </div>
          <div class="field">
            <select name="as_ft">
              <option value="i">Only
              </option>
              <option value="e">Don't
              </option>
            </select>
            <label for="as_dt">return results from the site or domain
            </label>
            <input id="as_dt" name="as_dt" type="text" value="{$as_dt}" />
          </div>
          <div class="field">
            <label for="sort">Sort
            </label>
            <select name="sort">
              <option value="">Sort by relevance
              </option>
              <option value="date:D:S:d1">Sort by date
              </option>
            </select>
          </div>
          <input class="button" type="submit" name="btnG" value="Google Search" />
        </div>
      </form>
    </div>
    <script type="text/javascript">
      $( document ).ready(function() {
        dataLayer.push({
          <xsl:choose>
          <xsl:when test="$TotalResults = ''">
          'search results total': '0',
      </xsl:when>
          <xsl:otherwise>
          'search results total': '
          <xsl:value-of select="$TotalResults" />',
      </xsl:otherwise>
      </xsl:choose>
          'search engine': 'GSA',
          'search results page' : '
          <xsl:value-of select="$StartResults div $ResultsPerPage + 1" />',
          'search term': '
          <xsl:value-of select="$q" />',
          'search results viewed': '
          <xsl:value-of select="$ResultsViewed" />',
          <xsl:choose>
          <xsl:when test="$as_ft = 'e'">
          'search filter': 'Documents',
      </xsl:when>
          <xsl:when test="$as_ft = 'i'">
          'search filter': 'Pages',
      </xsl:when>
          <xsl:otherwise>
          'search filter': 'None',
      </xsl:otherwise>
      </xsl:choose>
          'event': 'Display search results'
        }
                      );
      }
                         );
    </script>
  </xsl:template>
  <xsl:template name="spelling">
    <xsl:if test="/GSP/Spelling/Suggestion">
      <div class="spell">
        <h3>
          <xsl:value-of select="$spelling_text"/>
          <xsl:call-template name="nbsp"/>
          <a href="search.aspx?q={/GSP/Spelling/Suggestion[1]/@q}&amp;searchEngine=GSA&amp;btnG=Search" ctype="spell">
            <xsl:value-of select="/GSP/Spelling/Suggestion[1]" disable-output-escaping="yes"/>
          </a>
        </h3>
      </div>
    </xsl:if>
  </xsl:template>
  <xsl:template name="nbsp">
    <xsl:text disable-output-escaping="yes">&amp;
    </xsl:text>nbsp;
  </xsl:template>
</xsl:stylesheet>
