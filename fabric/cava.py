import os
import struct
import subprocess
import tempfile

from multiprocessing import Process as QueueProcess, Queue

class Cava:
    def __init__(self, bar_number=10, bit_format = "16bit", raw_target="/dev/stdout"):
        self.source = None
        self.process = None
        self.config_temp = """
        [general]
        bars = %d
        [output]
        method = raw
        raw_target = %s
        bit_format = %s
        """
        self.bit_format = bit_format
        self.bar_number = bar_number
        self.raw_target = raw_target
        self.config = self.config_temp % (self.bar_number, self.raw_target, self.bit_format)
        self.bytetype, self.bytesize, self.byte_norm = ("H", 2, 65535) if self.bit_format == "16bit" else ("B", 1, 255)

        self.chunk = self.bytesize * self.bar_number
        self.fmt = self.bytetype * self.bar_number

    def set_source(self):
        if self.raw_target != "/dev/stdout":
            if not os.path.exists(self.raw_target):
                os.mkfifo(self.raw_target)
            self.source = open(self.raw_target, "rb")
        else:
            self.source = self.process.stdout

    def run(self, output_queue_buffer):
        with tempfile.NamedTemporaryFile() as config_file:
            config_file.write(self.config.encode())
            config_file.flush()

            self.process = subprocess.Popen(["cava", "-p", config_file.name], stdout=subprocess.PIPE)
            if self.raw_target != "/dev/stdout":
                if not os.path.exists(self.raw_target):
                    os.mkfifo(self.raw_target)
                source = open(self.raw_target, "rb")
            else:
                source = self.process.stdout
            while True:
                data = source.read(self.chunk)
                if len(data) < self.chunk:
                    break
                sample = [i / self.byte_norm for i in struct.unpack(self.fmt, data)]
                output_queue_buffer.put(sample)


if __name__ == "__main__":
    import time
    def poll(input_queue):
        while True:
            data = input_queue.get()
            if data is None:
                continue
            print("Polling ", data)

    cava = Cava()
    queue = Queue()
    runner = QueueProcess(target=cava.run, args=(queue,))
    # poller = QueueProcess(target=poll, args=(queue,))

    runner.start()
    # poller.start()

    poll(queue)