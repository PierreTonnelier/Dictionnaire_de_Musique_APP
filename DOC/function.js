

function Mode_aléa (){
    Css_var = ["Pop", "dark_back", "light_back", "dead_back", "Warning", "Warning2", "police"] ; 
    root = document.querySelector(':root') ; 

    function couleur(){
        R = Math.floor(Math.random() * 255) ; 
        G = Math.floor(Math.random() * 255) ; 
        B = Math.floor(Math.random() * 255) ; 
        return("rgb(" + R + ',' + G + ',' + B + ')') ; 
    }

    for (ele of Css_var){
        coul = couleur() ; 
        root.style.setProperty('--' + ele, coul) ; 
    }
}





function planche(planche, vignette) {
    alert("planche :: " + planche + ':' + vignette + ":: Pop up de la photo de la vignette à mettre en place ") ; 
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
                text = text.replace('_', ' ') ; 
                text = text.replace('_', ' ') ; 
                text = document.createTextNode(text) ; 
                li = document.createElement('li') ; 
                a = document.createElement("button") ; 
                if (Dix[i] == id){
                    a.setAttribute("class", "itemTraité") ; 
                }
                a.setAttribute('onclick', "location.href='"+ Dix[i] + ".html'") ; 
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


function recherche(article){
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
        let input = document.createElement("input") ; 
        input.setAttribute('type','text'); 
        input.setAttribute('id','mySearch'); 
        input.setAttribute('onkeyup','myFunctionSideNav()'); 
        input.setAttribute('placeholder','Recherche...');
        input.setAttribute('title','Tapez votre recherche'); 
        let ul = document.createElement('ul') ; 
        ul.setAttribute('id', 'myMenu') ; 

        for( i = 0 ; i < data.length - 1 ; i++ ){
            text = data[i] ; 
            nb = /\d/ ; 
            text = text.replace(nb, '') ; 
            text = text.replace('_', ' ') ;
            text = text.replace('_', ' ') ;
            text = text.replace('_', ' ') ; 
            text = document.createTextNode(text) ; 
            li = document.createElement('li') ; 
            let button_ = document.createElement('button') ; 
            button_.setAttribute('onclick', "location.href='" + data[i] + ".html'") ;
            if (article == data[i]){
                button_.setAttribute("class", "itemTraité") ; 
            }
            button_.appendChild(text) ; /* a modif */
            li.appendChild(button_) ; /* a modif */
            ul.appendChild(li) ; 
        }

        button = document.createElement('button') ;
        button.setAttribute('class', "ButtonOff") ;
        button.setAttribute('onclick', 'butOff()') ;  
        txtbutton = document.createTextNode("X") ; 
        button.appendChild(txtbutton) ; 
        menu.appendChild(button) ; 
        menu.appendChild(input) ;
        menu.appendChild(ul) ; 
        body.appendChild(menu) ; 

    }
}


//Barre de Recherche
function myFunctionSideNav() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("mySearch");
        filter = input.value.toUpperCase();
        ul = document.getElementById("myMenu");
        li = ul.getElementsByTagName("li");
        for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("button")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
        li[i].style.display = "";
        } else {
        li[i].style.display = "none";
        }
        }
        }


