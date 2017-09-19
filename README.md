## DataChats Content

This repository contains all the DataChats that are shown at www.datacamp.com/datachats. DataChats are videos where our instructor talk about their daily life as a Data Scientist.

This repository is linked as a "DataChats repository" in teach ([link](https://www.datacamp.com/teach/repositories/1500/branches/master)). Every YAML file that you add to the root of this repository, will be parsed as a DataChat by Teach and will be uploaded to the [standalone datachats app](https://github.com/datacamp/datachats).

### Fields in a DataChat

- `id`: the id of the DataChat in the standalone app. You should never specify this manually. On first upload, this id will be added by Teach, just like when you add new exercises to a course.
- `description`: A description of the DataChat.
- `projector_key`: A reference to the video inside the projector app. If you already have a projector key for you video, you can add it. Otherwise, do not specify this field. Instead, add a `video_hls_link` and/or `video_mp4_link`, depending on which one is available. If you specify these links, but don't specify a `projector_key`, the Teach app will automatically create a new projector record, and commit the `projector_key` to the YAML file itself.
- `thumbnail_link`: Link to a thumbnail (ideally on the `assets.datacamp.com` bucket, in the `projector-thumbnails` folder), that will show as a thumbnail on the video. (Note: there is an [open issue on the projector app to fall back on a default thumbnail](https://github.com/datacamp/projector/issues/129) - we will hopefully tackle this soon)
- `language`: Which language the DataChat is in.
- `topic`: Which topic the DataChat covers.
- `resources`: A list of resources (see `datachats1.yml` for some examples)
- `instructor` and `interviewer`: email addresses of the instructor and interviewer. These email addresses have to correspond to users on DataCamp.

### How to add a DataChat

This repository already contains some DataChats. To add a new one:

- Clone this repo. `git clone git@github.com:datacamp/datachats-content.git`
- Duplicate a `datachatX.yml` file that is already in this list, and give it a unique name.
- Inside the file:
   + Remove the `id` (so you don't have id collisions and you don't accidentally override a DataChat)
   + Update all fields; make sure to remove the `projector_key` explicitly when you are going to add `video_xyz_link` fields; otherwise you can have projector key collision as well.
- Add, commit and push the new files:

```bash
git add -A
git commit -m "add datachat X"
git push origin master
```

Your DataChat should now be visible at https://www.datacamp.com/datachats.
