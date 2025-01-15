import Ajv from "ajv";

import schema from "./schema/chancellor.json" with { type: "json" };

const ajv = new Ajv();
const chancellorValidate = ajv.compile(schema);

export const validate = (message) => {
  const valid = chancellorValidate(message);

  const response = { valid };
  if (!valid) {
    response["errors"] = chancellorValidate.errors;
  }

  return response;
};
