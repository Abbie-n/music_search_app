part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
  
  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}
