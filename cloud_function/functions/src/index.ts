// The Cloud Functions for Firebase SDK to create
// Cloud Functions and set up triggers.
import * as functions from "firebase-functions";
// import send email
import * as sendEmail from "@sendgrid/mail";

const cors = require("cors")({ origin: true });

// The Firebase Admin SDK to access Firestore.
import * as admin from "firebase-admin";
admin.initializeApp();
// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// Take the text parameter passed to this HTTP endpoint and insert it into
// Firestore under the path /messages/:documentId/original
// http request endpoint
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

exports.addBook = functions.https.onCall(async (data, text) => {
  const writeResult = await admin
    .firestore()
    .collection("books")
    .add({ nameBook: data.nameBook, desBook: data.desBook });
});

exports.addBook1 = functions.https.onRequest(async (req, res) => {
  // const writeResult = await admin
  //   .firestore()
  //   .collection("books")
  //   .add({ nameBook: req.body.nameBook, desBook: req.body.desBook });
  cors(req, res, async () => {
    // your function body here - use the provided req and res from cors
    // console.log(req.body);
    // console.log(req.method);
    // res.send("Add successfully: " + req.body["nameBook"]);
    const writeResult = await admin
      .firestore()
      .collection("books")
      .add({ nameBook: req.body.nameBook, desBook: req.body.desBook });
  });
});

exports.editBook = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    // json.decode(res.body);
    const writeResult = await admin
      .firestore()
      .collection("books")
      .doc(req.body.bookId)
      .update({ nameBook: req.body.nameBook, desBook: req.body.desBook });
  });
});

exports.deleteBook = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    const writeResult = await admin
      .firestore()
      .collection("books")
      .doc(req.body.bookId)
      .delete();
  });
});
