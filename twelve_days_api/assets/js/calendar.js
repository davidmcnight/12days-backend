import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
var http = require('http');


document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var events = [];

    $.getJSON('http://localhost:4000/api/events',
     function(data) {
        
    });

  
    
  
    var calendar = new Calendar(calendarEl, {

     


      //get events
      plugins: [ dayGridPlugin ],

      events: [
        {
          title  : 'event1',
          start  : '2019-08-21'
        },
        {
          title  : 'event2',
          start  : '2019-08-22',
          start  : '2019-08-23',
        },
        // {
        //   title  : 'event3',
        //   start  : '2010-01-09T12:30:00',
        //   allDay : false // will make the time show
        // }
      ]

    });

    
  
    calendar.render();
  });