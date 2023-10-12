import c3 from 'c3';

export function createChart(elementId) {
  const columns = JSON.parse(document.getElementById(elementId).dataset.columns);
  c3.generate({
      bindto: '#' + elementId,
      data: {
        x: 'dates',
        columns: columns
      },
      axis: {
          x: {
              type: 'timeseries',
              tick: {
                  format: '%d.%m.%Y'
              }
          }
      }
  });
}