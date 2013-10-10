<?xml version='1.0' encoding='utf-8'?>
<!-- ===================== -->
<!-- name: isodate-long    -->
<!-- value: string         -->
<!-- ===================== -->

<!-- converts an ISO date string to a "prettier" format -->

<!-- read: -->
<!-- $isodate [param] -->
<!-- $language-code -->

<!-- set: -->
<!-- $date_string -->

<!-- functions: -->
<!-- number(), substring(), contains() [Xpath 1.0] -->
<!-- util:get_month_date() [local] -->

<!-- called: -->
<!-- isodate-month -->

<xsl:template name="isodate-long"
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <!-- ====== -->
  <!-- params -->
  <!-- ====== -->
  <xsl:param name="isodate" select="'2000-01-01'"/>

  <!-- ========= -->
  <!-- variables -->
  <!-- ========= -->

  <!-- get date in relevant format -->
  <xsl:variable name="date_string"> 
    <xsl:choose>

      <!-- european format -->
      <xsl:when test="contains('fr es', $language-code)">
        <xsl:value-of select="number(substring($isodate, 9, 2))"/>
        <xsl:text> </xsl:text>
        <!-- <xsl:value-of select="$month" /> -->
        <xsl:value-of select="util:get_month_name($report-date)" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring($isodate, 1, 4)"/>
      </xsl:when>

      <!-- japanese format -->
      <xsl:when test="contains('ja', $language-code)">
        <xsl:value-of select="$isodate"/>
      </xsl:when>

      <!-- english format -->
      <xsl:otherwise>
        <!-- <xsl:value-of select="$month"/> -->
        <xsl:value-of select="util:get_month_name($report-date)" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="number(substring($isodate, 9, 2))"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="substring($isodate, 1, 4)"/>
      </xsl:otherwise>

    </xsl:choose>
  </xsl:variable>

  <!-- ======= -->
  <!-- content -->
  <!-- ======= -->
  <xsl:value-of select="$date_string" />

</xsl:template>
