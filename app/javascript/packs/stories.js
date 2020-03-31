$(document).ready(() => {
  $('#users-select').on('change', () => {
    window.location.href = $('#users-select').val();
  });

  $('#states-select').on('change', () => {
    window.location.href = $('#states-select').val();
  });
});