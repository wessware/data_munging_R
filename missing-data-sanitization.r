{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "fe80b9f3",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-02-27T18:04:50.723888Z",
     "iopub.status.busy": "2023-02-27T18:04:50.720999Z",
     "iopub.status.idle": "2023-02-27T18:04:52.485864Z",
     "shell.execute_reply": "2023-02-27T18:04:52.483855Z"
    },
    "papermill": {
     "duration": 1.773799,
     "end_time": "2023-02-27T18:04:52.489501",
     "exception": false,
     "start_time": "2023-02-27T18:04:50.715702",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘mice’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    cbind, rbind\n",
      "\n",
      "\n",
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mmice\u001b[39m::filter(), \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    }
   ],
   "source": [
    "library(mice)\n",
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "1f8dc93e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:04:52.527150Z",
     "iopub.status.busy": "2023-02-27T18:04:52.496157Z",
     "iopub.status.idle": "2023-02-27T18:04:52.556066Z",
     "shell.execute_reply": "2023-02-27T18:04:52.554176Z"
    },
    "papermill": {
     "duration": 0.066671,
     "end_time": "2023-02-27T18:04:52.558612",
     "exception": false,
     "start_time": "2023-02-27T18:04:52.491941",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "titanic <- read.table(file = '/kaggle/input/r-visualization-datasets/dataset_NN.csv', header=TRUE, sep=',')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "0f849ae5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:04:52.566903Z",
     "iopub.status.busy": "2023-02-27T18:04:52.565068Z",
     "iopub.status.idle": "2023-02-27T18:04:52.626059Z",
     "shell.execute_reply": "2023-02-27T18:04:52.623842Z"
    },
    "papermill": {
     "duration": 0.067934,
     "end_time": "2023-02-27T18:04:52.628932",
     "exception": false,
     "start_time": "2023-02-27T18:04:52.560998",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t891 obs. of  11 variables:\n",
      " $ Survived: int  0 1 1 1 0 0 0 0 1 1 ...\n",
      " $ Pclass  : int  3 1 3 1 3 3 1 3 3 2 ...\n",
      " $ Name    : chr  \"Braund, Mr. Owen Harris\" \"Cumings, Mrs. John Bradley (Florence Briggs Thayer)\" \"Heikkinen, Miss. Laina\" \"Futrelle, Mrs. Jacques Heath (Lily May Peel)\" ...\n",
      " $ Sex     : chr  \"male\" \"female\" \"female\" \"female\" ...\n",
      " $ Age     : num  22 38 26 35 35 NA 54 2 27 14 ...\n",
      " $ SibSp   : int  1 1 0 1 0 0 0 3 0 1 ...\n",
      " $ Parch   : int  0 0 0 0 0 0 0 1 2 0 ...\n",
      " $ Ticket  : chr  \"A/5 21171\" \"PC 17599\" \"STON/O2. 3101282\" \"113803\" ...\n",
      " $ Fare    : num  7.25 71.28 7.92 53.1 8.05 ...\n",
      " $ Cabin   : chr  \"\" \"C85\" \"\" \"C123\" ...\n",
      " $ Embarked: chr  \"S\" \"C\" \"S\" \"S\" ...\n"
     ]
    }
   ],
   "source": [
    "str(titanic)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "e8726d3e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:04:52.638130Z",
     "iopub.status.busy": "2023-02-27T18:04:52.636282Z",
     "iopub.status.idle": "2023-02-27T18:04:52.655817Z",
     "shell.execute_reply": "2023-02-27T18:04:52.654097Z"
    },
    "papermill": {
     "duration": 0.026889,
     "end_time": "2023-02-27T18:04:52.658310",
     "exception": false,
     "start_time": "2023-02-27T18:04:52.631421",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>891</li><li>11</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 891\n",
       "\\item 11\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 891\n",
       "2. 11\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 891  11"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(titanic)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ac0c46f0",
   "metadata": {
    "papermill": {
     "duration": 0.002585,
     "end_time": "2023-02-27T18:04:52.663556",
     "exception": false,
     "start_time": "2023-02-27T18:04:52.660971",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.121777,
   "end_time": "2023-02-27T18:04:52.788804",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-27T18:04:46.667027",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
