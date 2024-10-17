String weatherIcon(String weatherCondition) {
  switch (weatherCondition.toUpperCase()) {
    case 'CLOUDS':
      return ' 🌥️ ';
    case 'THUNDERSTORM':
      return ' 🌩️ ';
    case 'DRIZZLE':
      return ' 🌦️ ';
    case 'RAIN':
      return ' 🌧️ ';
    case 'SNOW':
      return ' ❄️ ';
    case 'CLEAR':
      return ' ☀️ ';
    case 'MIST':
      return ' 🌫️ ';
    case 'TORNADO':
      return ' 🌪️ ';
    default:
      return '❓';
  }
}
