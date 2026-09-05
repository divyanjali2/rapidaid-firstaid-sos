import 'package:flutter/material.dart';
import '../models/guide.dart';

final List<Guide> sampleGuides = [
  Guide(
    id: 'choking',
    title: 'Choking',
    icon: Icons.air,
    iconColor: const Color(0xFF0F172A),
    backgroundColor: const Color(0xFFE2E8F0),
    warningText: 'If the person is unconscious, call 119 immediately and begin CPR.',
    steps: [
      GuideStep(title: 'Step 1', content: 'Assess the situation. Ask clearly \'Are you choking?\' If the victim can speak or cough, do not interfere.\nEncourage them to cough to dislodge the object naturally.', imageUrl: 'assets/images/choking_step_1_1788196802292.jpg'),
      GuideStep(title: 'Step 2', content: 'Give 5 back blows. Lean the victim forward and strike them firmly between the shoulder blades with the heel of your hand.\nUse a strong upward and forward motion.', imageUrl: 'assets/images/choking_step_2_1788196858801.jpg'),
      GuideStep(title: 'Step 3', content: 'Give 5 abdominal thrusts (Heimlich Maneuver). Wrap your arms around their waist. Make a fist and press hard into the abdomen with quick, upward thrusts.\nRepeat cycles of 5 back blows and 5 abdominal thrusts until object is expelled.', imageUrl: 'assets/images/choking_step_3_1788196921665.jpg'),
    ],
  ),
  Guide(
    id: 'burns',
    title: 'Burns',
    icon: Icons.local_fire_department_rounded,
    iconColor: const Color(0xFFE85D4A),
    backgroundColor: const Color(0xFFFFF0EE),
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
    title: 'Bleeding',
    icon: Icons.water_drop_rounded,
    iconColor: const Color(0xFFE85D4A),
    backgroundColor: const Color(0xFFFFF0EE),
    steps: [
      GuideStep(title: 'Step 1', content: 'Apply firm, direct pressure to the wound with a clean cloth.'),
      GuideStep(title: 'Step 2', content: 'Keep pressing without lifting the cloth to check — add more layers if needed.'),
      GuideStep(title: 'Step 3', content: 'Raise the injured area above the heart if possible.'),
      GuideStep(title: 'Step 4', content: 'Once bleeding slows, bandage firmly but not so tight it cuts circulation.'),
      GuideStep(title: 'Step 5', content: 'Call for emergency help immediately for severe or uncontrolled bleeding.'),
    ],
  ),
  Guide(
    id: 'fractures',
    title: 'Fractures',
    icon: Icons.healing_rounded,
    iconColor: const Color(0xFF4CAF50),
    backgroundColor: const Color(0xFFF0F8F0),
    steps: [
      GuideStep(title: 'Step 1', content: 'Keep the injured person still. Do not try to straighten the bone or push it back in.'),
      GuideStep(title: 'Step 2', content: 'Immobilize the injured area using a splint or padding to prevent movement.'),
      GuideStep(title: 'Step 3', content: 'Apply ice packs wrapped in a cloth to reduce swelling (do not apply ice directly to skin).'),
      GuideStep(title: 'Step 4', content: 'If there is an open wound, cover it with a sterile dressing without pressing on the bone.'),
      GuideStep(title: 'Step 5', content: 'Call emergency services. Keep the person warm and comfortable until help arrives.'),
    ],
  ),
  Guide(
    id: 'snake_bite',
    title: 'Snake Bite',
    icon: Icons.pest_control_rounded,
    iconColor: const Color(0xFFE85D4A),
    backgroundColor: const Color(0xFFFFF0EE),
    steps: [
      GuideStep(title: 'Step 1', content: 'Move the person away from the snake. Keep them calm and still to slow venom spread.'),
      GuideStep(title: 'Step 2', content: 'Remove jewelry or tight clothing near the bite before swelling starts.'),
      GuideStep(title: 'Step 3', content: 'Keep the bitten limb immobilized and at or below heart level.'),
      GuideStep(title: 'Step 4', content: 'Do NOT cut the wound, suck out venom, apply ice, or use a tourniquet.'),
      GuideStep(title: 'Step 5', content: 'Call emergency services immediately. Try to remember the snake\'s appearance for identification.'),
    ],
  ),
  Guide(
    id: 'heart_attack',
    title: 'Heart Attack',
    icon: Icons.favorite_border_rounded,
    iconColor: const Color(0xFFAB7FE5),
    backgroundColor: const Color(0xFFF5F0FF),
    steps: [
      GuideStep(title: 'Step 1', content: 'Call emergency services immediately. Note the time symptoms started.'),
      GuideStep(title: 'Step 2', content: 'Have the person sit down and rest in a comfortable position (semi-upright is best).'),
      GuideStep(title: 'Step 3', content: 'If not allergic, give them an aspirin (325mg) to chew slowly.'),
      GuideStep(title: 'Step 4', content: 'Loosen any tight clothing. Keep the person calm and reassured.'),
      GuideStep(title: 'Step 5', content: 'If the person becomes unresponsive and stops breathing, begin CPR immediately.'),
    ],
  ),
];