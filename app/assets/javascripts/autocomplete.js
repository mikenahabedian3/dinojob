//JobaSoar/app/assets/javascripts/autocomplete.js//

console.log('Autocomplete script loaded');

document.addEventListener('turbo:load', function() {
  console.log('Turbo:load event triggered');
  $('#location_search').autocomplete({
    source: '/locations/autocomplete',
    minLength: 2
  });
});
