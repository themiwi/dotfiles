function FindProxyForURL(url,host)
{
  // in ANDRITZ
  if (dnsResolve("krssms107") != null)
  // direkt erreichbare Adressen
  if (shExpMatch(url,"http://www.andritz.com/*"))
  { return "PROXY 10.5.0.52:8080"; }

  if (shExpMatch(url,"http://home.andritz.com/*") || shExpMatch(url,"*.iserv.vads.cc/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://*.andritz.com/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://pronet.vads.cc/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://localhost:*/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://127.0.0.1:*/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://localhost:*/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://127.0.0.1:*/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://10.1.115.*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://10.1.196.*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"http://krssms120.andritz.com:8080/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://www.lukb.ch/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://*.live.com/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://*.live.net/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://vmview01.ckw.ch/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://195.225.61.99/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://remoteaccess.ckw.ch/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://optidata.ch/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://netfile.ckw.ch/*"))
  { return "DIRECT"; }

  if (shExpMatch(url,"https://z3k-host-sts.softec.ch/*"))
  { return "DIRECT"; }


//  if(isPlainHostName(host))
//  { return "DIRECT"; }
  
  if(isInNet(host,"143.161.248.0","255.255.255.0"))
  { return "PROXY 10.5.0.52:8080"; }

  if(isInNet(host, "143.161.0.0", "255.255.0.0") || isInNet(host, "10.0.0.0", "255.0.0.0") || isInNet(host, "172.16.0.0", "255.240.0.0"))
  { return "DIRECT"; }

  return "PROXY 10.5.0.52:8080";
  }
  else
  {
    return "DIRECT";
  }
}