import { RecruiterProcessTechnology } from "./recruiter-process-technology.model";

export class RecruiterProcess {

  constructor(){ }

  recruiterProcessId: number;
  description: string;
  parentTechnologyId: number;
  parentTechnologyName: string;
  technologies: RecruiterProcessTechnology[];
}