var page = new WebPage(),
    address, output, size;

if (phantom.args.length < 2 || phantom.args.length > 3) {
    console.log('Usage: rasterize.js URL filename');
    phantom.exit();
} else {
    address = phantom.args[0];
    output = phantom.args[1];
    page.viewportSize = { width: 500, height: 375 };
    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('Unable to load the address!');
        } else {
            page.clipRect = { top: 0, left: 0, width: 800, height: 375 };  
            window.setTimeout(function () {
                page.render(output);
                console.log(output);
                phantom.exit();
            }, 1000);
        }
    });
}
