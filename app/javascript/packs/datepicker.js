import { Datepicker } from 'vanillajs-datepicker';
import { DateRangePicker } from 'vanillajs-datepicker';

$(document).ready(() => {
    const elem = document.getElementById('dateSelector');
    if(elem) {
        const datepicker = new Datepicker(elem, {
            autohide: true,
            clearBtn: true,
            beforeShowDay: (date) => {
                const dateToday = new Date();
                return date >= dateToday;
            }
        });
    }

    const elem2 = document.getElementById('multiDateSelector');
    if(elem2) {
        const datepicker = new DateRangePicker(elem2, {
            autohide: true,
            clearBtn: true,
            keyboardNavigation: false,
            todayHighlight:'TRUE',
            beforeShowDay: (date) => {
                const dateToday = new Date();
                return date <= dateToday;
            }
        });
    }
});