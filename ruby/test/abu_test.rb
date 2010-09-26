require '../src/abu.rb'

Abu.generate('./out') do
	job 'job1' do
		read 'LongWritable','Text','/path/to/file.ext', 'DataReaderClassName'
		exec 'mr1','LongWritable','Text','Text', 'IntWritable'
		write 'Text', 'IntWritable', '/path/to/file.ext', 'DataWriterClassName'
	end

	mapreduce 'mr1' do
		map 'LongWritable','Text','Text', 'IntWritable', 'Mapper'
		reduce 'k2','v2', 'k3','v3', 'reducer'
	end
end
