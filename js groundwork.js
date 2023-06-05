const url = 'https://wheatley.cs.up.ac.za/u21598012/api.php';
const data = {  
  //"apikey":"LsDJDJ18RGX",
  "type":"GetAllData",

  "limit":20,
  //"return":"*"
 };
const xhr = new XMLHttpRequest();

xhr.open('POST', url);
      xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var fulllist = JSON.parse(xhr.responseText);
          var wineData = fulllist.data;
          var table = document.getElementById("wineTable"); 
          for(var i = 0; i < wineData.length; ++i)
          {
            //console.log('https://wheatley.cs.up.ac.za/api/getimage?brand=' + fulllist.data[i].make );
            var source;
                             table.innerHTML += "<tr><td> <img class="+"wineImg" + " src=" + fulllist.data[i].Link +" height=350px width = 550px >" + "</td><td class=carInfo id=info>" +
                  "Brand: " + fulllist.data[i].Brand + "<br>" +
                  "Wine: " + fulllist.data[i].Wine + "<br>" +                               "</tr > ";
                }
        }
        else {
          if (xhr.status == 400) {
            console.log("nothing");
          }
        }
      };   
xhr.send(JSON.stringify(data));
