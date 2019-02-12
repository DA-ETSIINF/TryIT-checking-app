class TicketModel {
  final int session_id;
  final int ticket_id;
  final String ticket_signature;
  final DateTime timestamp;
  final int validator_id;
  final String validator_signature;

  TicketModel(
  {this.session_id, this.ticket_id, this.ticket_signature, this.timestamp,
      this.validator_id, this.validator_signature}
      );


  factory TicketModel.fromJsonMap(Map<String, dynamic> map){
    return TicketModel(
      session_id: map['session'],
      ticket_id:  map['ticket_id'],
      ticket_signature: map['ticket_signature'],
      timestamp: map['timestamp'],
      validator_id: map['validator_id'],
      validator_signature: map['signature'],
    );
  }
}x