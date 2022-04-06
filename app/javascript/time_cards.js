$(function() {
   let working_status;
   $('#timecard-form').on('ajax:success', function(event) {
       const response = event.detail[0];
       if (response.status === 'success') {
           return update_view(response);
       } else {
           return alert('error');
       }
   });

   var update_view = function(response) {
       let in_enable, out_enable;
       const {
           time_card
       } = response;

       if (time_card) {
           if (time_card.in_at && !time_card.out_at) {
               in_enable = false;
               out_enable = true;
           } else if (time_card.out_at) {
               in_enable = false;
               out_enable = false;
           }
       }

       $('#in').prop('disabled', !in_enable);
       $('#out').prop('disabled', !out_enable);
       return $('#work-status').text(working_status(response.working_status));
   };

   return working_status = function(status) {
       switch (status) {
           case 'not_arrived': return '未出勤';
           case 'working': return '勤務中';
           case 'left': return '退勤済';
       }
   };
});
