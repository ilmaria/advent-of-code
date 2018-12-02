(require '[clojure.string :as str])
(import 'java.lang.Integer)

(defn -main [& args] (println "hei"))

(defn input->list [file-name]
  (let [input (slurp file-name)
        list (str/split input #"\r\n")]
    (map #(Integer/parseInt %) list)))

(defn part1 []
  (->> "day01/input01.txt"
       input->list
       (reduce +)))

(def input (input->list "day01/input01.txt"))

(defn part2 []
  (loop [xs (cycle input) seen #{} total 0]
    (if (contains? seen total)
      total
      (recur (rest xs) (conj seen total) (+ total (first xs))))))