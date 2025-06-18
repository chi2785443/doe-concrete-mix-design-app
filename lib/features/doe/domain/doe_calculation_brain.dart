import 'dart:math';

// Variable definitions

// fc = characteristic strength of concrete
// slump = slump value
// aggtype = aggregate type [uncrushed] or [crushed]¶
// sg = aggregate specific gravity
// defective = defective percentage
// k = defective value
// s = standard deviation
// fm = target mean strength
// Fwc = free water content
// FWR = free water ratio
// Cc = Concrete content
// Wdcc = Wet density of concrete
// Ac = Total aggregate content
// Pp = passing through 600 micron sieve
// Pfa = percentange of fine aggregate

class DoeCalculationBrain {
  DoeCalculationBrain({
    required this.fc,
    required this.slump,
    required this.aggtype,
    required this.sg,
    required this.defective,
    required this.agg_size,
    required this.Pp,
  });

  late final double fc;
  final int slump;
  final int aggtype;
  final double? sg;
  final double? defective;
  final int Pp;
  final int agg_size;

  var s;
  var K;
  var fm;
  var FWR;
  var Fwc;
  var Cc;
  var Wdcc;
  var Ac;
  var Pfa;
  var Fa;
  var Ca;
  var cementRatio;
  var fineAggRatio;
  var coarseAggRatio;

  double getStandardDeviation() {
    if (fc <= 20.0) {
      s = 0.38917920079316415 * fc + 0.04261076557435839;
      return s;
    } else if (fc > 20.0 && fc <= 70.0) {
      s = 0.0 * fc + 8.0;
      return s;
    } else {
      s = 8.0;
      return s;
    }
  }

  double getDefective() {
    if (defective == 1) {
      K = 2.33;
      return K;
    } else if (defective == 2.5) {
      K = 1.96;
      return K;
    } else if (defective == 5) {
      K = 1.64;
      return K;
    } else if (defective == 10) {
      K = 1.28;
      return K;
    } else {
      K = 0.0;
      return K;
    }
  }

  double getTargetMeanStrength() {
    fm = fc + K * s;
    return fm;
  }

  double getFreeWaterRatio() {
    if (aggtype == 2) {
      if (fm <= 42.0) {
        FWR = 0.000295 * pow(fm, 2) - 0.0312 * fm + 1.351;
        return FWR;
      } else {
        FWR = 0.00008519157 * pow(fm, 2) - 0.01571 * fm + 1.0697;
        return FWR;
      }
    } else {
      if (fm <= 42) {
        FWR = 0.000295 * pow(fm, 2) - 0.0312 * fm + 1.291;
        return FWR;
      } else {
        FWR = 0.00008519157 * pow(fm, 2) - 0.01571 * fm + 1.0097;
        return FWR;
      }
    }
  }

  double getFreeWaterContent() {
    if (agg_size == 10) {
      if (aggtype == 2) {
        if (slump <= 10) {
          Fwc = 180.0;
          return Fwc;
        } else if (slump > 10 && slump <= 30) {
          Fwc = 205.0;
          return Fwc;
        } else if (slump > 30 && slump <= 60) {
          Fwc = 230.0;
          return Fwc;
        } else {
          Fwc = 250.0;
          return Fwc;
        }
      } else {
        if (slump <= 10) {
          Fwc = 150.0;
          return Fwc;
        } else if (slump > 10 && slump <= 30) {
          Fwc = 180.0;
          return Fwc;
        } else if (slump > 30 && slump <= 60) {
          Fwc = 205.0;
          return Fwc;
        } else {
          Fwc = 225.0;
          return Fwc;
        }
      }
    } else if (agg_size == 20) {
      if (aggtype == 2) {
        if (slump <= 10) {
          Fwc = 170.0;
          return Fwc;
        } else if (slump > 10 && slump <= 30) {
          Fwc = 190.0;
          return Fwc;
        } else if (slump > 30 && slump <= 60) {
          Fwc = 210.0;
          return Fwc;
        } else {
          Fwc = 225.0;
          return Fwc;
        }
      } else {
        if (slump <= 10) {
          Fwc = 135.0;
          return Fwc;
        } else if (slump > 10 && slump <= 30) {
          Fwc = 160.0;
          return Fwc;
        } else if (slump > 30 && slump <= 60) {
          Fwc = 180.0;
          return Fwc;
        } else {
          Fwc = 195.0;
          return Fwc;
        }
      }
    } else {
      if (aggtype == 2) {
        if (slump <= 10) {
          Fwc = 155.0;
          return Fwc;
        } else if (slump > 10 && slump <= 30) {
          Fwc = 175.0;
          return Fwc;
        } else if (slump > 30 && slump <= 60) {
          Fwc = 190.0;
          return Fwc;
        } else {
          Fwc = 205.0;
          return Fwc;
        }
      } else {
        if (slump <= 10) {
          Fwc = 115.0;
          return Fwc;
        } else if (slump > 10 && slump <= 30) {
          Fwc = 140.0;
          return Fwc;
        } else if (slump > 30 && slump <= 60) {
          Fwc = 160.0;
          return Fwc;
        } else {
          Fwc = 175.0;
          return Fwc;
        }
      }
    }
  }

  double getCementContent() {
    Cc = Fwc / FWR;
    return Cc;
  }

  double getWetdensityofConcrete() {
    if (sg == 2.4) {
      Wdcc = -0.980969674811615 * Fwc + 2410.361468272194;
      return Wdcc;
    } else if (sg == 2.5) {
      Wdcc = -1.099667180898224 * Fwc + 2500.687646198658;
      return Wdcc;
    } else if (sg == 2.6) {
      Wdcc = -1.2492046136386954 * Fwc + 2410.361468272194;
      return Wdcc;
    } else if (sg == 2.7) {
      Wdcc = -1.4480267472717958 * Fwc + 2702.8337919483006;
      return Wdcc;
    } else if (sg == 2.8) {
      Wdcc = -1.5961009844332519 * Fwc + 2802.555445152004;
      return Wdcc;
    } else if (sg == 2.9) {
      Wdcc = -1.7440882482713698 * Fwc + 2898.4795739605056;
      return Wdcc;
    } else {
      Wdcc = 0.0;
      return Wdcc;
    }
  }

  double getTotalAggregateContent() {
    Ac = Wdcc - Cc - Fwc;
    return Ac;
  }

  double getPercentageofFineAggregate() {
    if (agg_size == 10) {
      if (slump > 0 && slump <= 10) {
        if (Pp <= 15) {
          Pfa = 29.418986368716347 * FWR + 43.72900869034309;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 26.460234127922273 * FWR + 32.28836783095247;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 17.771430103960213 * FWR + 28.64796072906842;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 16.162106147694004 * FWR + 22.645423988125142;
          return Pfa;
        } else {
          Pfa = 13.18908953755561 * FWR + 19.872849915128207;
          return Pfa;
        }
      } else if (slump > 10 && slump <= 30) {
        if (Pp <= 15) {
          Pfa = 28.14488144318873 * FWR + 45.28987289961262;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 26.455125482108578 * FWR + 33.60377695007579;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 18.78884776631467 * FWR + 29.199593271603607;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 13.613393038622387 * FWR + 25.198298658194165;
          return Pfa;
        } else {
          Pfa = 11.70611056790237 * FWR + 21.43897528746156;
          return Pfa;
        }
      } else if (slump > 30 && slump <= 60) {
        if (Pp <= 15) {
          Pfa = 27.58017290943122 * FWR + 49.362750874387054;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 23.55404412658216 * FWR + 37.373649895703366;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 15.963248679417157 * FWR + 33.16855947106026;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 14.787398258975422 * FWR + 26.88559654673419;
          return Pfa;
        } else {
          Pfa = 14.717642787073236 * FWR + 21.976481343972647;
          return Pfa;
        }
      } else {
        if (Pp <= 15) {
          Pfa = 29.258305218443446 * FWR + 55.01121386353804;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 23.929150741545 * FWR + 43.37773969864082;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 17.933905219256243 * FWR + 36.49528091531421;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 15.11398823816611 * FWR + 30.071942009671098;
          return Pfa;
        } else {
          Pfa = 13.214610163437285 * FWR + 26.003611341237836;
          return Pfa;
        }
      }
    } else if (agg_size == 20) {
      if (slump > 0 && slump <= 10) {
        if (Pp <= 15) {
          Pfa = 27.604441236353736 * FWR + 29.37246198787382;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 23.64693208872969 * FWR + 22.00025479174145;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 19.090008115014502 * FWR + 18.941061812626174;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 13.99897038048839 * FWR + 16.777441061732276;
          return Pfa;
        } else {
          Pfa = 12.711983577012948 * FWR + 13.789274258297265;
          return Pfa;
        }
      } else if (slump > 10 && slump <= 30) {
        if (Pp <= 15) {
          Pfa = 28.750045398852222 * FWR + 31.735521908577088;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 24.516666717149278 * FWR + 24.26653687456144;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 20.043670335630264 * FWR + 19.743176524626804;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 16.454425472536084 * FWR + 17.050860462687076;
          return Pfa;
        } else {
          Pfa = 13.305063593993069 * FWR + 15.161576301491491;
          return Pfa;
        }
      } else if (slump > 30 && slump <= 60) {
        if (Pp <= 15) {
          Pfa = 30.94385450791851 * FWR + 35.59255678528782;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 23.69302012163226 * FWR + 27.70496739116793;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 19.126322826291663 * FWR + 23.367979135143784;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 14.712447373141341 * FWR + 19.878589523731776;
          return Pfa;
        } else {
          Pfa = 11.740241031398886 * FWR + 17.556076883683453;
          return Pfa;
        }
      } else {
        if (Pp <= 15) {
          Pfa = 29.325719602382787 * FWR + 41.22716440050247;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 22.920899658785025 * FWR + 32.98190453864085;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 20.719839164900186 * FWR + 26.13377623039586;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 16.983567373269082 * FWR + 22.160746922764645;
          return Pfa;
        } else {
          Pfa = 14.033422906167498 * FWR + 19.906441656381464;
          return Pfa;
        }
      }
    } else if (agg_size == 40) {
      if (slump > 0 && slump <= 10) {
        if (Pp <= 15) {
          Pfa = 27.678775225570135 * FWR + 22.253398209213582;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 25.50455336014808 * FWR + 15.969226651994047;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 17.947656028386515 * FWR + 14.265329762311705;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 15.004079419387248 * FWR + 12.235761279537169;
          return Pfa;
        } else {
          Pfa = 13.064006356319446 * FWR + 9.926403919946654;
          return Pfa;
        }
      } else if (slump > 10 && slump <= 30) {
        if (Pp <= 15) {
          Pfa = 27.772761891659528 * FWR + 23.959767806536547;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 23.323452074263432 * FWR + 18.64016947684889;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 16.615899532414648 * FWR + 16.31397977093686;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 12.835834078043227 * FWR + 14.414111103671777;
          return Pfa;
        } else {
          Pfa = 11.233293512462978 * FWR + 12.411751185486965;
          return Pfa;
        }
      } else if (slump > 30 && slump <= 60) {
        if (Pp <= 15) {
          Pfa = 24.91658047593317 * FWR + 28.710648105594977;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 19.132311477489043 * FWR + 23.936662423026156;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 14.665754179830458 * FWR + 20.098910264298127;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 10.633205562412487 * FWR + 18.002912315759822;
          return Pfa;
        } else {
          Pfa = 10.851372796341677 * FWR + 14.833438014131055;
          return Pfa;
        }
      } else {
        if (Pp <= 15) {
          Pfa = 29.25449508504632 * FWR + 34.43334308977252;
          return Pfa;
        } else if (Pp > 15 && Pp <= 40) {
          Pfa = 22.84529551381729 * FWR + 27.980245463480934;
          return Pfa;
        } else if (Pp > 40 && Pp <= 60) {
          Pfa = 19.42692100504758 * FWR + 22.45516815812006;
          return Pfa;
        } else if (Pp > 60 && Pp <= 80) {
          Pfa = 15.271268424194792 * FWR + 19.946255262750437;
          return Pfa;
        } else {
          Pfa = 13.244030550020257 * FWR + 17.10584689367303;
          return Pfa;
        }
      }
    } else {
      return Pfa = 0.0;
    }
  }

  double getFineAggregateContent() {
    Fa = (Pfa / 100) * Ac;
    return Fa;
  }

  double getCoarseAggregateContent() {
    Ca = Ac - Fa;
    return Ca;
  }

  double getCementRatio() {
    cementRatio = Cc / Cc;
    return cementRatio;
  }

  double getFineAggRatio() {
    fineAggRatio = Fa / Cc;
    return fineAggRatio;
  }

  double getCoarseAggRatio() {
    coarseAggRatio = Ca / Cc;
    return coarseAggRatio;
  }
}
