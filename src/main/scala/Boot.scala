import org.apache.spark.{SparkConf, SparkContext}

/**
  * Created by venkatkooram on 3/2/21.
  */
object Boot {

  def main(args: Array[String]): Unit = {

    val conf = new SparkConf().setAppName("SparkApplication")
    val sc = new SparkContext(conf)

    val fileName = args(0)
    val lines = sc.textFile(fileName).cache()

    val c = lines.count()
    println(s"There are $c lines in $fileName")

  }
}
