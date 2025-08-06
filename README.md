📁 SecureShare - Secure File Upload and Sharing System
SecureShare is a Ruby on Rails 8 application that allows verified users to securely upload, manage, and share large files (up to 1GB). Each file is private by default, and users can generate a public tiny URL to share selected files externally.

✅ Features
🔒 User Authentication (Devise)

📤 Upload large files (up to 1GB)

📝 Title and description for each file

🔍 File type detection

📦 Optional file compression (zip)

🔐 Private file listing per user

🗑️ File deletion

🔗 Public sharing via tiny URL



🧰 Tech Stack
Ruby 3.2.2

Rails 8.0.2

PostgreSQL (Database)

Active Storage (for file uploads)

Devise (User authentication)

FriendlyId (for slugs)

RubyZip (for compression)




🚀 Getting Started

1. Clone the repository
bash:
git clone https://github.com/your-username/secureshare.git
cd secureshare


2. Install dependencies
bash:
bundle install


3. Setup database
Make sure PostgreSQL is running. Then:

bash:
rails db:create
rails db:migrate


4. Setup Active Storage
If not done automatically:

bash:
rails active_storage:install
rails db:migrate


5. Start the Rails server
bash:
rails server
Visit http://localhost:3000


👤 User Authentication

We are using Devise for login/signup.

To manually create users (in development):

bash:
rails console

User.create!(
  email: "test@example.com",
  password: "password",
  password_confirmation: "password"
)



🛠️ Routes Reference
You can see all available routes using:

bash:
rails routes
Key routes:

Action	            HTTP Verb	            Path	                Description

Sign up	            GET/POST	        /users/sign_up	            Devise registration
Log in	            GET/POST	        /users/sign_in	            Devise session
Upload file (new)	GET	                /file_uploads/new	        Show file upload form
Create file	        POST	            /file_uploads	            Upload file with metadata
List my files	    GET	                /file_uploads	            List of uploaded files for current user
Delete file	        DELETE	            /file_uploads/:id	        Delete a file (only by owner)
Public view	        GET	                /s/:slug	                Public file access via slug URL



📎 File Model Info
Each uploaded file has:

title – string

description – text

file – attached binary

compressed_file – optional compressed zip

file_type – detected type (e.g., PDF, Image, etc.)

slug – unique public sharing token



🧪 Example Workflow

Register/Login via /users/sign_in

Upload a file via /file_uploads/new (max 1GB)

View your uploads at /file_uploads

Delete a file via the delete icon or link

Share a file using the generated slug /s/abcd1234