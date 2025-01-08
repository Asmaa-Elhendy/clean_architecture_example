import 'package:clean_architecture_project/features/posts/presentation/bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdate;
  final Post? post;
  FormWidget({required this.isUpdate, this.post, super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  void validateFormThenAddOrUpdate() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      final post = Post(
          id: widget.isUpdate ? widget.post!.id : null,
          title: _titleController.text,
          body: _bodyController.text);

      if (widget.isUpdate) {
        BlocProvider.of<AddUpdateDeletePostsBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddUpdateDeletePostsBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: "Title"),
                  validator: (val) =>
                      val!.isEmpty ? "Title cannot be empty" : null,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  controller: _bodyController,
                  maxLines: 6,
                  validator: (val) =>
                      val!.isEmpty ? "Body cannot be empty" : null,
                  decoration: InputDecoration(hintText: "Body"),
                ),
              ),
              ElevatedButton.icon(
                onPressed: validateFormThenAddOrUpdate,
                label: Text(widget.isUpdate ? "Update" : "Add"),
                icon: widget.isUpdate ? Icon(Icons.update) : Icon(Icons.add),
              )
            ],
          )),
    );
  }
}
