import 'package:app/app_colors.dart';
import 'package:app/musicpage.dart';
import '../../controller/audio_contoller.dart';
import 'package:app/data/models/local_song_model.dart';
import 'package:app/helpers/widget/my_button.dart';
import 'package:app/helpers/widget/my_container.dart';
import 'package:flutter/material.dart';

class SongsListsItems extends StatefulWidget {
  final LocalSongModel song;
  final index;
  const SongsListsItems({super.key,required this.song,required this.index});

  @override
  State<SongsListsItems> createState() => _SongsListsItemsState();
}

class _SongsListsItemsState extends State<SongsListsItems> {
  String _formateDuration(int miliseconds) {
    final minutes = (miliseconds / 60000).floor();
    final second = ((miliseconds % 60000) / 1000).floor();
    return "$minutes:${second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final audioController = AudioController();
    return ValueListenableBuilder(
        valueListenable: audioController.currentIndex,
        builder: (context, currentIndex, child) {
          return ValueListenableBuilder(
              valueListenable: audioController.isPlaying,
              builder: (context, isPlaying, child) {
                final isCurrentSong = currentIndex == widget.index;
                return Padding(padding: EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 6.0
                ),
                  child: MyContainer(child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: Icon(Icons.music_note, color: Colors.white,),
                    ),
                    title: Text(
                      widget.song.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      widget.song.artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_formateDuration(widget.song.duration),),
                        SizedBox(width: 8),
                        MyButton(child:Icon(isCurrentSong && isPlaying
                            ? Icons.pause_rounded:Icons.play_arrow_rounded,
                          color: isCurrentSong && isPlaying
                              ? AppColors.darkbackground
                              :Colors.yellow,
                          size: 27,
                        ),
                            onPress:audioController.togglePlayPause
                        ),
                      ],
                    ),
                    onTap: (){
                      audioController.playSong(widget.index);
                    },

                    ),
                  ),
                );
              });
        }
    );
  }
}