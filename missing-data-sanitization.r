{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c41668b1",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-02-27T18:05:40.056224Z",
     "iopub.status.busy": "2023-02-27T18:05:40.054318Z",
     "iopub.status.idle": "2023-02-27T18:05:41.392412Z",
     "shell.execute_reply": "2023-02-27T18:05:41.391059Z"
    },
    "papermill": {
     "duration": 1.344767,
     "end_time": "2023-02-27T18:05:41.394631",
     "exception": false,
     "start_time": "2023-02-27T18:05:40.049864",
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
   "id": "eb586669",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:05:41.423592Z",
     "iopub.status.busy": "2023-02-27T18:05:41.400310Z",
     "iopub.status.idle": "2023-02-27T18:05:41.454915Z",
     "shell.execute_reply": "2023-02-27T18:05:41.453430Z"
    },
    "papermill": {
     "duration": 0.059895,
     "end_time": "2023-02-27T18:05:41.456753",
     "exception": false,
     "start_time": "2023-02-27T18:05:41.396858",
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
   "id": "d29551c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:05:41.463948Z",
     "iopub.status.busy": "2023-02-27T18:05:41.462685Z",
     "iopub.status.idle": "2023-02-27T18:05:41.510076Z",
     "shell.execute_reply": "2023-02-27T18:05:41.508203Z"
    },
    "papermill": {
     "duration": 0.053391,
     "end_time": "2023-02-27T18:05:41.512325",
     "exception": false,
     "start_time": "2023-02-27T18:05:41.458934",
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
   "id": "268ae202",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:05:41.519412Z",
     "iopub.status.busy": "2023-02-27T18:05:41.518139Z",
     "iopub.status.idle": "2023-02-27T18:05:41.532447Z",
     "shell.execute_reply": "2023-02-27T18:05:41.531175Z"
    },
    "papermill": {
     "duration": 0.020017,
     "end_time": "2023-02-27T18:05:41.534657",
     "exception": false,
     "start_time": "2023-02-27T18:05:41.514640",
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
   "execution_count": 5,
   "id": "c58dc232",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-27T18:05:41.541886Z",
     "iopub.status.busy": "2023-02-27T18:05:41.540614Z",
     "iopub.status.idle": "2023-02-27T18:05:41.808003Z",
     "shell.execute_reply": "2023-02-27T18:05:41.806618Z"
    },
    "papermill": {
     "duration": 0.273204,
     "end_time": "2023-02-27T18:05:41.810257",
     "exception": false,
     "start_time": "2023-02-27T18:05:41.537053",
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
   "execution_count": null,
   "id": "feeddb4d",
   "metadata": {
    "papermill": {
     "duration": 0.002597,
     "end_time": "2023-02-27T18:05:41.815679",
     "exception": false,
     "start_time": "2023-02-27T18:05:41.813082",
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
   "duration": 5.004664,
   "end_time": "2023-02-27T18:05:41.938323",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-27T18:05:36.933659",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
