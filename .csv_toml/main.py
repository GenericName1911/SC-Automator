import os
from sc_compression import decompress
if not os.path.exists('In'):
	os.mkdir('In')
if not os.path.exists('Out'):
	os.mkdir('Out')
for filename in os.listdir('In'):
	with open('In/' + filename, 'rb') as f:
		file_data = f.read()
		f.close()
	with open('Out/' + filename, 'wb') as f:
		f.write(decompress(file_data)[0])
		f.close()
