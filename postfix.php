<?php

  //put XML content in a string
  $xmlstr=ob_get_contents();
  ob_end_clean();

  // Load the XML string into a DOMDocument
  $xml = new DOMDocument;
  $xml->loadXML($xmlstr);

  // Make a DOMDocument for the XSL stylesheet
  $xsl = new DOMDocument;

  // See which user agent is connecting
  $UA = getenv('HTTP_USER_AGENT');
  if (ereg("iPhone", $UA) | ereg("Android", $UA) | ereg("Symbian", $UA) | ereg("Opera", $UA) | ereg("Motorola", $UA) | ereg("Nokia", $UA) | ereg("Siemens", $UA) | ereg("Samsung", $UA) | ereg("Ericsson", $UA) | ereg("LG", $UA) | ereg("NEC", $UA) |ereg("SEC", $UA) |ereg("MIDP", $UA) | ereg("Windows CE", $UA)) 
    {
      // if a mobile phone, use a wml stylesheet and set appropriate MIME type
      header("Content-type:text/vnd.wap.wml");
      $xsl->load('index-wml.xsl');
    } 
    /*
    elseif (ereg("X-Smiles", $UA))  
    {
      header("Content-type:text/xml");
      $xsl->load('index-fo.xsl');
    }*/

  else 
    {
      // if not a mobile phone, use a html stylesheet
      header("Content-type:text/html;charset=utf-8");
      $xsl->load('index-html.xsl');
    }

  // Make the transformation and print the result
  $proc = new XSLTProcessor;
  $proc->importStyleSheet($xsl); // attach the xsl rules
  $proc->setParameter('', 'session_name', session_name());
  $proc->setParameter('', 'session_id', session_id());
  echo $proc->transformToXML($xml);
?>
