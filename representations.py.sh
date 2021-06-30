#Author: Claudio Moises Valiense de Andrade. Licence: MIT. Objective: Execute create representations of texts

verifica_processo(){ # gerencia o numero de execucoes que o computador suporta
    while true; do	
        if [ $(( $(pgrep python | wc -l) == 5 )) = 1 ]; then
            sleep 1
        else
            break
        fi
    done
}

varios_datasets(){
    for r in $3; do
        for dataset in $1; do					
            for index in $(seq 0 $2); do
                verifica_processo
                MPLBACKEND=Agg python representations.py ${dataset}_${r} dataset/$dataset/split_5.csv dataset/$dataset/orig/texts.txt dataset/$dataset/orig/score.txt $index ${r} & 
            done		
        done
    done
}

# exemplos de execucoes
varios_datasets 'debate' 4 'word_tfidf' # create representation tf_tidf 
#varios_datasets 'pan21-author-profiling-training-2021-03-142en' 4 'word_tfidf_normalizer_l1,bert_concat_normalizer_l1 word_tfidf_normalizer_l2,bert_concat_normalizer_l2 word_tfidf_normalizer_max,bert_concat_normalizer_max word_tfidf_soma1,bert_concat_soma1'
#varios_datasets 'yelp_review_2L' 4 'word_tfidf,bert_concat_normalizer_l2'
#varios_datasets 'saude_ufmg' 4 'word_tfidf_normalizer,bert_concat_normalizer'

#varios_datasets '20ng' 4 'word_tfidf_normalizer,bert_concat_normalizer'
#varios_datasets 'pan21-author-profiling-training-2021-03-142en' 4 'word_tfidf' 
#varios_datasets 'yelp_review_2L' 4 'word_tfidf_normalizer,bert_concat_normalizer'
#varios_datasets 'reut' 4 'word_tfidf_svd_2000_normalizer,bert_concat_normalizer'


