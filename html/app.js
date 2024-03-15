$(function () {
    window.addEventListener('message', function(event) {
        var v = event.data;
        
        switch (v.action) {
            case "UpdateMoney":
                if(v.account == 'money') {
                    $(".dwallet").text(`${v.icon} ${v.money}`);
                    $('.wallet').fadeIn();
                    setTimeout(() => {
                        $('.wallet').fadeOut();
                    }, v.time);
                } else if(v.account == 'bank') {
                    $(".dbank").text(`${v.icon} ${v.money}`);
                    $('.bank').fadeIn();
                    setTimeout(() => {
                        $('.bank').fadeOut();
                    }, v.time);
                }
                break;

            case "playerLoggedIn":
                $(".allstatus").css("display", "grid");
                break;
        }
    });
});

window.addEventListener('message', function(event) {

    let wallet = event.data.wallet;
    let bank = event.data.bank;
    let id = event.data.id
    let job = event.data.job

    $(".dbank").text(bank);

    $(".dwallet").text(wallet);

    $(".did").text(id);

    $(".djob").text(job);
    let display = false;

});