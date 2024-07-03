class DetectedObject {
  final String label;
  final double confidence;
  final double x;
  final double y;
  final double w;
  final double h;

  DetectedObject({
    required this.label,
    required this.confidence,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  // Factory method to create a DetectedObject from a Map
  factory DetectedObject.fromMap(Map<String, dynamic> map) {
    return DetectedObject(
      label: map['label'] ?? '',
      confidence: map['confidence']?.toDouble() ?? 0.0,
      x: map['x']?.toDouble() ?? 0.0,
      y: map['y']?.toDouble() ?? 0.0,
      w: map['w']?.toDouble() ?? 0.0,
      h: map['h']?.toDouble() ?? 0.0,
    );
  }

  // Method to convert a DetectedObject to a Map
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'confidence': confidence,
      'x': x,
      'y': y,
      'w': w,
      'h': h,
    };
  }
}
