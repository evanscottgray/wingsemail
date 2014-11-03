$('document').ready(function () {
    $('.close').click(function () {
        $(this).closest('.alert').fadeOut("slow");
    });
});

$('#form').submit(function (event) {
    var postData = $(this).serializeArray();
    $('.email').val('');
    $('.working').delay(500).fadeIn("fast");

    $.ajax(
        {
            url: "/is_pwnd",
            type: "POST",
            data: postData,
            success: function (data, textStatus, jqXHR) {
                var resp = JSON.parse(data);

                if (resp.was_owned == true) {
                    $('.working').fadeOut("slow");
                    $('.owned > .response').text("It seems that your address was leaked...");
                    $('.owned').delay(1000).fadeIn("slow");

                } else {
                    $('.working').fadeOut("slow");
                    $('.not-owned > .response').text("You're in the clear!");
                    $('.not-owned').delay(1000).fadeIn("slow");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('.error > .response').text('Something went wrong... ' + jqXHR.responseText);
                $('.working').fadeOut("slow");
                $('.error').delay(1000).fadeIn("slow");
            }
        });
    event.preventDefault();
});