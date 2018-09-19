# Drone Operator Behavior Models through HMM
This is the code for develeping human operator behavior models through Hidden Markov Model(HMM), to further study the impact of operators’ drone control strategies as a function of differing levels of autonomy. Details are shown in the paper "The Impact of Different Levels of Autonomy and Training on Operators’ Drone Control Strategies".

## Requirement
MatLab is required to run the code.

\begin{table}[ht]
\caption{Experimental treatments}
\label{tab:Experimental treatments}
\begin{minipage}{\columnwidth}
\begin{center}
\begin{tabular}{cccc}
  \toprule
                                    & Group 1   & Group 2   & Group 3 \\
  \hline
    Training Program                & ETC       & ETC + WSC & WSC \\
    Estimated Training Time (mins)  & 100       & 120       & 40 \\
    Testing Interface               & ETC       & WSC       & WSC \\
  \bottomrule
\end{tabular}
\end{center}
\bigskip\centering
\end{minipage}
\end{table}%

## Developing HMM model in this project can be split into two steps.
### Choose the number of hidden states (plot BIC)
In MatLab command window, Run 

plotBIC( path, num_ob_states ) 

### Model Selection
In MatLab command window, Run 

\[Log_Liks, Trans, Emis, Freqs ] = selectModel( path, num_ob_states, num_hidden_states )

then select the model based on Log Likelihood, Transition Probabilties and Emission probabilties.
