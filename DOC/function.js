function planche(planche, vignette) {
    alert(planche + ':' + vignette + ":: Pop up de la photo de la vignette à mettre en place ") ; 
}

function Menu (article){

            art = document.getElementById('ARTICLE'); 
            art.style.display = "none" ; 

    const id = article ; 
    posi = 0 ; 
    Dix = [] ; 
    data = [] ;


            fetch('../ARTICLES/articles.json')
            .then((response) => response.json())
            .then ((data) => 
            { 

                let position = 0 ; 
                for( i of data ){
                    if (i == id){
                        posi = position ;
                        break ;
                    }
                position++; 
                }
                /* avant */
                if (posi <= 6){
                    for (let j = 0 ; j <= posi - 1 ; j++) {
                        Dix.push(data[j])
                    }
                } else {
                    for (let j = posi - 6 ; j <= (posi - 1); j++) {
                        Dix.push(data[j])
                    }
                }
                Dix.push(data[posi])
                /* apres */
                if (posi >= ( data.length - 5 )) {
                    for (j = posi + 1 ; j <= data.length; j++) {
                        Dix.push(data[j])
                    }
                } else {
                    for (j = posi + 1; j <= posi + 6 ; j++) {
                        Dix.push(data[j])
                    }
                }
                affichageDix(Dix, id) ; 
            }) ; 

function affichageDix(Dix, id){

            let body = document.getElementsByTagName('body') ; 
            body = body[0] ; 
            let menu = document.createElement('div') ; 
            menu.setAttribute('id', 'menu') ; 
            let ul = document.createElement('ul') ; 

            for (i = 0 ; i < Dix.length ; i++){
                text = Dix[i] ; 
                nb = /\d/ ;  
                text = text.replace(nb, '') ;
                text = text.replace('_', ' ') ; 
                text = document.createTextNode(text) ; 

                li = document.createElement('li') ; 
                if (Dix[i] == id){
                    li.setAttribute("class", "itemTraité") ; 
                }
                a = document.createElement("a") ; 
                a.setAttribute('href', Dix[i] + '.html') ; 
                a.appendChild(text) ; /* a modif */
                li.appendChild(a) ; /* a modif */
                ul.appendChild(li) ; 
            }
            button = document.createElement('button') ;
            button.setAttribute('class', "ButtonOff") ;
            button.setAttribute('onclick', 'butOff()') ;  
            txtbutton = document.createTextNode("X") ; 
            button.appendChild(txtbutton) ; 
            menu.appendChild(button) ; 
            menu.appendChild(ul) ; 
            body.appendChild(menu) ; 


    /*<div class="menu">
     *</div>
     */




    }

}

function butOff(){
    divMenu = document.getElementById('menu') ;
    divMenu.remove() ; 
    art = document.getElementById('ARTICLE'); 
    art.style.display = "contents" ; 
}


function recherche(){
    art = document.getElementById('ARTICLE'); 
    art.style.display = "none" ; 

    data = [] ;
    fetch('../ARTICLES/articles.json')
    .then((response) => response.json())
    .then ((data) => 
    { recherche_(data) }) ; 

    function recherche_(data){
        let body = document.getElementsByTagName('body') ; 
        body = body[0] ; 
        let menu = document.createElement('div') ; 
        menu.setAttribute('id', 'menu') ; 
        let ul = document.createElement('ul') ; 

        for( i = 0 ; i < data.length ; i++ ){
            text = data[i] ; 
            nb = /\d/ ; 
            text = text.replace(nb, '') ; 
            text = text.replace('_', ' ') ; 
            text = document.createTextNode(text) ; 
            li = document.createElement('li') ; 
            a = document.createElement("a") ; 
            a.setAttribute('href', data[i] + '.html') ; 
            a.appendChild(text) ; /* a modif */
            li.appendChild(a) ; /* a modif */
            ul.appendChild(li) ; 
        }

        button = document.createElement('button') ;
        button.setAttribute('class', "ButtonOff") ;
        button.setAttribute('onclick', 'butOff()') ;  
        txtbutton = document.createTextNode("X") ; 
        button.appendChild(txtbutton) ; 
        menu.appendChild(button) ; 
        menu.appendChild(ul) ; 
        body.appendChild(menu) ; 

    }

}



