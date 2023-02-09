create table "public"."blog_posts" (
    "file_name" text not null,
    "title" text
);


create table "public"."comments" (
    "id" bigint generated by default as identity not null,
    "blog_post" text not null,
    "content" text not null,
    "user_id" uuid not null,
    "date" date not null
);


CREATE UNIQUE INDEX blog_posts_pkey ON public.blog_posts USING btree (file_name);

CREATE UNIQUE INDEX comments_pkey ON public.comments USING btree (id);

alter table "public"."blog_posts" add constraint "blog_posts_pkey" PRIMARY KEY using index "blog_posts_pkey";

alter table "public"."comments" add constraint "comments_pkey" PRIMARY KEY using index "comments_pkey";

alter table "public"."comments" add constraint "comments_blog_post_fkey" FOREIGN KEY (blog_post) REFERENCES blog_posts(file_name) not valid;

alter table "public"."comments" validate constraint "comments_blog_post_fkey";

alter table "public"."comments" add constraint "comments_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."comments" validate constraint "comments_user_id_fkey";


