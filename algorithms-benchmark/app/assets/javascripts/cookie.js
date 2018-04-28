function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function getActiveTagIds(allTagIds) {
    var result = [];
    for (var i = 0; i < allTagIds.length; i++) {
        if (getCookie(allTagIds[i]) == '1') {
            result.push(allTagIds[i]);
        }
    }
    return result;
}

function getCategory() {
    return getCookie('category');
}

function setCategory(category) {
    setCookie('category', category, 1);
}

function setTagId(tag) {
    setCookie(tag, '1', 1);
}

function unsetTagId(tag) {
    setCookie(tag, '0', 1);
}

function unsetAll() {
    var setTagIds = getAllSetTagIds();
    for (var i = 0; i < setTagIds.length; i++) {
        unsetTagId(setTagIds[i]);
    }    
}

function getAllSetTagIds() {
    var result = [];
    var pairs = document.cookie.split(";");
    for (var i = 0; i < pairs.length; i++){
        var pair = pairs[i].split("=");
        if (pair[1] == '1') {
        result.push(pair[0]);
      }
    }
    return result;
}