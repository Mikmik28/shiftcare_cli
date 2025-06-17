# ShiftCare CLI Technical Challenge

This Ruby-based command-line application processes client data from a JSON source (URL). It provides the following features:

- 🔍 **Search**: Find clients with names that partially match a given query.
- 🔁 **Duplicates**: Identify clients with duplicate email addresses.

---

## 🛠 Setup Instructions

### 1. Requirements

- Ruby 2.7+
- Bundler

### 2. Install Dependencies

```bash
bundle install
```

## 🚀 Usage

### 🔍 Search by Name

```bash
ruby bin/main.rb search <url_or_file_path> <query>
```

Example (from URL):

```bash
ruby bin/main.rb search https://appassets02.shiftcare.com/manual/clients.json smith
```

### 🔁 Find Duplicate Emails

```bash
ruby bin/main.rb duplicates <json_url>
```

Example:

```bash
ruby bin/main.rb duplicates https://appassets02.shiftcare.com/manual/clients.json
```

## ✅ Assumptions and Decisions Made

✅ The JSON source is only loaded via a public URL, not a local file.

✅ JSON is an array of objects, each with at least full_name and email fields.

✅ full_name is split into first_name and last_name at the first space.

✅ Searches are case-insensitive and based on full_name.

✅ Duplicates are matched by exact email equality (case-sensitive).

✅ The application is structured into modules for testability and maintainability.

## ⚠️ Known Limitations

❌ No support for local file input (by design).

❌ No pagination, sorting, or filtering features.

❌ Only full_name is searchable (no dynamic field selection yet).

❌ No colored or formatted CLI output — plain text only.

## ⏭ Areas for Future Improvement

### Architecture Enhancements

- Refactor CLI argument parsing using OptionParser or Thor.
- Add logging and error handling layers.

### Features to Prioritize

🔄 Search any field (not just full_name)

💾 Cache or locally persist large JSON files

🌐 Add pagination, sorting, and filtering for results

📦 Export matched results to CSV or JSON

🚀 Convert to a Rails REST API with PostgreSQL backend

🧪 Add integration and CLI feature tests
