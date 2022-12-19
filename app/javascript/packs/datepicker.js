import { Datepicker } from 'vanillajs-datepicker';

$(document).ready(() => {
    const elem = document.getElementById('dateSelector');
    if(elem) {
        const datepicker = new Datepicker(elem, {
            autohide: true,
            clearBtn: true,
            beforeShowDay: (date) => {
                const dateToday = new Date();
                return date <= dateToday;
            }
        });

      elem.addEventListener('changeDate', function(e) {
        console.log('end', e.detail.date);
        var date = e.detail.date.toString();
        var url = window.location.href
        if(window.location.href.includes('date'))
        {
          url = url.substring(0, url.indexOf('?date'))
        }
        window.history.replaceState({}, '', url + '?date='+date);
        window.location.reload();
      });
    }
});