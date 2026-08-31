import '../models/guide.dart';

final List<Guide> sampleGuides = [
  Guide(
    id: 'choking',
    title: 'Choking',
    steps: [
      GuideStep(title: 'Step 1', content: 'Ask "Are you choking?" If they cannot speak, cough, or breathe, act immediately.'),
      GuideStep(title: 'Step 2', content: 'Stand behind the person and lean them slightly forward.'),
      GuideStep(title: 'Step 3', content: 'Give 5 sharp back blows between the shoulder blades with the heel of your hand.'),
      GuideStep(title: 'Step 4', content: 'If that fails, give 5 abdominal thrusts (Heimlich maneuver).'),
      GuideStep(title: 'Step 5', content: 'Repeat back blows and thrusts until the object is expelled or help arrives.'),
    ],
  ),
  Guide(
    id: 'burns',
    title: 'Burns',
    steps: [
      GuideStep(title: 'Step 1', content: 'Remove the person from the heat source.'),
      GuideStep(title: 'Step 2', content: 'Cool the burn under cool (not ice-cold) running water for 20 minutes.'),
      GuideStep(title: 'Step 3', content: 'Remove any tight clothing or jewelry near the burn before it swells.'),
      GuideStep(title: 'Step 4', content: 'Cover loosely with a clean, non-fluffy cloth or cling film.'),
      GuideStep(title: 'Step 5', content: 'Do not apply creams, ice, or burst blisters. Seek medical help for serious burns.'),
    ],
  ),
  Guide(
    id: 'bleeding',
    title: 'Severe Bleeding',
    steps: [
      GuideStep(title: 'Step 1', content: 'Apply firm, direct pressure to the wound with a clean cloth.'),
      GuideStep(title: 'Step 2', content: 'Keep pressing without lifting the cloth to check — add more layers if needed.'),
      GuideStep(title: 'Step 3', content: 'Raise the injured area above the heart if possible.'),
      GuideStep(title: 'Step 4', content: 'Once bleeding slows, bandage firmly but not so tight it cuts circulation.'),
      GuideStep(title: 'Step 5', content: 'Call for emergency help immediately for severe or uncontrolled bleeding.'),
    ],
  ),
];