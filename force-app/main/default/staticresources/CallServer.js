function searchResults(){
            var accountName = document.getElementById('inputStringId').value;
            JSRemoteActionDemoController.searchAccountResults(
                                                     accountName,
                                                     function(result, event){
                                                         console.log('event.status....'+event.status);
                                                         
               if (event.status){
                   var htmlTable = '<table border=1>';
                    for(var i = 0 ;i<result.length ; i++){
                        console.log('record...'+result[i]);
                        console.log('record...'+JSON.stringify(result[i]));
                        console.log('record Name..'+result[i].AccountNumber);
                        htmlTable =  htmlTable + '<tr><td>'+result[i].AccountNumber+'</td></tr>';
                       
                    }
                    htmlTable = htmlTable+'</table>';
                    console.log('htmlTable...'+htmlTable);
                    document.getElementById('accTableContent').innerHTML = htmlTable;
                }
            }
              );
        }
