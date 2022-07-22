String DetectCityName(String zoneName)
{
  if(zoneName.substring(0,2) == "Af" || zoneName.substring(0,2) == "Eu")
  {
    return zoneName.substring(7,zoneName.length);
  }
  else if(zoneName.substring(0,2) == "Am")
  {
    return zoneName.substring(8,zoneName.length);
  }
  else if(zoneName.substring(0,2) =="As")
  {
    return zoneName.substring(5,zoneName.length);
  }
  else if(zoneName.substring(0,2) =="Au")
  {
    return zoneName.substring(10,zoneName.length);
  }
  else
  {
    return zoneName;
  }
}