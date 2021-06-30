
verifica_processo(){
    while true; do	
        if [ $(( $(pgrep python | wc -l) == 1 )) = 1 ]; then
            sleep 1
        else
            break
        fi
    done
}

varios_datasets(){	
	for c in $2; do
		for r in $3; do
			for dataset in $1; do
				dataset=${dataset}_${r}				
				for index in $(seq 0 $4); do
					verifica_processo				
					MPLBACKEND=Agg python classifiers_score.py ${dataset} dataset/representations/${dataset}/train${index} ${c} ${index} ${5} 				
				done
			done							
		done
	done
}

varios_datasets 'debate' 'svm' 'word_tfidf' 0 'f1_macro'
#varios_datasets 'pan21-author-profiling-training-2021-03-142en' 'svm' 'word_tfidf_normalizer_l1,bert_concat_normalizer_l1 word_tfidf_normalizer_l2,bert_concat_normalizer_l2 word_tfidf_normalizer_max,bert_concat_normalizer_max word_tfidf_soma1,bert_concat_soma1' 0 'f1_macro'
#varios_datasets 'yelp_review_2L' 'svm' 'word_tfidf_soma1,bert_concat_soma1' 0 'f1_macro'
#varios_datasets 'yelp_review_2L' 'svm' 'word_tfidf' 0 'f1_macro'

#varios_datasets 'saude_ufmg' 'svm' 'word_tfidf bert_concat word_tfidf_normalizer,bert_concat_normalizer' 0 'f1_macro'
#varios_datasets '20ng' 'svm' 'word_tfidf_normalizer,bert_concat_normalizer' 0 'f1_macro'
#varios_datasets 'pan21-author-profiling-training-2021-03-142en' 'svm' 'word_tfidf' 0 'f1_macro'
#varios_datasets 'webkb yelp_review_2L reut' 'svm' 'word_tfidf bert_concat word_tfidf_normalizer,bert_concat_normalizer' 0 'f1_macro'
#varios_datasets 'reut' 'svm' 'word_tfidf_svd_2000_normalizer,bert_concat_normalizer' 0 'f1_macro'
#varios_datasets 'yelp_review_2L' 'svm' 'word_tfidf_normalizer_max,bert_concat_normalizer_max' 0 'f1_macro'
#varios_datasets 'webkb acm reut yelp_review_2L' 'svm' 'word_tfidf_svd_768 word_tfidf_svd_2000' 0 'f1_macro'
