// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import SortingTable from "utilities/sorting_table.js";
window.SortingTable = SortingTable;
import PasswordConfirmation from "utilities/show_passwords_match.js";
window.PasswordConfirmation = PasswordConfirmation;
import "utilities/sorting_connect.js";
import "utilities/password_confirmation_connect.js";
import "utilities/form_inline.js";
import "utilities/test_progress_bar.js"

require('jquery')

Rails.start();
Turbolinks.start();
ActiveStorage.start();
