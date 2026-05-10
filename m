Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD91331F9B3
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778440222; cv=none; b=WHuulgTeujuMmFTviu+Dn+13Bip4maQ2LP7+oTOWHjveoxLB7BrY0EHCVEpLLQVJbFFGPRPF8c07EQIYJiJDgKZh0b0Lc0V2grDcmtBlGHrP6B0yP89+9ZHphwUWxu6COTjXq0tcg/5M218AyNKlIzD4nHKuOI22YLMTdF+bwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778440222; c=relaxed/simple;
	bh=4M89Z1PtLYhg7xWrkhOWRzVhNaUlFaflseDuSOzEK6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QY5wgRJjqy2cCIPRkdp+Talxc+REUqcLGx2Do7L3+WfyHFKHYg1zifXq4LOnjqCAfTvfBl5dDcKbbMQS14gC9a2fP2NFnYDYy16WED/Q60AIQqMp2Le4ZUSyO2BoGtpjTGFwyVw2usE2lAHifZD2kbsDwmdYE4NLEmnY7b/AnYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3WzgFUx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3WzgFUx"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bc85eda6b6so4024685ad.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778440221; x=1779045021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ob0ZbbyCxM8PinaaIzSEYPIxsXFv1SXQq5I/2s/H6uQ=;
        b=s3WzgFUxV0KXSGwP5oaQC2Na9uDpt7o/M4avHf2LW4n+iyKvQ90Y6w3YsIHqblPJJY
         +DM9IGmK+PUycQrQeVJ+A7R8nRty/wpgsP9dqbhH2bZ1pGlj5Ff9oPdQZzftbBnSTzR/
         2LZi6w3cVVkmjKT5cP4A212CTnT+RwXwcGz7dgvLmiCjDxI5WzCwHjtnIg2V46DogbzL
         FvQBCwA6Fk3AVukaptseidxuhi+w6hoJDr/p6ktvxEFzRUxSnBfjjfHiHZwANJFt+uO9
         nEQfedifsywO83HwOHPxopRJq2T5KdPgv/wvqQ9s0qKQY6zOjJb0VHrBRdjYN8zM7CXq
         qANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778440221; x=1779045021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob0ZbbyCxM8PinaaIzSEYPIxsXFv1SXQq5I/2s/H6uQ=;
        b=eL9G61VijXqGQf/k12s7dF17S33z/APolPnSf3IDRXJ8fOQiSh740xSx5TRNgKfKeM
         OxxRvaChIpY4fxBmV0gg2gutzZVsOqvT9Dj4PUWr+KA/a8p2VxEERsvX8JSxxAA0P9bi
         jq5koLZMkllFfH3JGSbJpDZF5mzdLqZwb4SvhZjBJdsAe5IBlpiaeXx9nW183B0ojmaa
         1SqP/Z4t19cg9miRpcjyozGLV3unrB6PS7Dz/wEmX8DLjaleVnjIjr+K4TTsklN4tE+7
         h0JEaiaQ5gEdZBHhG8Rhc0so7uj27sjjGmHm8R7QVX1NyUvHvrEGnz2WX47S+CZW56/z
         erHQ==
X-Forwarded-Encrypted: i=1; AFNElJ98ZYe5mzL5b6fi1Nnlq1RxujysLWOhBqJ1E21hQz7ZyBK9suMQ+Zr7fUONrpbxSWUGl7H2B9fAc1VQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xXgCUAd0KcDWhZYsfWE7/mMYxka/n3zASDri3LeH5SQxsSfO
	aIqvo8XiarO/aaFPZYbMk/mMiNSGgZTZgzzfyPHWWEsh2wM8Dbh35glD2aKVreol9w==
X-Gm-Gg: Acq92OGhycAT5s2q6aqC54h7CtmeqVSBLeq91M5M3rzKpOsJIaUN9DJxXhHrR3FyF2+
	qOoL8b3+C1D3GpJ547ynS1LnAjxWf1Fc+n39zI71sGZtuhLas7ETgd/MCy+4yzAPO3XMTyyY22K
	qfzS+M0mSFiHWsbfi+rCjpAYbW4W0hmID1VF20AyKYpnI0eljBlatdulPRBqqLdIpXuheDmIDOF
	Zo9sY2pCpx92E7o8BXoXTqC2DLPvBAIJ2z+YdZX93IA2hZsYGKLtPOfsaTbA+iRn0Mlie0SstX7
	uv/JKknwAn27v74SldjcblnWI6M5Lm0Ss1hkZHalGDCzKB7I6JOp5VYzFCBG6eFqILxYuF4nSOW
	KLr43wCmz0qpz9GVhmliWcLzdHz8+m9o0hm959a2dC0fdiLNbgcU0mpivE5Ooxa5UdxLiI2yWk0
	qKSmewg/ljiZCBr2U2hx+d2o9izN2hH1mOrHdIij0ipcUnQ2LoRtyKaiLcR4BHxsQw
X-Received: by 2002:a17:902:e314:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2baf0e04a83mr84516495ad.30.1778440220905;
        Sun, 10 May 2026 12:10:20 -0700 (PDT)
Received: from localhost.localdomain ([103.76.103.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1c5466bsm81817305ad.0.2026.05.10.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:10:19 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [RFC PATCH 0/2] iio: magnetometer: add support for Melexis MLX90393
Date: Mon, 11 May 2026 00:40:08 +0530
Message-Id: <20260510191010.155380-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds initial Industrial I/O subsystem support for the
Melexis MLX90393 3-axis magnetometer and temperature sensor.

The MLX90393 supports both I2C and SPI interfaces. This RFC
implements support for the I2C interface while keeping the driver
structure transport-independent to simplify future SPI support.

Currently supported features:

raw magnetic field measurements for X/Y/Z axes
raw temperature measurements
configurable gain/scale selection
configurable oversampling ratio
direct mode operation through the IIO subsystem
initially I2C support for this driver

The driver has been tested on Raspberry Pi 5 hardware using an
actual MLX90393 sensor connected over I2C. Raw magnetic field and
temperature values were verified through the IIO sysfs interface.

A custom transport abstraction was used instead of regmap due to
the MLX90393 command/response protocol semantics and repeated-start
transfer behavior. This approach was discussed previously on the
mailing list and seemed preferable for this device.
Link: https://lore.kernel.org/linux-iio/20260424114818.1290b029@jic23-huawei/

The implementation intentionally focuses on a minimal and reviewable
feature set for the initial RFC submission. Support for SPI,
buffered capture, triggers, interrupts and runtime PM can be added
incrementally in follow-up work.

The DT binding schema has been validated using dt_binding_check and
the driver has been checked using checkpatch.pl --strict.

Feedback on the overall driver structure, transport abstraction,
IIO ABI usage and DT binding would be appreciated.

Thanks,
Nikhil Gautam

Nikhil Gautam (2):
  dt-bindings: iio: magnetometer: add Melexis MLX90393
  iio: magnetometer: add support for Melexis MLX90393

 .../iio/magnetometer/melexis,mlx90393.yaml    |  39 +
 drivers/iio/magnetometer/Kconfig              |  10 +
 drivers/iio/magnetometer/Makefile             |   2 +
 drivers/iio/magnetometer/mlx90393.h           |  76 ++
 drivers/iio/magnetometer/mlx90393_core.c      | 724 ++++++++++++++++++
 drivers/iio/magnetometer/mlx90393_i2c.c       |  71 ++
 6 files changed, 922 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
 create mode 100644 drivers/iio/magnetometer/mlx90393.h
 create mode 100644 drivers/iio/magnetometer/mlx90393_core.c
 create mode 100644 drivers/iio/magnetometer/mlx90393_i2c.c

-- 
2.39.5

