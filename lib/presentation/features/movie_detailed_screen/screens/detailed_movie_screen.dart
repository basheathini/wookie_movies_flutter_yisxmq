import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/theme/colors.dart';
import 'package:wookie_movies_flutter_yisxmq/shared/theme/styles.dart';
import '../../../../business/entities/movie.dart';
import '../../../../shared/utils/helper_functions.dart';

class DetailedMovieScreen extends StatelessWidget {
  final Movie? movie;

  const DetailedMovieScreen({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 500,
                width: deviceSize.width,
                child: CachedNetworkImage(
                  imageUrl: movie?.poster ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 15,
                        height: 15,
                        child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${movie?.title ?? ''}${ '  (${movie!.imdb_rating.toStringAsFixed(1)})'}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyles.text.copyWith(fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(formatMovieOverview(movie))),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) => const Icon( Icons.star_border,
                color: black,
              )),
            ),
            const SizedBox(height: 10),
            Text(
              'Cast: ${movie?.cast.join(', ')}',
            ),
            const Divider(height: 40),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(movie?.overview ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }
}