{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "3d5bc4d2",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:10.966050Z",
     "iopub.status.busy": "2023-02-28T08:14:10.963623Z",
     "iopub.status.idle": "2023-02-28T08:14:13.394585Z",
     "shell.execute_reply": "2023-02-28T08:14:13.392830Z"
    },
    "papermill": {
     "duration": 2.440647,
     "end_time": "2023-02-28T08:14:13.396995",
     "exception": false,
     "start_time": "2023-02-28T08:14:10.956348",
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
      "Loading required package: lattice\n",
      "\n",
      "Loading required package: survival\n",
      "\n",
      "Loading required package: Formula\n",
      "\n",
      "Loading required package: ggplot2\n",
      "\n",
      "\n",
      "Attaching package: ‘Hmisc’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    format.pval, units\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(mice)\n",
    "library(Hmisc)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "044c23fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:13.436553Z",
     "iopub.status.busy": "2023-02-28T08:14:13.407571Z",
     "iopub.status.idle": "2023-02-28T08:14:14.278160Z",
     "shell.execute_reply": "2023-02-28T08:14:14.276373Z"
    },
    "papermill": {
     "duration": 0.878674,
     "end_time": "2023-02-28T08:14:14.280596",
     "exception": false,
     "start_time": "2023-02-28T08:14:13.401922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1      \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m    masks \u001b[34mmice\u001b[39m::filter(), \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m       masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32msrc()\u001b[39m       masks \u001b[34mHmisc\u001b[39m::src()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32msummarize()\u001b[39m masks \u001b[34mHmisc\u001b[39m::summarize()\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "7e970292",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.293173Z",
     "iopub.status.busy": "2023-02-28T08:14:14.291281Z",
     "iopub.status.idle": "2023-02-28T08:14:14.321981Z",
     "shell.execute_reply": "2023-02-28T08:14:14.320141Z"
    },
    "papermill": {
     "duration": 0.039107,
     "end_time": "2023-02-28T08:14:14.324258",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.285151",
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
   "execution_count": 4,
   "id": "a1562473",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.336340Z",
     "iopub.status.busy": "2023-02-28T08:14:14.334832Z",
     "iopub.status.idle": "2023-02-28T08:14:14.370379Z",
     "shell.execute_reply": "2023-02-28T08:14:14.368601Z"
    },
    "papermill": {
     "duration": 0.043858,
     "end_time": "2023-02-28T08:14:14.372620",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.328762",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Survived</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>Age</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0</td><td>3</td><td>Braund, Mr. Owen Harris                            </td><td>male  </td><td>22</td><td>1</td><td>0</td><td>A/5 21171       </td><td> 7.2500</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>Cumings, Mrs. John Bradley (Florence Briggs Thayer)</td><td>female</td><td>38</td><td>1</td><td>0</td><td>PC 17599        </td><td>71.2833</td><td>C85 </td><td>C</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>3</td><td>Heikkinen, Miss. Laina                             </td><td>female</td><td>26</td><td>0</td><td>0</td><td>STON/O2. 3101282</td><td> 7.9250</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td>Futrelle, Mrs. Jacques Heath (Lily May Peel)       </td><td>female</td><td>35</td><td>1</td><td>0</td><td>113803          </td><td>53.1000</td><td>C123</td><td>S</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0</td><td>3</td><td>Allen, Mr. William Henry                           </td><td>male  </td><td>35</td><td>0</td><td>0</td><td>373450          </td><td> 8.0500</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0</td><td>3</td><td>Moran, Mr. James                                   </td><td>male  </td><td>NA</td><td>0</td><td>0</td><td>330877          </td><td> 8.4583</td><td>    </td><td>Q</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 11\n",
       "\\begin{tabular}{r|lllllllllll}\n",
       "  & Survived & Pclass & Name & Sex & Age & SibSp & Parch & Ticket & Fare & Cabin & Embarked\\\\\n",
       "  & <int> & <int> & <chr> & <chr> & <dbl> & <int> & <int> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 0 & 3 & Braund, Mr. Owen Harris                             & male   & 22 & 1 & 0 & A/5 21171        &  7.2500 &      & S\\\\\n",
       "\t2 & 1 & 1 & Cumings, Mrs. John Bradley (Florence Briggs Thayer) & female & 38 & 1 & 0 & PC 17599         & 71.2833 & C85  & C\\\\\n",
       "\t3 & 1 & 3 & Heikkinen, Miss. Laina                              & female & 26 & 0 & 0 & STON/O2. 3101282 &  7.9250 &      & S\\\\\n",
       "\t4 & 1 & 1 & Futrelle, Mrs. Jacques Heath (Lily May Peel)        & female & 35 & 1 & 0 & 113803           & 53.1000 & C123 & S\\\\\n",
       "\t5 & 0 & 3 & Allen, Mr. William Henry                            & male   & 35 & 0 & 0 & 373450           &  8.0500 &      & S\\\\\n",
       "\t6 & 0 & 3 & Moran, Mr. James                                    & male   & NA & 0 & 0 & 330877           &  8.4583 &      & Q\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 11\n",
       "\n",
       "| <!--/--> | Survived &lt;int&gt; | Pclass &lt;int&gt; | Name &lt;chr&gt; | Sex &lt;chr&gt; | Age &lt;dbl&gt; | SibSp &lt;int&gt; | Parch &lt;int&gt; | Ticket &lt;chr&gt; | Fare &lt;dbl&gt; | Cabin &lt;chr&gt; | Embarked &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0 | 3 | Braund, Mr. Owen Harris                             | male   | 22 | 1 | 0 | A/5 21171        |  7.2500 | <!----> | S |\n",
       "| 2 | 1 | 1 | Cumings, Mrs. John Bradley (Florence Briggs Thayer) | female | 38 | 1 | 0 | PC 17599         | 71.2833 | C85  | C |\n",
       "| 3 | 1 | 3 | Heikkinen, Miss. Laina                              | female | 26 | 0 | 0 | STON/O2. 3101282 |  7.9250 | <!----> | S |\n",
       "| 4 | 1 | 1 | Futrelle, Mrs. Jacques Heath (Lily May Peel)        | female | 35 | 1 | 0 | 113803           | 53.1000 | C123 | S |\n",
       "| 5 | 0 | 3 | Allen, Mr. William Henry                            | male   | 35 | 0 | 0 | 373450           |  8.0500 | <!----> | S |\n",
       "| 6 | 0 | 3 | Moran, Mr. James                                    | male   | NA | 0 | 0 | 330877           |  8.4583 | <!----> | Q |\n",
       "\n"
      ],
      "text/plain": [
       "  Survived Pclass Name                                                Sex   \n",
       "1 0        3      Braund, Mr. Owen Harris                             male  \n",
       "2 1        1      Cumings, Mrs. John Bradley (Florence Briggs Thayer) female\n",
       "3 1        3      Heikkinen, Miss. Laina                              female\n",
       "4 1        1      Futrelle, Mrs. Jacques Heath (Lily May Peel)        female\n",
       "5 0        3      Allen, Mr. William Henry                            male  \n",
       "6 0        3      Moran, Mr. James                                    male  \n",
       "  Age SibSp Parch Ticket           Fare    Cabin Embarked\n",
       "1 22  1     0     A/5 21171         7.2500       S       \n",
       "2 38  1     0     PC 17599         71.2833 C85   C       \n",
       "3 26  0     0     STON/O2. 3101282  7.9250       S       \n",
       "4 35  1     0     113803           53.1000 C123  S       \n",
       "5 35  0     0     373450            8.0500       S       \n",
       "6 NA  0     0     330877            8.4583       Q       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(titanic)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "d6a34335",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.385323Z",
     "iopub.status.busy": "2023-02-28T08:14:14.383613Z",
     "iopub.status.idle": "2023-02-28T08:14:14.413047Z",
     "shell.execute_reply": "2023-02-28T08:14:14.411080Z"
    },
    "papermill": {
     "duration": 0.038021,
     "end_time": "2023-02-28T08:14:14.415405",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.377384",
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
   "execution_count": 6,
   "id": "2302783d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.427940Z",
     "iopub.status.busy": "2023-02-28T08:14:14.426450Z",
     "iopub.status.idle": "2023-02-28T08:14:14.445489Z",
     "shell.execute_reply": "2023-02-28T08:14:14.443340Z"
    },
    "papermill": {
     "duration": 0.02815,
     "end_time": "2023-02-28T08:14:14.448238",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.420088",
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
   "execution_count": 7,
   "id": "1c9a28ee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.460982Z",
     "iopub.status.busy": "2023-02-28T08:14:14.459463Z",
     "iopub.status.idle": "2023-02-28T08:14:14.478201Z",
     "shell.execute_reply": "2023-02-28T08:14:14.476083Z"
    },
    "papermill": {
     "duration": 0.027903,
     "end_time": "2023-02-28T08:14:14.480961",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.453058",
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
       "<ol class=list-inline><li>'Survived'</li><li>'Pclass'</li><li>'Name'</li><li>'Sex'</li><li>'Age'</li><li>'SibSp'</li><li>'Parch'</li><li>'Ticket'</li><li>'Fare'</li><li>'Cabin'</li><li>'Embarked'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Survived'\n",
       "\\item 'Pclass'\n",
       "\\item 'Name'\n",
       "\\item 'Sex'\n",
       "\\item 'Age'\n",
       "\\item 'SibSp'\n",
       "\\item 'Parch'\n",
       "\\item 'Ticket'\n",
       "\\item 'Fare'\n",
       "\\item 'Cabin'\n",
       "\\item 'Embarked'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Survived'\n",
       "2. 'Pclass'\n",
       "3. 'Name'\n",
       "4. 'Sex'\n",
       "5. 'Age'\n",
       "6. 'SibSp'\n",
       "7. 'Parch'\n",
       "8. 'Ticket'\n",
       "9. 'Fare'\n",
       "10. 'Cabin'\n",
       "11. 'Embarked'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Survived\" \"Pclass\"   \"Name\"     \"Sex\"      \"Age\"      \"SibSp\"   \n",
       " [7] \"Parch\"    \"Ticket\"   \"Fare\"     \"Cabin\"    \"Embarked\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(titanic)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "6b61c340",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.494101Z",
     "iopub.status.busy": "2023-02-28T08:14:14.492554Z",
     "iopub.status.idle": "2023-02-28T08:14:14.781512Z",
     "shell.execute_reply": "2023-02-28T08:14:14.778865Z"
    },
    "papermill": {
     "duration": 0.298353,
     "end_time": "2023-02-28T08:14:14.784362",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.486009",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 3 × 12 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Survived</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th><th scope=col>Age</th><th scope=col></th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>714</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>  1</td><td>  0</td></tr>\n",
       "\t<tr><th scope=row>177</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>  0</td><td>  1</td></tr>\n",
       "\t<tr><th scope=row></th><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>177</td><td>177</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 3 × 12 of type dbl\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & Survived & Pclass & Name & Sex & SibSp & Parch & Ticket & Fare & Cabin & Embarked & Age & \\\\\n",
       "\\hline\n",
       "\t714 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 &   1 &   0\\\\\n",
       "\t177 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 &   0 &   1\\\\\n",
       "\t & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 177 & 177\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 3 × 12 of type dbl\n",
       "\n",
       "| <!--/--> | Survived | Pclass | Name | Sex | SibSp | Parch | Ticket | Fare | Cabin | Embarked | Age | <!----> |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 714 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |   1 |   0 |\n",
       "| 177 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |   0 |   1 |\n",
       "| <!----> | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 177 | 177 |\n",
       "\n"
      ],
      "text/plain": [
       "    Survived Pclass Name Sex SibSp Parch Ticket Fare Cabin Embarked Age    \n",
       "714 1        1      1    1   1     1     1      1    1     1          1   0\n",
       "177 1        1      1    1   1     1     1      1    1     1          0   1\n",
       "    0        0      0    0   0     0     0      0    0     0        177 177"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nSqnvdn0btmRLejT8O5+D3PzMi9Xi6srz81asfMC9543a7MyLD3k+bXHWA8cMbcsw+U+16EXK\num11SL+ujbesdcQx6XtPvvP7d9K3G96CJK9rLq3ceMzKFQtd1ehj0xlPvv6rt9Ihzb0Zx8Jv\nd5Iy2dJeg4Yc/J3T6xd2ynthND5P8zwdvrF134V2yLbzrzzkM0btnA/2Gb7jAx/PSim9MXte\nw/ZltHQbrLT6+VPf/sGS/rcNx7zdBs6U9C/Jfjrn/Ty/kHxGzXOd16uo6DVz5pQbP545uu+C\ni1w2uMfpk5suj/xviPIZI/8bwCZ3SUuzhOrvYtY7a9/GO2RL+p28ctHJb83rvfOllV+9PLfP\nJpf0L/3dx2+c98SXZ46sKk0pzfr4d5/OrV1ru9GNL1u1yrd7lpxcnfcAi/0CaU5Hl2XHqK6u\nrqmZt+j2ebPf/f6oASml9U99qn5Lno/Y3fvFIu+JUDdnk6rSspW2rv/Z6rC+XctWGtXwuPJC\nz8Usec9Zn9zczPdu85+9mMvlXvnFVimlfR6/NS38jNWDBw9OKf3989kNWz56as+U0qglPzqS\nW/gRu7kzXzn7iJ17lBallDLZkgFrrLv7wd9MjX46rJs75dfnnbj52v3q58lkSzfY4ZBbn1nw\n42CLO+QWecQul8tN/OV+KaVV97g6t8gjdi2O1HCRxl/4J8/vnVLa7cH3G7bUTH8sffWDcj4H\nuVXyXF35f965s16tKspmMpm/NHr14TKaKrfII3ZNftrO5XJzvnw2pdRr3Vtbdc0bV5ZW9D18\nCVd1y5LGbuY1do21uDAWPU9bPB3qF9J9C5/a56++Uvs+YtfiGEf3r0wplVQMu+G+K8uymfLu\n2zW8o0Q+S2jZvd1JG455O55r3+xfkVJ6eNriX2NX/cW9++2332HfvD7PUVtc54t9jV3jG5lc\nLvezNbtni3s0fNjaG6J8xsjnBnDRw76US6j+Lmb/l5q+r9B3eyzxHfu2ufaV+n2+eOP4lNKG\nP3imyWU3riytf8Su3W9+ya2ob3dS171rl56Djlz0P4rKV/nBDUemlD4Y39x7KHxZ2/QX1hbz\nY3ymZNz+q9dMe/SK92bM+uSmWz6Ztc53xi3+DQ6WvGdR6cCUUv/N71zsN+/JU4anlCrXqEwp\nTXut6dudz/y4usmWkm49U0qzJuf7xuhnb7nN+Tf+a/uTx/37hTdm1NR88NbLf7/5ZwsNXtxz\n7Nk/f/K1j6a++8rfbrn+5CN2efOhP31jq+ENb2/R4g6LNfSo204c1nPy+O+c9XDT35xvcaQ2\nyOcgt0a+qyv/z/vHY/aakSsqz6Rj9zyvrX/Joe1rfu6sVxbZ8nJKqWK1Xq295voLLnpVZb2W\n9ofyPBdG4/M0z9Mhs4zflCSfMYpK+9783GNjdjjhL8cOq5764O4/fOSr7e27dFunDce8HQf+\n1gGrpZR+eNObi/3fjx4Zd8cddzz8dv/8R21pnRdI82PkfwPY5C5paZZQ/V3M1InTG1/hvNkT\nfzG1NqW06+ixRzcy5rDNUkrP/++VX13/gJTSzHea/Dp23Xtf/Z2hjl3DYS32aIZ3VP+KTLbs\nzsU9/vH+/YemlNb6+kP1H9Y/YjepesEDEvNmv9m1KNvkEbvFvovptHd+mlJa78THn/nBhplM\n9q4pC350a/Lq6SXvWTusa0nX3gc0ebX86zeed/LJJ/97Wk0ul5vx4XUppT4jjkuNH9ioqxm1\nUlla+OfFmqkPZTKZXutd3PiqaqY/ls1k+mzw+/oPGx6xmztzQkqp++BLGu88b/br6aufDmd/\ndseZZ5556W0LvYDm2fM2SSnt8diH+exQb9FH7HK53Iz3/1RZlC3rvu3NB6yRvnrErsWR6rX+\nB+WWD3Kr5L268vq8Hz78w0wms/6Jd993+sYppYN/27qHXlo/1WJeY/enTxa61ITLt0op7frV\ni8/yvOb6q/rdhwu9fmjCz7dOKW1z/cQljZ3PI3b5LIxFz9MWT4fFvkFxuz9i1+IYjX+lcV71\npE2rSrNFlX+efxhbXkLL6BG7th3zdjzXqr/4Z9eibEnXdZ9e9Bdj66qPHlSVUjr6iY/yHLXF\ndV6wR+yaGSPPG8BFD/tSLqH6u5i+m/288Q5v3LxjfUI0OQi1c6esUlacUrrjs9m5XG5e9eTy\nbKZywHGN95nxwXVpwWvs2vnml9wK+8sTb9x0SEqpatXd7nnx08bbv3jlnm17lGeypb9898v6\nLfdsNzCldMz4yfP3qKu5/lvrpUavIG4m7HK52lErlXXptde+vbp0X/Osxv/RJOya2fOhE4an\nlHb+8V8b1v30t+5aq0txWbctZ3z1W4ejV6nMZDIL7v/q5v729K0Xe9b9eP1emUzmB3c2PO9T\nd9NR66aU9vrjm/UfLwi7WROzmUzlgGManj6unfPJ5d9cP6XUe9htuVxu9me3p5QqBhze6JW8\nddccuEZK6ftvTs1nh3qLDbtcLvfvH41MKZV2LV4Qdi2NNP+Itf72NJ+DnL/8V1eLn3fe7Nc3\nryrt0mvnT+bU1s79bLfeXYrLV3usTTd2+U+1aNj12fTbb82ev1Y/evw3q5cXF5ev+sZXW/K8\n5vm/8bfRt9746t0QPn7yt2uWF2eLuz+55L90klfY5bEwFnueNn86FCbsWhyjyZ8NmHTnUSml\n3hueWf+1triE6sNu618uMZ0Xq+Wwa+sxb8dz7cFzd0wpVQ7a9ban3lsw2Mz3fjpmw5RSt9VH\nz6nLd9QW13khw25JY+R5A9h82OVav4RyX93FHH/d/N/ezdXN3WulosXexeRyub/sumpKaeMf\nP1f/4e/2WDWl9J3fPvfVzB+fumW/RmHXzje/5FbYsMvlcrecskNKKZMpWn34Frvvvd/+++61\n9cZDijOZTKb48Msebdjto0dPz2Qy2eJuBxx90g/POH63TftlMkWbVJXmF3a5x44fVr/669+U\nrsEiYbfEPWtr3j9waPeUUp8hmxw09rjRB+3WvTibLar8yQMfNOzzxSvX95v/PnarfWPMIVsM\n65vJFH3j9GGLnnWzPh6/XlVpJlO0yXZ7fuvbR+22xSoppZ7Dxzb8WlPj19hduE3/lNIa23zt\n+z/8n5O+dfjG/br23/zQQWXFJRXrXXD5L3K53AXbr5xSqhi40YFf/+Z3vnXk9sP7pZT6bXVq\nw+1Oizvklhx2dfOm7tt//gvtG15j1+JIuTbdnuZzkFslz9XV4uf95YFrZDLZC56ZH0yfPntB\nNpMZ8P8uXKZTNQm70m7rZDOZLn3X2evgI/befvOKomwmW/LdW99s7TVvXFlaWrXpyD5dyvsM\n3fPgI/beYYvKomwmk/n6lc83M3Oer7FrcWEs9jxt/nQoWNg1P8aifw/q7I37pJTG/OXtXB5L\naPq7F6eUug854Mfn/s+jef9IkM9r7Np2zNv1XKu97sQd6m8iBq63xR777LfLdlv1Li1KKVUM\n/H/3N3rcq8VRW1zni327k2322b/xG8FsWFGSyZSefN389yJpW9g1P0Y+N4Athl2ulUsol8t9\n8cr1/UuLUkprb7rdN8YcstnQ7imlbGmXxYbdlAmnpZS69N6//sO5M1/abc1umUzR5jvue8w3\nD91kjapeG357/YqSiv5j538X2/vmlxU37HK53JsP/u7bX99z7UH9K8uLS4/45bAAABhASURB\nVMorB661wX5HnnbH003fFPGJ3/542w2H9uhanFLKFnf/zhX/vn1Y7zzD7sv3r0opNbwpXYNF\nw25Je+ZyuXk17175/bEj1hzQpaSk76pDtt/36D8/+0mTfT56/NyUUiZbWlxetfZmu//87tfr\nf7V+0bNu5gdPfG/0Xmv061FSXNZnteGjz7jsw5oFj4I3Drt51ZN+cuy+a/TtVtqlxwYjdzzp\n4ttq6nL3nX1A9y4lVf03zuVytXM+veqso0YMWaVraVFxecWa62954k9+0/idh1rcIbfksMvl\nclNeGFeUyTQOuxZHyrXp9jTPg9wqea6uZj7ve/84NaW09uhbG+9/89cHp5SOWvg9ONp3qiZh\nN2Dk+Nf+cf3XdhjRs6q8rLLHhtsf8Kv73mrDNde/MLxm2n+/s9+2fVbqWtKl2zpb7nHZ7S8s\nelWN5Rl2LS6MJZ2nzZwOBQu75sdY9F555sd3VBVlSys3qn9cp4WlWzv77IO27N61pLRrj99+\nvNDz4M3IJ+zafMzb91ybeN+NYw/cefX+vcqLi7pW9Vhn0+1POu+XTW5FWxy1xXWe99udpHWP\nm/8WPG0Lu+bHyOcGMJ+wa90SyuVyudwXL40/er9R/XpUFpdXrTpopZTS2ntvsdi7mFxd9YaV\npSmlaz6Y8dXYk885cr9hg3p06d531zE/nFQ9r2dJttuqP1zwdbX3ze8KLpPLddSfsOt06j59\n9+2iPqv3LF/irwIBS7JJVdlrlUd8+eH1HT0IUDjPPfF4TbbXyM2HNGyZN2tCScX6q2w//t37\nd+/AwQJbMX8rtm2yfQYNVnUAkKebDtlt6623eH7Ggr8l/Z9rTkgpbffjjTpuqOBW6DcoBgCW\nndNuPPHnO1yw7fDtvzN2z4Erlbzx7D3X3vRw742/86ttB3T0aGF5KhYoBE/Fworp7Xuv/94F\nv3zqpVc/mDav/+rDdvva2J+cc2z/Uk8YLivCDgAgCMkMABCEsAMACELYAQAEIewAAIIQdgAA\nQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIo7ugBliO1tbXjx4+vrq7u6EFa\noa6ubsKECcOHD89mO02jm7kwzFwAnW7gZOZCMXPBlJeX77HHHkVFRR09yPJC2C1w991377PP\nPh09BQDQCnfddddee+3V0VMsL4TdArNnz04prbnTmB5rbNDRs+TrvSfu/PjFh/pt+bVVhm/Z\n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\nHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISw\nAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgB\nAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsA\ngCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcA\nEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAI\nQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAI\nYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCE\nHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISw\nAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgB\nAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsA\ngCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcA\nEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAI\nQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAI\nYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCE\nHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISw\nAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEMT/BwvTwl42\nBDoqAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "md.pattern(titanic)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "a55f7996",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.798383Z",
     "iopub.status.busy": "2023-02-28T08:14:14.796920Z",
     "iopub.status.idle": "2023-02-28T08:14:14.848157Z",
     "shell.execute_reply": "2023-02-28T08:14:14.846453Z"
    },
    "papermill": {
     "duration": 0.06113,
     "end_time": "2023-02-28T08:14:14.851085",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.789955",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df <- titanic %>% select(-c(Name, Ticket))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "2e714dee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.865161Z",
     "iopub.status.busy": "2023-02-28T08:14:14.863693Z",
     "iopub.status.idle": "2023-02-28T08:14:14.881558Z",
     "shell.execute_reply": "2023-02-28T08:14:14.879597Z"
    },
    "papermill": {
     "duration": 0.027819,
     "end_time": "2023-02-28T08:14:14.884432",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.856613",
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
       "<ol class=list-inline><li>'Survived'</li><li>'Pclass'</li><li>'Sex'</li><li>'Age'</li><li>'SibSp'</li><li>'Parch'</li><li>'Fare'</li><li>'Cabin'</li><li>'Embarked'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Survived'\n",
       "\\item 'Pclass'\n",
       "\\item 'Sex'\n",
       "\\item 'Age'\n",
       "\\item 'SibSp'\n",
       "\\item 'Parch'\n",
       "\\item 'Fare'\n",
       "\\item 'Cabin'\n",
       "\\item 'Embarked'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Survived'\n",
       "2. 'Pclass'\n",
       "3. 'Sex'\n",
       "4. 'Age'\n",
       "5. 'SibSp'\n",
       "6. 'Parch'\n",
       "7. 'Fare'\n",
       "8. 'Cabin'\n",
       "9. 'Embarked'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Survived\" \"Pclass\"   \"Sex\"      \"Age\"      \"SibSp\"    \"Parch\"    \"Fare\"    \n",
       "[8] \"Cabin\"    \"Embarked\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "b1e91296",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.898958Z",
     "iopub.status.busy": "2023-02-28T08:14:14.897549Z",
     "iopub.status.idle": "2023-02-28T08:14:14.914761Z",
     "shell.execute_reply": "2023-02-28T08:14:14.912858Z"
    },
    "papermill": {
     "duration": 0.02719,
     "end_time": "2023-02-28T08:14:14.917405",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.890215",
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
       "<ol class=list-inline><li>891</li><li>9</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 891\n",
       "\\item 9\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 891\n",
       "2. 9\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 891   9"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "b39594cd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:14.932237Z",
     "iopub.status.busy": "2023-02-28T08:14:14.930793Z",
     "iopub.status.idle": "2023-02-28T08:14:15.064402Z",
     "shell.execute_reply": "2023-02-28T08:14:15.061926Z"
    },
    "papermill": {
     "duration": 0.143966,
     "end_time": "2023-02-28T08:14:15.067305",
     "exception": false,
     "start_time": "2023-02-28T08:14:14.923339",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 3 × 10 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Survived</th><th scope=col>Pclass</th><th scope=col>Sex</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th><th scope=col>Age</th><th scope=col></th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>714</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>  1</td><td>  0</td></tr>\n",
       "\t<tr><th scope=row>177</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>  0</td><td>  1</td></tr>\n",
       "\t<tr><th scope=row></th><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>177</td><td>177</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 3 × 10 of type dbl\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & Survived & Pclass & Sex & SibSp & Parch & Fare & Cabin & Embarked & Age & \\\\\n",
       "\\hline\n",
       "\t714 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 &   1 &   0\\\\\n",
       "\t177 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 &   0 &   1\\\\\n",
       "\t & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 177 & 177\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 3 × 10 of type dbl\n",
       "\n",
       "| <!--/--> | Survived | Pclass | Sex | SibSp | Parch | Fare | Cabin | Embarked | Age | <!----> |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 714 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |   1 |   0 |\n",
       "| 177 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |   0 |   1 |\n",
       "| <!----> | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 177 | 177 |\n",
       "\n"
      ],
      "text/plain": [
       "    Survived Pclass Sex SibSp Parch Fare Cabin Embarked Age    \n",
       "714 1        1      1   1     1     1    1     1          1   0\n",
       "177 1        1      1   1     1     1    1     1          0   1\n",
       "    0        0      0   0     0     0    0     0        177 177"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\n7bVHWw+gFb3/9B0nH7HPequvWtGlqGtFj3U3HnvKhcu9TppdlvmfD5u+bTOZzG8/nrdcY1uu\ncbbMtwZUdOnxtdY9ZqPTe9Oe/3+j626ck16Y3rrDYOUobO8BdBoPXrz/175/Ry5TutGWW+21\nw6CCyhkvPfnQ+O898Ktf3XrXcxO2613a3gNsE0Vd19l9p/UWfVXzyTtvPfPCE1ec8/ht/3pz\n6n0XRP2xoJPe12037Ha/Qb4K67Co6/Ddd1p7ye3FFZus/MG0zJ/O2+uQi/6WUho8ctMtR244\n6/0pr0987Kr/PPL7X//xXy9NGNO9pL0GtqzbNqU0pKRgJQ+m4/vBLybV/ePO0+//xQMHt+9g\naIkceZj70Q1FmUxpj23ue3P2l1trq//200NTSr1GntPWA5gz5c1JkyZV17bhf/Hvo9ZJKf39\n0/l1X87/9O8ppW6r/aDRbtNeuHNEWVFK6bQXp+dz2H/tslpK6fHZVa083DbT7vd1y+Q/7IZr\naXR5cfmqJ7XWkdtCa63DFnj4kDVTSg/MrGyj49ebN/0vKaVVhvy4rf+jNvXCL/dPKa2y5t53\n//eT+o3Vc9+74vjRKaXeo5ZjnTS7LPM/H7bpbZvPw6cFjulfXtp9h9Y9ZqPTexNmv3t5Sqn7\nWmcPKC4oKO7/8YKa1h0JK0GMn3Xb3Bu/vbI6lxvz6+t3GFbx5dZM4e6n33zaoIoZE3/y6OyW\nv9Q4b0bz1y1bfdg666xTmGnxf9Jqem+4903nbJBSuueXr7X3WNpEm97XbSf/YS/vWmrBDVJV\n3YbvGaizguswnwddZ7cy51g95z/bn3pHcflGj71w2x7r96nfXth14HeufmLcgPLpz//kyvfm\ntNZ/18Qarq1a0fcHVM6rbMMX+JvUEZblc+ddk1La9ooTfzqmX82Cj77z2EftPSKWm7DLy9zJ\nc1NK1bOrl7zopJ/8+MILL+xW8MU55s4RfTKZzKyaxc4Mh/crb/ieiQf3HZot6JpSuu1/vzm4\nd9noM5+5c9fVM5nMqS/PaHitys8mZLPZHsO+l1K6Z4tV699T0uzOuZpZN118ypbDV+/WpaTv\n4DV3POyMf06a1WjYsyb949j9thvQq6KkvMfI/9nn1/e9nf+t0WuLXimlOW9+cZpeMOuV/z3u\nwLUH9ikpLhu05sbHnXfttOplnlrnTH3ozMP3XGdgn9KiovJV+o4eu8+Vd0xstM+jN16065iR\n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\nx3yWaCuoXZDJZEq6bZnPvvlMpNlludSw2/2vi51Rz1utW7awRxO3bcObt+4IF0yeVX/19x/a\nJaU06vwvXw2YP+PvKaXVdvlX/uNswbLMLQq7yk+f3K5f10y2y9VPftLw0qbv0zxP70tVs+CT\nVUsKirqs9fmig3/0xFEppR5rfZG/tQtn9ikqKO9/TMNrzX7n52nxsFtJq45l83Eny2HE9gdd\ntP1BKaX50yc/8tDDD953759uvuPvv/vx/X+9/8mpj2xYVrRcRztw0z4Nvxxz8dfTXy685YLn\nL7hh25TSa1f/OKV02M+X/mlGy9q5es5zD8+sKh+w3p+u/13D/WeWZVNKTz87Iw3r/unzf00p\njTh374Y7ZIv6/XCt7ke91PhTixb/mImUyRb3Grz2Qd8+c8e1V0kpzfngl1W1ueGHHdDwKqW9\n9n3iiX2XOuyBux90ZEq5mnmTX3397SlTprz91qN3X91wh0y27CfbrXrmA38fvM42R31977Fb\nbTlmi82GbTgqn0tbV7P3dT43dUqpbNX97rtw7KbnXHrwC2nzcx88dp3ubTHa/Ie95FVKum15\ncL+uDbesecSx6eynpvzflHTCl3d9PkcuLh995Kplix3q8OPSWU+98du308HDVmReTa/DlMfS\nqtPwQZfn6v3GVn0X2yHbVr/BtMqQH8+c/L1lXZrnBFODOea5RFtBpqh/UXbagvfz2TfPieS5\nLBs6eMxiZ9SehV++g7zp27beJt2K6/9d1L0opdR32y/v/WxRj+UdZwuWZZ2aBR/sNXKHBz+e\nl1J6c/7C+u3N3qefli/H6b2Rjx7/zgdVNUP3/3n5ovfj9tn4sv7FN3785oVPfn7OmIrieR/f\nOK26Zs1tD294rYpBJ/QsOrX+8/FW3qqjCe1dlp1DZWVlVdXCJbcvnP/ud8cOSCmtf/rTdVvy\nf8buvs8W/xiF2gUbVxSXrLJV3Q93h/btWrLK2PrnrRv9hLqsned9cnMT9/VmP3spl8u9+ust\nU0r7vtz4QyIeOmhYyu89dvU+enr3lNLYJp+PafiMXfXcV79/xI49igtSSpls0YA11tv1oG+m\nxX9Yr62e8bsLT95srX51Y85kizfY/uBbn/0kn0tbRZ73dT43dZ3qea9VFGQzmcztH89rxXG2\nbNi5JZ6xa/Tzdy6XW/D5cymlXuvdulxHHl1eXNb3sGUc6pYWzyufdZjLY2kt+aBrdvXWPYtz\n/+KP0x8PWaWNnrFr+n1g+Tx2Gs0x/yW64r7Zvyyl9Mispb/HrvKz+/bZZ59Dv3ldnhNpdlku\n9Rm7Rk9H/Wxo9/pn7PJ8j13DI3zywp4ppV0eer9+S9Xsx9MSz9g1Pc4WLMtcLndM//KUUlHZ\n8Ovvv6okmyntvm39Z440e5/meXpfql+MatyX9bb+1au5XO6zN09MKW34vWcbXXF0eXH9M3Yr\nc9WxLH4rNh+13bt26Tn4qCUvKCgd9L3rj0opfTChqc9c+LxmKb8l2vgn/0zR+H2HVM167Mr3\n5sz75KZbPpm37rfHL/MzKZaxc0HxwJRS/83uWuqd/dRpI1NK5WuUp5RmTprd6JBzP87rQ8kb\nKurWM6U07518P7r9+1ts/eMb/rXdqeP//eKbc6qqPnj7lb/f/LPGMyvsOe77P3/q9Y9mvvvq\n32657tQjdnrr4T9/Y8uRdZ+p0fSlrSHf+zqfm7rOn47dY06uoDSTjtv9wjb7Qw0tX6LV815d\nYssrKaWy1Xst75HrrrjkoUp6tfnP6PksrbT4gy7P1ZvpAJ8xlPKeYGowx/yX6Ir71n6rp5TO\nu+mtpV760aPj77zzzkcm989/Is0ty46i6XG2YFnWKSjue/Pzjx+5/Um3Hze8cuZDu5736KLt\nzdynLT69L5w/6bv/nVFQPOCYxR156KYppRf+96qUUkHxgJTS3ClzF79q7XsLvvwV+5W56lim\nPOKP3NH9yzLZkruW9ozL+w8cklJa8+sP131Z94zd1Movn+FYOP+trgXZJZ+xW/KDT2dN+UlK\nacTJTzz7vQ0zmezdM7786arxM3bL3LlmeNeirr33a/T+/DduuPDUU0/996yqXC4358NrU0p9\nN/35YnvUVo1dpSQt5zN2VTMfzmQyvUZcutjG2Y9nM5k+G/xf3Zf1z9hVz52YUuo+7LKGOy+c\n/0Zq8PPr/Ol3nnPOOT+9bbF3nDx34cYppd0e/7DpS5sY53LJ+75u/qbO5XIfPnJeJpNZ/+R7\n7j9zdErpoD+83lrjbOmwl/Ieuz9/sti1Jl6xZUpp50XvLcvzyHWHuvHDxd5vNPHnW6WUtr5u\nUovnlc86zGdpLfmga3b1LvUDitvlGbt8JphbyhzzWqKtovKzf3YtyBZ1Xe+ZJX8xtrbymMEV\nKaVjnvwoz4k0uyw7zjN2TYyzZcsyt/hvxS6snLpJRXG2oPwvXzyymrlP8zy9L+nNW3ZMKQ3e\n+S+NttdUzxhUUphSunP6/IWV75RmM+UDjm+4w5wPrk2Lvcdu5a06lkXY5eXNmw5OKVWstsu9\nL01ruP2zV+/dpkdpJlv8m3c/r9ty77YDU0rHTnjniz1qq6771ojU4F26uWWHXS5XM3aVki69\n9ti7V5fuQ89teMGSYbesnR8+aWRKaccf/rX+cTX77bvX7FJY0m2LOYt+jfHwQeWZTObEaxf9\neldt9R/O3Kou9Jcr7HK53A/X75XJZL53V/3rWbU3Hb1eSmmPP71V9/WXYTdvUjaTKR9wbP3r\nyzULPrnim+unlHoPv+2L/3T6HSmlsgGHNXi7ce01+6+RUvruWzObvrTpceYv//u62Zt64fw3\nNqso7tJrx08W1NRUT9+ld5fC0tUfb5tTW/7DXjLs+mxywtvzv1haHz3x+yGlhYWlq725aEue\nR/7iNwQ3+tabiz4c4eOn/jC0tDBb2P2pFfi7I3mFXR5La6kPuqZXbwcKuzwmmFvaHPM5G7SW\nhy7YIaVUPnjn255+78uRz33vJ0dumFLqNuTwBbX5TqTZZdmhwm5Z42zxsmz0lyem3nV0Sqn3\nhufUHabZ+zSf0/uSzlljlZTS2S/PWPKi23deLaU0+ofP53K5G3dbLaX07T88v2hGH5++Rb/F\nw26lrjqWStjl65bTtk8pZTIFQ0Zuvuue++y79x5bjV67MJPJZAoPu/yx+t0+euzMTCaTLey2\n3zGnnHfWibts0i+TKdi4oji/sMs9fuLwukdg3cfX1Vta2C1955qq9/dfp3tKqc/aGx847vjD\nD9yle2E2W1D+owc/qN/ns1ev619ckFJaa5Ntv3HkwZsP75vJFHzjzOEtCLt5H08YUVGcyRRs\nvO3u3zrh6F02H5RS6jlyXP3vVTV8j93FW/dPKa2x9QHfPe//nfKtw0b369p/s0MGlxQWlY24\n6Ipf1+1/0XarppTKBm60/9e/+e1vHbXdyH4ppX5bnl53cmz60taS533d7E39m/3XyGSyFz37\nRQ9Ne+6ibCYz4H8ubs2xLv+wG4Vdcbd1s5lMl77r7nHQEXtut1lZQTaTLfrOrW8t75FHlxcX\nV2wypk+X0j7r7H7QEXtuv3l5QTaTyXz9qhdWZFJ5rsNml9ZSH3RNr96OE3b5THCpc8znbNB6\naq49efu6M9LAEZvvttc+O227Ze/igpRS2cD/eWDR01r5TKTZZbm8Ybesjzs54IADTr32taUe\n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\nIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEA\nBCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCA\nIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQ\nhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACC\nEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQ\nwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC\n2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEI\nOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhh\nBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHs\nAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQd\nAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLAD\nAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYA\nAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4A\nIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEA\nBCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCA\nIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQ\nhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQxP8H0R1M4X3gMU8AAAAA\nSUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "md.pattern(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "ee9b719b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:15.083894Z",
     "iopub.status.busy": "2023-02-28T08:14:15.082454Z",
     "iopub.status.idle": "2023-02-28T08:14:15.098174Z",
     "shell.execute_reply": "2023-02-28T08:14:15.096628Z"
    },
    "papermill": {
     "duration": 0.02607,
     "end_time": "2023-02-28T08:14:15.100307",
     "exception": false,
     "start_time": "2023-02-28T08:14:15.074237",
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
       "<ol class=list-inline><li>'Survived'</li><li>'Pclass'</li><li>'Sex'</li><li>'Age'</li><li>'SibSp'</li><li>'Parch'</li><li>'Fare'</li><li>'Cabin'</li><li>'Embarked'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Survived'\n",
       "\\item 'Pclass'\n",
       "\\item 'Sex'\n",
       "\\item 'Age'\n",
       "\\item 'SibSp'\n",
       "\\item 'Parch'\n",
       "\\item 'Fare'\n",
       "\\item 'Cabin'\n",
       "\\item 'Embarked'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Survived'\n",
       "2. 'Pclass'\n",
       "3. 'Sex'\n",
       "4. 'Age'\n",
       "5. 'SibSp'\n",
       "6. 'Parch'\n",
       "7. 'Fare'\n",
       "8. 'Cabin'\n",
       "9. 'Embarked'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Survived\" \"Pclass\"   \"Sex\"      \"Age\"      \"SibSp\"    \"Parch\"    \"Fare\"    \n",
       "[8] \"Cabin\"    \"Embarked\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "ce0318c1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:15.116994Z",
     "iopub.status.busy": "2023-02-28T08:14:15.115580Z",
     "iopub.status.idle": "2023-02-28T08:14:15.209877Z",
     "shell.execute_reply": "2023-02-28T08:14:15.207630Z"
    },
    "papermill": {
     "duration": 0.104901,
     "end_time": "2023-02-28T08:14:15.212116",
     "exception": false,
     "start_time": "2023-02-28T08:14:15.107215",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3xV9f3A4W8GGcywlCWiiIIg7oJ14gIp4tY6cLRYrbi11SKKWrfV1F1XHbS4\nqv4KFltrxdYRtwKCICA4AQVkhYSQ5P7+CMbIvCDJ5X7zPH/0dTnn5PC5nIpvz73nnIxEIhEA\nAEh/makeAACAjUPYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AHJWjrnwYwkDHhzTqon\njVnpt2NW+8eemZnZuFnL7Xbrc/bV931aWlG9/Zw3B1RvM3NZxVr2DERA2AHEIJFIFC+a//G7\nL981/IzuW/f53/xlG3Hne+684w477LDDDjsMemrGRtwtsNFlp3oAADay4lmvHLnvVXMnXLex\ndvjRhx9+W14ZQmi6UXsR2OicsQM2xE5X/G/uGjy222apnq6+6HbGC9V/7F99+vHoB69ql5tV\ntWreh9eP/KYkteMBdc8ZO2BDZDds1rJly1RPUd9l5dc4Ci1bDvjFFS+W/Xv7X79ateDhd745\n4ZCOP/K3+OaNV8YXly1PrPjlwslF//nPly133XungpwfuWegNjhjB9SKibf1rvrCflaDFiGE\nOa+PPHqvni3ycz797vv734z7x/mnHr7dlm0b5ea12XK7ffqdcP/ot1f73f6Fk/95zvEHd9y8\neU6j5tvt1u/6v75dtrio+oKAoz6aV7XZ2CO2rlrSqPUxNX+85jUfwz5dVHPVOmdY6V28MeLa\nfrtv16JJXn6T5jvsecjNj7216rRlC6YUXnrm3jtu07Jpw5yGTbfouttJ5133zuzvT549f3Tn\n6nn++e0PPtl8/8pdqpZn57b9enllsn/WNWxx6FHf/7lNWrSWLUMIifL5T912+WH77dKudUFO\nTn7rdh33PfSkwideKU98v81rvzzywAMPXFKxYpiJf/zFgQce+LtxczdgNqAuJACSUzz7geq/\n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\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEIjvVA0A8KioqxowZU1pamupB6k5eXl7//v2zsrJSPQgAIQg72Iief/75gQMHpnqKujZ6\n9OgBAwakegoAQhB2sBGVlJSEEC4MoXeqJ6kbb4Rw63fvGoBNgbCDjax3CMekegYA6icXTwAA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRCI71QNsoG9nzZgyZeqc+YuKl5Zm5zVq1rJNl67dtm5bkOq5AABSJs3CLlGx8MnCq25/cOTr\nk+esurZN194nDD7v8vOOK8jOqPvZAABSK53CrqLsy9N233HE+HlZDVr02n9gz26d27YqyM3N\nLl+2bMHc2Z9Onfj6K2/eevHxj458blzRo+1yfMoMANQv6RR2RRf1GzF+3l5n3/bYDWd1aLSa\nySvL5j1245BBw0cedM7giffuV+cDAgCkUjqd1ho6Ymrjtme+cse5q626EEJmTssTL3/8nl6b\nT398WB3PBgCQcukUdhOKlzfueOg6N9t1n82WL51YB/MAAGxS0insDmuZ/+3kG2aXVa5to8qS\nPz85M69537oaCgBgU5FOYXfZjX2XLXylR+9j//Kvd4srEiuvTiyb9Mqzgw/qds/MRfsNH56K\nAQEAUimdLp7ocspT97998Bl3PzOo39NZOc227tK5XeuC3NwGFWXLFs6d9cnU6fNLyzMyMvqc\nddeoId1SPSwAQF1Lp7ALIXPwnS8eMuj/7nrosTFj35j80ftTJ644b5eRmduhc/eD+vQ9fvC5\n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\nVA/JP1Js+xBCCLMu+eWrq90gkUhspJEAANgQyYbd2WefXatzAADwIyUbdnfccUetzgEAwI+0\nfs+KrSyf//q/x47/eObCJSW/u2xY8cxP8ztt6alkAACbgvWosllj7+69xRZ79z96yPkXDx12\neQjhg6v6tthq99tf+KzWxgMAIFnJht2SL57Yud+5787NOeH8YddeWHUhRWjf/6gWX4+74Gc7\nPDRjUa1NCABAUpINuyePO/+birxHxs/4a+HvBx3cvmphp2OuHffh35qGJUNPeLLWJgQAICnJ\nht2N789r0f22k7oVrLS8yVYD7+zRat74Wzb2YAAArJ9kw27O8opGHTqtdlXbjg0ryr7aaBMB\nALBBkg27fs3z5r77yOruQVz58Jvf5Dbbd2MOBQDA+ks27IZeuHPxnBEHXvLn4soadZdY/uyV\nh4yYU7ztLy6rlekAAEhasvex2+E3/zj779vdedMvNxtx426dvg0hnH7aiR+++o83pi1s1uWY\n567ZrTaHBABg3ZI9Y5eR1ez2V6c9/PshnbO//l/RNyGEBx4e+cG3zU+48JZJHz7eISerNocE\nAGDd1uPJExlZjU8Zducpw+6c/9Wnc+YvyW3aolPHth47AQCwiVi/R4pVadFuyxbtNvokAAD8\nKM64AQBEItkzdltttdXaN5gxY8aPHgYAgA2XbNg1btx4pSXLi+dNnzm7PJHILdjp0AO32diD\nEYOKiooxY8aUlpamepA6UlRUlOoRAKjXkg27CRMmrLqwbOHHf7h40LAH383d8/6NOhWReP75\n5wcOHJjqKQCgvtiQiyeq5TTbduj9RbNeaH73bw689tfztsx10xN+oKSkJIRwYQi9Uz1J3Xg0\nhOdSPQMA9dmPCrsQQgiZp/y80503jZ+8tFzYsVq9Qzgm1TPUDR/EApBaG+Gq2K/GL8jManRg\n89wfvysAADZYsmfsli1bturCyvIl4/754KAXv8hvNcjJOgCA1Eo27PLy8ta0KiMj61d3Xblx\nxgEAYEMlG3ZHH330apc3bNVx3yPP/sVBnTbaRAAAbJBkw+6pp56q1TkAAPiRkg276dOnJ7/T\nVp22bpaVsUHzAACwgZINu222WY9nSzw/v7Sfi2QBAOpWsmH38MN/vv/Cs16bX5rXatuDDujd\ncbOmS+d98caL//ro65IWPY88ef+ONTfep1lOLYwKAMDaJBt2+zR84dT5pftc8OBzN5/W5LuP\n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\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEtmpHgAAUq8yhBBCUVFRiueo\nW3l5ef3798/Kykr1IGw0wg4AwvshhBAKCwsLCwtTPErdGj169IABA1I9BRuNsAOAUBZCCOHC\nEHqneJC680YIt4ZQUlKS6kHYmIQdAKzQO4RjUj0D/BgungAAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nRHaqBwAAUqAyhBBCUVFRiueoK3l5ef3798/Kykr1ILVL2AFAffR+CCGEwsLCwsLCFI9SV0aP\nHj1gwIBUT1G7hB0A1EdlIYQQLgyhd4oHqQtvhHBrCCUlJakepNYJOwCov3qHcEyqZ2AjcvEE\nAEAkhB0AQCSEHQBAJIQdAEAk0vXiiW9nzZgyZeqc+YuKl5Zm5zVq1rJNl67dtm5bkOq5AABS\nJs3CLlGx8MnCq25/cOTrk+esurZN194nDD7v8vOOK8jOqPvZAABSK53CrqLsy9N233HE+HlZ\nDVr02n9gz26d27YqyM3NLl+2bMHc2Z9Onfj6K2/eevHxj458blzRo+1yfMoMANQv6RR2RRf1\nGzF+3l5n3/bYDWd1aLSaySvL5j1245BBw0cedM7giffuV+cDAgCkUjqF3dARUxu3PfOVO85d\n0waZOS1PvPzxJWP+e97jw8K9ryazz4qKijFjxpSWlq5lm6rn6FVWVq7vwGvyxsba0SZvagjB\n+42X9xu9evWW69WbrVKv3nI9eZshvcJuQvHyxl0PXedmu+6z2fJ3Jia5z7Fjxw4cODCZLadO\n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\nBDsAAABF/Bcnnk95VRKAJgAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "hist(df$Age, main = \"Frequency Plot\", \n",
    "     xlab = \"Values\", \n",
    "     ylab = \"Frequency\", \n",
    "     col = \"red\",\n",
    "     border = \"black\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "51e7a406",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-28T08:14:15.229889Z",
     "iopub.status.busy": "2023-02-28T08:14:15.228350Z",
     "iopub.status.idle": "2023-02-28T08:14:15.323828Z",
     "shell.execute_reply": "2023-02-28T08:14:15.322275Z"
    },
    "papermill": {
     "duration": 0.106713,
     "end_time": "2023-02-28T08:14:15.326107",
     "exception": false,
     "start_time": "2023-02-28T08:14:15.219394",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n9KyGjXPLdv7x3Wbl17FLcIYN/SmKV80o//Lyq/UWLnylddaP36vFDl336tap/Dp22Y16fL3q\nJ9deLl79bfPMn7wTbvdrxm30b6Hq69itr9KzYtesnHpAkx/fCJjVqPUee+7aqMJbIbfZ93cV\nr2PXrf7aBc+sv+vZA359++dLNvp9gaRwxA6obR1Of+Jvv19bG4unvjfiySeeH/1u2U2rmnU7\n6bVPn2n6w4uqDbfv/9GTA3PT135avHLBgpXFURSdePv96z9t4w7X39Z7+/JPS4qWLy0sjqVl\nX/TokC2ZIXE5zfp8OGpY2x/OWlgw87NxE78ojsejKMrO6/b4B//c9qcnNKRntb1rv1YVtwy+\nrHNUKzJyO40e9/eD2669cHTRsjmffDx52Q83MWt3yG/e+e8tFf95GNyrTdkHawomP/HIQ6/P\nW1k7cwKbStgBSXDKrS9/9daI804+codWzbMzc9rs2Pngo/oNfeSVbz99rmeT7Ip77nrmPd98\n/MLAUw9v17JxZm6jnfY8YujIT0ac16XSp73qlUmP/2HgPp3b1ctOr5/XYs8jfvHoG18O7bPt\nFs6QuLZHXjFt1ke3DTrnZ7ts37heVmZuw+269Dj393eO/3rcabtU8qa9I+88ofzj+q3OPbnC\n3SBqWsMdf/7fGTOfuWPwzw/s3rJpo4yM7KbbtDvomDPy//b2jP/ev1POT96BffJzYwb3P6pd\n0wZpaRmNmm+3S+OsDT0tkFyxeHwjp48B1DVFy8dmN9qv7OMTJy/8R+eE7tNQB8VLC9vXbzRz\nVXEURfveNem9S3ZN9kRAanPEDiBp4iXLF5fdMy2WfttZHTa6P0DVXO4EIAkWLy/KLPz2gd8d\ns6y4NIqixu2vOrjxZr7+C1BO2AEkwRFtGn684sfrGB9z7wVJHAYIhrADUk9aesMDDlh7P9bO\nuZlV71z3dTvx5id6V36GB8AmcfIEQBI8+ac/TFtW2mybNt17HnbY3jtu/AsAEiDsAAAC4axY\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\n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\n9KNf9epwSYvt2tVfPW3W/JJ4fP/z7nzxN24pBgBsdVLpiF0URTufcN1XcybcMWTgfru0nP35\nuDff+rhs+4oFX88pzDnslPOHvzH9nYcudRMKAGArlEpH7MpkN9l10M33Dro5iuJrFi9cWFC4\nJj0rp36DJo0bZCZ7NACAZEq9sPtRLLNpi9ZNkz0FAEAdkWIvxQIAsCHCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBCJht1J5w9+4a1JJTU6CwAAWyDRsPvH\nQ7edeHDXvG13O++qP46Z8F2NzgQAwGZINOwmv/PSdRed3rZo2iN/vOrQ3dq17nrwb2976JOv\nl9XocAAAJC7RsOu8/7E33vPXKXO///j15343oF/Ot+/fPvj8vXZouusBx93ywLNffV9Uo1MC\nALBRGZu2eyxrj8NO2uOwk4Y+WPDBP1945plnnv3H6CHvvnTdxfV69D7pjDPOOLXf4c2zauOE\n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\nskdJwMT50dMTCgsLkz0HACSHsCMB3VpGh7dP9hAAwEY4eQIAIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBAZyR4Aqk9pPIqisWPHJnuOROXk5PTp0yc9PT3ZgwAQCGFHQKYuiqIo\nPz8/Pz8/2aMkatSoUcccc0yypwAgEMKOgKwpiaIoOrN71K1lskdJwMT50dMTCgsLkz0HAOEQ\ndgSnW8vo8PbJHgIAksDJEwAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgXAdO2Dj\nSkpKRo8evWrVqmQPkii3awO2TsIOkiSl7mw7bty4YcOGJXuKTeN2bcBWSNhBkqTgnW3drg2g\njhN2kCSpdWfbl6dFb89Kmdu1pdTR0DJeOwaqRaqG3ZI5M6ZOnTZv8bKClasycuo3btaq4y6d\n27fOS/ZcsIlSJZUmzEv2BJsiFY+Geu0YqA4pFnbxkqXP5t9496Mj3ptSyT8zrXbpefqAS6+9\n9NS8jFjtzwbUFal1NDTy2jFQbVIp7EqKvjtnn92GT1iUntm0x6F9u3fu0Lp5XnZ2RvHq1d8v\nnDtr2qT33v7gjitPe2rEy+PHPtUmy5VcYOuWKkdDITU5Wb5uSqWwG3tF7+ETFh1w0V0jh17Y\nrn4lk5cWLRo5bGD/60cccfGASQ8eUusDAsDW4tVXX+3bt2+yp9g0W8MbHlIp7AYPn9ag9QVv\n33PJhnZIy2p2xrXPrBj95qXPDIkefCeR50zkPzjK3oJdWlq6qQNv0MT51fZUNe3rZVGUOgOb\ntuaYtkZNmBelztkepaWln332WdeuXdPSUuCFEdPWnLU/sd23iVrWT/YsCZhfEE2Yt1W84SGe\nOvIy0lr1eGWju334u+5pGXkJPue///3vBBfq5ptv3rLx4/F4fNSoUTX6twkAbMioUaO2/J/y\nOi4Wj8eTvc6JOrtVg2dW7Tlz/hutqnj/XGnhhR1aPVlwdMH8ZxJ5zkSO2JWWlk6dOvXqq6/O\nysra1Jk349vVKan1n4+mrTmmrVGpNbBpa45pa9RW8h67VAq7aU/263T288326Hfnbb8/4fA9\n66f/9NTX+OrJ74y+44ZBj/53Vp97J78ysHOSxgQASI5UCrsoKn3koiPPv/+/pfF4elbj9h07\ntGmRl52dWVK0eunCOV9N+3LxquJYLHbIb+79930XBh7kAADrSa2wi6Io+u6D/7vv8ZGjx7w/\nZfo3q0vXDh9Ly27XYZf9eh112oBLjtunbXInBABIitQLu3Lx4sLvv19eUFiUlVuvYV6TXBcl\nBgC2bikcdgAAVJQaZ7IAALBRwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEBnJHmDrUlRUNHTo0J133jktTVJX\nv9LS0okTJ3br1s3yVjtrW6Msb82xtjWntLR06tSpV199dVZWVrJn4UfCrlb98Y9/vP7665M9\nBQBUj7S0tCFDhiR7Cn4k7GpVx44doygaNGjQvvvum+xZAjR27Nj8/HzLWxOsbY2yvDXH2tac\nsrUt+3eNukPY1aqy1wL23Xffk08+OdmzhCk/P9/y1hBrW6Msb82xtjUnPz/fa9x1jb8PAIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAi7WpWbm1v+v1Q7y1tz\nrG2Nsrw1x9rWHGtbN8Xi8XiyZ9iKlJSU/Oc//znssMPS09OTPUuALG/NsbY1yvLWHGtbc6xt\n3STsAAAC4aVYAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACLtaU/rvh645pPuODbNzWm676y+v\nvGt2UWmyR0oxK+c/tccee4wvWFPZgxtdXutfudI1Cx645oKf7bxD43pZ9fNa7HPoyQ//a/o6\nuySwdJa3EgXfvXXFGX06tGqanZndtNVOfc64/I2vV6y3lx/dalBaNHfQBeffPOqbdTZb281z\nTqsGsfXk7XhrhV38WqjD4tSKZwfuE0VR/TZ7nNr/zCP22jaKoqZdf7m0uDTZc6WS0efvEkXR\ne8tWr//QRpfX+leqZM2Cs3ZtEkVRw+33OeNX551w5P7ZabFYLP3shyeW75PI0lne9RUu/E+n\nepmxWKzLQX3P/fWv+hy0SxRFGTk7vDi3oOJufnSrxfD+naIo2vOGTyputLabrXVWekZO+71/\n6pC+j5Xv4NdCXSbsasOymfenx2KN2p81e3VJ2ZbhF3SJouiQ/M+SO1iqWDFv+sg7BmbEYpWG\n3UaX1/pvyPjbekZRtN2xty3/4bftvA9HtM1OT8/aZlLBmnhiS2d5K/X3n28fRVH/x8aVb3n3\n7j5RFLU5+K/lW/zoVotvXr287DhFxbCztputaPnHURRt//PXN7SDXwt1nLCrDa+d3D6KosvH\nLyzfUrxqRtPMtNzmJyRxqlRxyHZNKx5jXj/sNrq81n9DrmjXMBZLf3fpT5b0nYG7RlF0/Fuz\n44ktneWt1G4NsrIa7lVScVPJymaZ6dmNDyjf4Ed3y61e9sHO9TLzurdYJ+ys7WZb9vUtURT1\nvHfShnbwa6GOE3a14fjmuWkZect+egh6WIe8KIr+t7woWVOlisfvyr/99ttvv/32U1rUqzTs\nNrq81n9D9myQld1o33U2znjh0CiK9n94SjyxpbO8lShdfcwxx5x81kM/3VrSJjs9J+/Q8s/9\n6G6xksE9tslu9LOxH5+yTthZ28323Zt9oig6bcKCDe3g10Id5+SJGhcvXfnq4lU5TXs3TI9V\n3N5jr2ZRFL2wsDBJc6WMsy+57Iorrrjiiit6N8lZ/9GNLq/1r8KT73744di/rbNx/FMzoijq\ntE+zRJbO8lYuljVq1Khnnziv4rbxIy+Yvbqk3c/Xvm7oR3fLfXJX39v+t3DwP1/qVC+j4nZr\nuyXm/nt2FEWt//fksfvu1rJRTqNmrQ/qe87fP5hX9qhfC3WfsKtxJau/Xl0az6zXdZ3tjXZt\nFEXRtJWVnuNJoja6vNa/Cl27d++267YVt8x9N//Ml2ZlN9rvji7NElk6y7tR37xyw2knn3DA\nHu13P/3h3fte9tZjR5dt96O7hZbPGtnryle7nP/36/bdZp2HrO2WmP2feVEU5Z/325mZ2/Y+\n4YQ92ue98/KTp+7ffvCr30aJ/V/e8iaXsKtxpWsWRlGUlt5one2ZDTKjKFq51I/4Ftno8lr/\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "hist(df$Fare, main = \"Frequency Plot\", \n",
    "     xlab = \"Values\", \n",
    "     ylab = \"Frequency\", \n",
    "     col = \"springgreen3\",\n",
    "     border = \"black\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2e3cd4f4",
   "metadata": {
    "papermill": {
     "duration": 0.007584,
     "end_time": "2023-02-28T08:14:15.342212",
     "exception": false,
     "start_time": "2023-02-28T08:14:15.334628",
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
   "duration": 7.707112,
   "end_time": "2023-02-28T08:14:15.470851",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-28T08:14:07.763739",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
