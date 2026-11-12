# Lab 08: Knowledge check

## 1. Slurm: what jobs have I submitted?

**Your task:** Print a history of all your Slurm job submissions since November 4, 2026, including the job ID, job name, node list, partition, account, user, state, start time, and elapsed time. Save the output in `results/job-history.txt`.

**Your answer:**

```bash
sacct -S 2026-11-04 -X --format=JobID,JobName,NodeList,Partition,Account,User,State,Start,Elapsed > results/job-history.txt
```

This command saves my Slurm job history to `results/job-history.txt`, including the requested job information.

## 2. Slurm: did every array task run at the same time?

**Your task:** Compare the start times and elapsed times of the tasks in your most recent completed job array.

**Your answer:**

No, the array tasks did not all start at the same time. Looking at my completed job array (22830696), tasks 1 and 2 both started at 17:58:11 on November 11, while tasks 3 through 8 started at 18:00:27. Tasks 9 through 12 started at 18:01:10. This shows that Slurm scheduled tasks in groups rather than starting all 101 simultaneously.

The elapsed times also varied slightly. For example, task 1 took 16 seconds, task 2 took 17 seconds, and task 7 took 14 seconds. This makes sense because each book requires a different amount of processing, and Slurm schedules tasks based on available GPU resources.

## 3. Slurm: did my job use what it asked for?

**Your task:** Run `seff` for one completed task and save its output in `results/seff.txt`. Compare the actual memory and runtime with the resources requested in `summarize.slurm`.

**Your answer:**

My Slurm script requested 16 GB of memory, 2 CPU cores, 1 GPU, and a maximum runtime of 5 minutes per task.

According to the `seff` output for task 22830696_1, the task used 2.69 GB of memory, which is only 16.81% of the requested 16 GB. Its wall-clock time was 16 seconds, much less than the requested 5-minute limit. The task also had a CPU efficiency of 28.12%.

Based on these results, I would reduce the requested memory to around 4–8 GB to avoid reserving more resources than necessary. I would also consider reducing the runtime limit, although I would leave some extra time for longer books or slower model execution.

For a larger array of 1,000 books, choosing more appropriate resource requests could improve scheduling efficiency and reduce unnecessary resource allocation.
