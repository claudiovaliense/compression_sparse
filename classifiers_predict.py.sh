verifica_processo(){
    while true; do	
        if [ $(( $(pgrep python | wc -l) == 12 )) = 1 ]; then
            sleep 1
        else
            break
        fi
    done
}


varios_datasets(){
	# $(nproc)	
	for c in $2; do
		for r in $5; do
			for dataset in $1; do
				dataset=${dataset}_${r}
				for index in $(seq 0 ${4}); do		
					verifica_processo																
					MPLBACKEND=Agg python classifiers_predict.py ${dataset} dataset/representations/${dataset}/train${index} dataset/representations/${dataset}/test${index} ${c} ${3} ${index} &					
				done
			done
		done
	done
}

varios_datasets 'debate' 'svm' 'f1_macro' 4 'word_tfidf'
#varios_datasets 'yelp_review_2L' 'svm' 'f1_macro' 4 'word_tfidf,bert_concat_normalizer_l2'
#varios_datasets 'pan21-author-profiling-training-2021-03-142en' 'svm' 'f1_macro' 4 'word_tfidf_normalizer_l1,bert_concat_normalizer_l1 word_tfidf_normalizer_l2,bert_concat_normalizer_l2 word_tfidf_normalizer_max,bert_concat_normalizer_max word_tfidf_soma1,bert_concat_soma1'
#varios_datasets 'yelp_review_2L' 'svm' 'f1_macro' 4 'word_tfidf'
#varios_datasets 'yelp_review_2L' 'svm' 'f1_macro' 4 'word_tfidf_normalizer_max,bert_concat_normalizer_max'
