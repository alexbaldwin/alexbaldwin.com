function getUrlParameter(t) {
  for (
    var e = window.location.search.substring(1), i = e.split("&"), n = 0;
    n < i.length;
    n++
  ) {
    var r = i[n].split("=");
    if (r[0] == t) return r[1];
  }
}
function fetchGifs(t) {
  var e = $.get(
    "https://api.giphy.com/v1/gifs/search?q=" +
      t +
      "&api_key=dc6zaTOxFJmzC&limit=200"
  );
  e.done(function (t) {
    for (var e = [], i = 0; i < t.data.length; i++)
      e.push("https://media2.giphy.com/media/" + t.data[i].id + "/giphy.gif");
    var n = 0,
      r = [];
    $(e).each(function (t, e) {
      var i = new Image();
      $(i).load(function () {
        0 == n && (gifset = r), n++, r.push(e);
      }),
        (i.src = e);
    });
  });
}
function shuffle(t) {
  for (var e, i, n = t.length; 0 !== n; )
    (i = Math.floor(Math.random() * n)),
      (n -= 1),
      (e = t[n]),
      (t[n] = t[i]),
      (t[i] = e);
  return t;
}
function nextInGifset() {
  ++gifsetIndex,
    gifsetIndex >= gifset.length && ((gifsetIndex = 0), shuffle(gifset)),
    $(".viewer").attr("src", gifset[gifsetIndex]);
}
var bpm = 32,
  gifset = [],
  gifsetIndex = -1;
$("#gifForm").submit(function (t) {
  var e = $("#gifInput").val();
  fetchGifs(e),
    window.history.pushState({}, e, "?party=" + e),
    fetchGifs(gifInput),
    $(".tweet-this").attr(
      "href",
      "https://twitter.com/intent/tweet?url=" +
        encodeURIComponent(
          "https://raverobot.com/?party=" + encodeURIComponent(e)
        ) +
        "&text=Check out my " +
        e +
        " gif dance party"
    ),
    t.preventDefault();
});
var urlParty = getUrlParameter("party");
urlParty &&
  ($("#gifInput").val(decodeURIComponent(urlParty)), $("#gifForm").submit()),
  setInterval(nextInGifset, 6e4 / bpm);
