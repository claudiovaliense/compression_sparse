varios_datasets(){
    # varios_dataset dataset representacao folds classificador
	for c in $4; do
		for r in $2; do
		    for dataset in $1; do
				#python3.6 classifiers_statistics.py ${dataset} 5 bert f1_macro & #bert
				MPLBACKEND=Agg python classifiers_statistics.py ${dataset}_${r} $3 ${c} $5
		    done
		done
	done
}


varios_datasets 'debate' 'word_tfidf' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_normalizer_l1,bert_concat_normalizer_l1' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf,bert_concat_normalizer_l2' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_normalizer_l2,bert_concat_normalizer_l2' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_normalizer_l1,bert_concat_normalizer_l1 word_tfidf_normalizer_l2,bert_concat_normalizer_l2 word_tfidf_normalizer_max,bert_concat_normalizer_max word_tfidf_soma1,bert_concat_soma1' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_normalizer_l2,bert_concat_normalizer_l2' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_normalizer_max,bert_concat_normalizer_max' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_soma1,bert_concat_soma1' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf' 5 'svm' f1_macro
#varios_datasets 'yelp_review_2L' 'word_tfidf_normalizer_max,bert_concat_normalizer_max' 5 'svm' f1_macro
#varios_datasets 'webkb' 'word_tfidf_soma1,bert_concat_soma1' 5 'svm' f1_macro
#varios_datasets 'saude_ufmg' 'word_tfidf bert_concat word_tfidf_normalizer,bert_concat_normalizer' 5 'svm' f1_macro
#varios_datasets '20ng' 'word_tfidf_normalizer,bert_concat_normalizer' 5 'svm' f1_macro
#varios_datasets 'pan21-author-profiling-training-2021-03-142en' 'word_tfidf' 5 'svm' f1_macro
#varios_datasets 'reut webkb yelp_review_2L' 'word_tfidf_normalizer,bert_concat_normalizer' 5 'svm' f1_macro
#varios_datasets 'reut' 'word_tfidf_svd_2000_normalizer,bert_concat_normalizer' 5 'svm' f1_macro
#varios_datasets 'webkb acm reut' 'word_tfidf_768 word_tfidf_2000' 5 'svm' f1_macro
#varios_datasets 'covid_ufmg' 'svmlight' 10 'stacking' f1_macro
