import * as functions from "firebase-functions";

import * as sendEmail from "@sendgrid/mail";

const cors = require("cors")({ origin: true });

// const firebaseClient = require("firebase");

import * as admin from "firebase-admin";
admin.initializeApp();

exports.addMessage = functions.https.onRequest(function (req, res) {
  // Grab the text parameter.
  res.send("1");
});

exports.addMessage1 = functions.https.onRequest(function (req, res) {
  // Grab the text parameter.
  res.send("2");
});
// config message for sender, receiver
// sendEmail.setApiKey(functions.config().sendgrid?.key);
sendEmail.setApiKey(
  "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"
);

const msg = {
  to: "lythanhhait@gmail.com", // Change to your recipient
  from: "102190061@sv1.dut.udn.vn", // Change to your sender
  subject: "Welcome to your account",
  text: "This is your first email triggered by Cloud Functions",
};
// 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
exports.sendEmailToUser = functions.https.onRequest((req, res) => {
  sendEmail
    .send(msg)
    .then((response) => {
      console.log(response[0].statusCode);
      console.log(response[0].headers);
    })
    .catch((error) => {
      console.error(`Unable to send email. Error: ${error}`);
      throw new functions.https.HttpsError("aborted", "Unable to send email");
    });
});

// http callable
exports.sayHello = functions.https.onCall((data, context) => {
  return "hellu";
});

exports.getBook = functions.https.onCall(async (data, text) => {
  let listBook;
  await admin
    .firestore()
    .collection("users")
    .doc(data.id)
    .collection("books")
    .get()
    .then((res) => {
      console.log(res.docs[0].data());
      listBook = res.docs;
    })
    .catch((err) => console.log("err:" + err));
  return listBook;
});

exports.addBook = functions.https.onCall(async (data, text) => {
  await admin
    .firestore()
    .collection("books")
    .add({ nameBook: data.nameBook, desBook: data.desBook });
});

exports.addBook1 = functions.https.onRequest(async (req, res) => {
  cors(req, res, async () => {
    await admin
      .firestore()
      .collection("users")
      .doc(req.body.uid)
      .collection("books")
      .add({ nameBook: req.body.nameBook, desBook: req.body.desBook });
  });
});

exports.editBook = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    // json.decode(res.body);
    await admin
      .firestore()
      .collection("users")
      .doc(req.body.uid)
      .collection("books")
      .doc(req.body.bookId)
      .update({ nameBook: req.body.nameBook, desBook: req.body.desBook });
  });
});

exports.editBook1 = functions.https.onCall(async (data, context) => {
  await admin
    .firestore()
    .collection("books")
    .doc(data.bookId)
    .update({ nameBook: data.nameBook, desBook: data.desBook });
});

exports.deleteBook = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    await admin
      .firestore()
      .collection("users")
      .doc(req.body.uid)
      .collection("books")
      .doc(req.body.bookId)
      .delete();
  });
});

//

// exports.login = functions.https.onRequest((req, res) => {
//   cors(req, res, () => {
//     firebaseClient.auth().signInWithEmailAndPassword({
//       email: req.body.username,
//       password: req.body.password,
//     });
//   });
// });

exports.signup = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    admin
      .auth()
      .createUser({ email: req.body.username, password: req.body.password })
      .then((userCredential) => {
        // Signed in
        var user = userCredential;
        // ...
        res.status(200).send(user);
      })
      .catch((error) => {
        res.status(500).send({
          errCode: error.code,
          errMessage: error.message,
        });
      });
  });
});

exports.saveUserAfterLogin = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    var user = admin.firestore().collection("users").doc(req.body.id);
    if ((await user.get()).exists) {
      res.status(200).send("User is existed!");
    } else {
      await admin.firestore().collection("users").add({
        id: req.body.id,
        email: req.body.email,
        roles: req.body.roles,
      });
      res.status(200).send("Add user successfully!!!");
    }
  });
});

// exports.getCurrentUser

// authentication trigger
exports.saveUser = functions.auth.user().onCreate((user) => {
  console.log(user);
});

exports.deleteUser = functions.auth.user().onDelete((user) => {
  console.log(user);
});

// firestore trigger
exports.addedBook = functions.firestore
  .document("books/{documentId}")
  .onCreate((snapshot, context) => {});

exports.updatedBook = functions.firestore
  .document("books/{documentId}")
  .onUpdate((snapshot, context) => {});

exports.deletedBook = functions.firestore
  .document("books/{documentId}")
  .onDelete((snapshot, context) => {});

exports.triggerWithBook = functions.firestore
  .document("books/{documentId}")
  .onWrite((snapshot, context) => {});
