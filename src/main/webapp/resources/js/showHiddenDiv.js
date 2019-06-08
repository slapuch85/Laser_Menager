document.addEventListener("DOMContentLoaded", function () {

    var hiddenDiv = document.querySelector('.hiddenDiv');
    var showDiv = document.getElementById("showDiv")

    showDiv.addEventListener('click', function () {
        hiddenDiv.classList.toggle("hiddenDiv");
    })

});