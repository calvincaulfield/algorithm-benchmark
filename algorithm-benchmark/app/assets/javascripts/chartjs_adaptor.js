
function getRancomColors(num) {
    var shadePart = Math.floor(Math.random() * num);
    var red = Math.floor(Math.random() * 256);
    var green = Math.floor(Math.random() * 256);
    var blue = Math.floor(Math.random() * 256);
    var shades = [];
    for (var i = 0; i < num; i++) {
        shades.push(100 + 100 * i / (num - 1))
    }
    var alpha = 0.8;
    function getColor(i) {
        var colors = [red, green, blue];
        colors[shadePart] = shades[i];
        return `rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, ${alpha})`
    }
    var result = [];
    for (var i = 0; i < num; i++) {
        result.push(i);
    }
    return result.map(e => getColor(e));
}

function getDataOption(algorithms, results, testCases) {
    var colors = getRancomColors(testCases.length);
    return {
        labels: algorithms.map(arr => arr[0]),
        datasets: testCases.map(function (test_case, i) {                
            return { label: test_case, backgroundColor: colors[i], data: results.map(arr => arr[i]) }
        })
    };
}

function drawChart(chartId, algorithms, results, testCases, titleString, unitString) {
    Chart.defaults.global.defaultFontSize = 15;
    Chart.defaults.global.defaultFontColor = 'black';
    var ctx = document.getElementById(chartId);
    var myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: getDataOption(algorithms, results, testCases),
        options: {
            animation: { duration: 2000, easing: 'easeOutQuint' },
            legend: { display: true, labels: { fontSize: 15 } },
            scales: { xAxes: [{ scaleLabel: { display: true, labelString: unitString } }] },
            title: { text: titleString, font_size: 30, display: true },
            layout: { padding: { left: 0, right: 0, top: 0, bottom: 0 } }
        }
    });
    return myChart;
}

