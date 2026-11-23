import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ciftlik/oyun_ciftlik.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ciftlikConfig.title.length, 33);
    expect(ciftlikConfig.tagline.length, 33);
    for (final s in ciftlikConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ciftlikConfig.gameId, ciftlikId);
    expect(ciftlikRules.gameId, ciftlikId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ciftlikRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ciftlikId, optionalMechanics: ciftlikRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ciftlikRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
