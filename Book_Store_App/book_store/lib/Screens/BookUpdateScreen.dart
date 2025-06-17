import 'package:book_store_app/Models/Book.dart';
import 'package:book_store_app/Services/BookRemoteServices.dart';
import 'package:flutter/material.dart';


class BookUpdateScreen extends StatefulWidget {
  final Book book;
  

  const BookUpdateScreen({
    Key? key,
    required this.book,
    
  }) : super(key: key);

  @override
  _BookUpdateScreenState createState() => _BookUpdateScreenState();
}

class _BookUpdateScreenState extends State<BookUpdateScreen> {
  late final TextEditingController _authorController;
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  late final TextEditingController _coverPageUrlController;
  late final TextEditingController _yearController;
  late final TextEditingController _genreController;
  late final TextEditingController _languageController;
  late final TextEditingController _pagesController;
  late final TextEditingController _publisherController;
  late final TextEditingController _ratingController;
  late final TextEditingController _addedByController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current book values
    _authorController = TextEditingController(text: widget.book.author);
    _titleController = TextEditingController(text: widget.book.title);
    _descController = TextEditingController(text: widget.book.desc);
    _coverPageUrlController = TextEditingController(text: widget.book.coverPageUrl);
    _yearController = TextEditingController(text: widget.book.year.toString());
    _genreController = TextEditingController(text: widget.book.genre);
    _languageController = TextEditingController(text: widget.book.language);
    _pagesController = TextEditingController(text: widget.book.pages.toString());
    _publisherController = TextEditingController(text: widget.book.publisher);
    _ratingController = TextEditingController(text: widget.book.rating.toString());
    _addedByController =TextEditingController(text: widget.book.addedBy);
  }

  @override
  void dispose() {
    // Clean up controllers
    _authorController.dispose();
    _titleController.dispose();
    _descController.dispose();
    _coverPageUrlController.dispose();
    _yearController.dispose();
    _genreController.dispose();
    _languageController.dispose();
    _pagesController.dispose();
    _publisherController.dispose();
    _ratingController.dispose();
    _addedByController.dispose;
    super.dispose();
  }

  Future<void> _updateBook() async {
    // Create updated book object
    final updatedBook = Book(
      id: widget.book.id,
      author: _authorController.text,
      addedBy: _addedByController.text, // Preserve original addedBy
      title: _titleController.text,
      desc: _descController.text,
      coverPageUrl: _coverPageUrlController.text,
      year: int.tryParse(_yearController.text) ?? widget.book.year,
      genre: _genreController.text,
      language: _languageController.text,
      pages: int.tryParse(_pagesController.text) ?? widget.book.pages,
      publisher: _publisherController.text,
      rating: double.tryParse(_ratingController.text) ?? widget.book.rating,
    );
    bool isUpdated = await Bookremoteservices().updateBook(updatedBook);
    if(isUpdated)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Book Updates Successfully")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update book")));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Book Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _updateBook,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(_authorController, 'Author'),
            _buildTextField(_titleController, 'Title'),
            _buildTextField(_descController, 'Description', maxLines: 3),
            _buildTextField(_coverPageUrlController, 'Cover Page URL'),
            _buildNumberField(_yearController, 'Year'),
            _buildTextField(_genreController, 'Genre'),
            _buildTextField(_languageController, 'Language'),
            _buildNumberField(_pagesController, 'Pages'),
            _buildTextField(_publisherController, 'Publisher'),
            _buildNumberField(_ratingController, 'Rating', isDouble: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label, {bool isDouble = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.numberWithOptions(
          decimal: isDouble,
          signed: false,
        ),
      ),
    );
  }
}