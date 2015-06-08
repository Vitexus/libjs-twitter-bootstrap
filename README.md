# libjs-twitter-bootstrap
my own fresh debian package for twitter bootstrap

## How to install ?

    wget -O - http://v.s.cz/info@vitexsoftware.cz.gpg.key | sudo apt-key add -
    echo deb http://v.s.cz/ stable main | sudo tee /etc/apt/sources.list.d/vitexsoftware.list
    sudo aptitude update
    sudo aptitude install libjs-twitter-bootstrap

## How to use ?

    <link href="/javascript/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="/javascript/jquery/jquery.js"></script>
    <script src="/javascript/twitter-bootstrap/js/bootstrap.js"></script>

