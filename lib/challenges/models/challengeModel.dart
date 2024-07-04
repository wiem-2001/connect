class Challenge {
  final String title;
  final String description;
  final String dueDate;
  final double percentageComplete;
  final int points;
  bool isActive= false;

  Challenge(
  this.title,
  this.description, 
  this.dueDate, 
  this.percentageComplete, 
  this.points,
  this.isActive , 
  );
}