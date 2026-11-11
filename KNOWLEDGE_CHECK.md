# Lab 08: Knowledge check

## 1. Slurm: what jobs have I submitted?

**Your task:** Print a history of all your Slurm job submissions since November 4, 2026, including the job ID, job name, node list, partition, account, user, state, start time, and elapsed time. Save the output in `results/job-history.txt`.

**Your answer:**

`	sacct -S 2026-11-04 -X --format=JobID,JobName,NodeList,Partition,Account,User,State,Start,Elapsed > results/job-history.txt`

## 2. Slurm: did every array task run at the same time?

**Your task:** Compare the start times and elapsed times of the tasks in your most recent completed job array.

**Your answer:**

[Complete after the full array finishes.] Slurm schedules each array task independently based on available GPU resources and scheduling priority, so the tasks are not guaranteed to start simultaneously. The elapsed time may also differ between tasks because different books require different amounts of processing. My job history shows that the tasks started [at the same time / at different times] and had [identical / different] elapsed times.

## 3. Slurm: did my job use what it asked for?

**Your task:** Run `seff` for one completed task and save its output in `results/seff.txt`. Compare the actual memory and runtime with the resources requested in `summarize.slurm`.

**Your answer:**

My Slurm script requested 16 GB of memory and a maximum runtime of 5 minutes per task. According to `seff`, the task actually used [MEMORY UTILIZED] of memory and ran for [WALL-CLOCK TIME]. Based on this usage, I would [KEEP OR ADJUST] the memory allocation and [KEEP OR ADJUST] the time limit because [EXPLAIN BASED ON ACTUAL RESOURCE USAGE]. For a larger array of 1,000 books, I would also account for differences in processing requirements between books.
