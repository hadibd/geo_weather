class Model {
  String weatherIcon(int id) {
    if (id >= 200 && id <= 232) {
      return 'assets/images/weather_icon/eleven.png';
    }
    if (id >= 300 && id <= 321) {
      return 'assets/images/weather_icon/nine.png';
    }
    if (id >= 500 && id <= 531) {
      return 'assets/images/weather_icon/ten.png';
    }
    if (id >= 600 && id <= 622) {
      return 'assets/images/weather_icon/thirteen.png';
    }
    if (id >= 701 && id <= 781) {
      return 'assets/images/weather_icon/fifty.png';
    }
    if (id == 800) {
      return 'assets/images/weather_icon/one.png';
    }
    if (id >= 801 && id <= 804) {
      return 'assets/images/weather_icon/two.png';
    } else {
      return '';
    }
  }

  String weatherMsg(int id) {
    if (id >= 200 && id <= 232) {
      return 'Thunderstorm';
    }
    if (id >= 300 && id <= 321) {
      return 'Drizzling';
    }
    if (id >= 500 && id <= 531) {
      return 'Rainy';
    }
    if (id >= 600 && id <= 622) {
      return 'Snow';
    }
    if (id >= 701 && id <= 781) {
      if (id == 701) {
        return 'Mist';
      }
      if (id == 711) {
        return '	Smoke';
      }
      if (id == 721) {
        return '	Haze';
      }
      if (id == 731) {
        return '	Dust';
      }
      if (id == 741) {
        return '	Fog	fog';
      }
      if (id == 751) {
        return '	Sand';
      }
      if (id == 761) {
        return '	Dust';
      }
      if (id == 762) {
        return '	Ash	volcanic';
      }
      if (id == 771) {
        return '	Squall';
      }
      if (id == 781) {
        return '	Tornado';
      }
    }
    if (id == 800) {
      return 'Clear Sky';
    }
    if (id >= 801 && id <= 804) {
      return 'Cloudy';
    } else {
      return '';
    }
  }
}
