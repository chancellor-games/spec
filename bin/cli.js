import { readFileSync } from "node:fs";

import { program } from "commander";

import { validate } from "../index.js";
import pkg from "../package.json" with { type: "json" };

program.version(pkg.version);

program
  .command("validate")
  .argument("<files...>")
  .action((files) => {
    files.forEach((file) => {
      const message = JSON.parse(readFileSync(file, "utf-8"));
      const result = validate(message);
      console.log(result);
    });
  });

program.parse();
