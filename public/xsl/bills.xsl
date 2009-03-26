<?xml version="1.0" encoding="SHIFT_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <xsl:apply-templates select="bills"/>
  </xsl:template>

  <xsl:template match="bills">
    <rows>
      <head>
        <column width="80" type="link" align="left" sort="str">�R�[�h</column>
        <column width="80" type="ed" align="left" sort="str">�ڋq��</column>
        <column width="200" type="ed" align="left" sort="str">����</column>
        <column width="80" type="ed" align="center" sort="date">������</column>
        <column width="80" type="price" align="right" sort="int">�����z</column>
        <column width="150" type="ro" align="center" sort="str">�X�V��</column>
      </head>
      <xsl:apply-templates select="bill"/>
    </rows>
  </xsl:template>

  <xsl:template match="bill">
  <xsl:element name="row">
    <xsl:attribute name="id"><xsl:value-of select="id/text()"/></xsl:attribute>
    <cell><xsl:value-of select="code/text()"/>^/bills/<xsl:value-of select="id/text()"/>^_self</cell>
    <cell><xsl:value-of select="customer-name/text()"/></cell>
    <cell><xsl:value-of select="subject/text()"/></cell>
    <cell><xsl:value-of select="written-on/text()"/></cell>
    <cell><xsl:value-of select="total-amount/text()"/></cell>
    <cell><xsl:value-of select="updated-at/text()"/></cell>
    <cell><xsl:value-of select="bank/text()"/></cell>
    <cell><xsl:value-of select="updated-at/text()"/></cell>
    <cell><xsl:value-of select="created_ad/text()"/></cell>
    <cell><xsl:value-of select="from/text()"/></cell>
    <cell><xsl:value-of select="payment-condition/text()"/></cell>
    <cell><xsl:value-of select="payment-due-data/text()"/></cell>
    <cell><xsl:value-of select="tax/text()"/></cell>
    <cell><xsl:value-of select="description/text()"/></cell>
  </xsl:element>
  </xsl:template>
</xsl:stylesheet>
