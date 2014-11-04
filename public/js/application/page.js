$('document').ready(function () {
    $('#email').focus();
    $('.close').click(function () {
        $(this).closest('.alert').fadeOut("slow");
    });
});

$('#form').submit(function (event) {
    var rawMail = $(this).serializeArray()[0].value.toLowerCase();
    var shaMail = hex_sha256(rawMail);
    var postData = {'email': shaMail};
    $('.working').delay(500).fadeIn("fast");
    $.ajax(
        {
            url: "/is_pwnd",
            type: "POST",
            data: postData,
            success: function (data) {
                var resp = JSON.parse(data);
                if (resp.was_owned === true) {
                    $('#email').val('');
                    $('.working').fadeOut("slow");
                    $('.owned > .response').text("It seems that the address " + rawMail + " was leaked...");
                    $('.owned').delay(1000).fadeIn("slow");

                } else {
                    $('#email').val('');
                    $('.working').fadeOut("slow");
                    $('.not-owned > .response').text("You're in the clear!");
                    $('.not-owned').delay(1000).fadeIn("slow");
                }
            },
            error: function (jqXHR) {
                $('#email').val('');
                $('.error > .response').text('Something went wrong... ' + jqXHR.responseText);
                $('.working').fadeOut("slow");
                $('.error').delay(1000).fadeIn("slow");
            }
        });
    event.preventDefault();
});