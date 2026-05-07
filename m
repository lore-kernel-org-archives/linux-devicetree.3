Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5C3264CE
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 20:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187047; cv=none; b=QXZjJYEV4QkMF2S41tDneIaXF2Ki6Lg0StbYD45gUy3TpIshwBsP4anA0Z5aAHXMhFb5YNqx/f44ZvtSZxuX7xRsCmZvlUnpqHsKZPPLmSzhu4dyGXf6a/zM4VmSIrg1ckE24kyXIjqJiGCh3hYc2izEv9rkuLjoPIMU2v6MRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187047; c=relaxed/simple;
	bh=laYspjwNdik0wTpw0SMM5VASlnIv1utg5JkDc2Xvo4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAItWDmO9aomTDrZw4P6+4svjwCmlzxLRZdu3hm63VPY9l6scYiGoQ3SSabfIFHYXvYIAWJAWMZqLEgVx2qmg2SGlVtpE/vC7ZjhNN8lMprYdqTwBfyUSluhb2sJxGolC7fdROXxrQ6uUduiTX8NF/j2t5Qj57FAwkpp4lo3238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw7tvB3l; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw7tvB3l"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-444826c16ffso1190745f8f.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778187044; x=1778791844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OnuO/zosxDfRrEJIngyG6XeRQW3GT6C0GQiewkPFchM=;
        b=Pw7tvB3l/xg1b6lA/T+RK3OIpwuYLoabXxuw7eTzPIJ4wTSmKEzz2cCaBNRDOcGESn
         gJl4NdwmbxicSQRKLbZzrmaRPVXW7CxswU15uB8wjtFMTmZnzBewPO0UCvwaLjc46UwQ
         4Zfj5kUOF9+0fZ+WI+dXSIWC0v57vke/ugUzEggG8QoUw3oOyl/y7gAVN0aCenTQu/ws
         Stz31u4owSXw7Fx0EE+f2B6gdFn90HOmu6Rqb2dNU9g1Wh3Pb9HCvzm6qfh/gcN3xtIX
         /nuW3GtUCayJ/8OCAZRi1LH8AuS8YeIrImo2jLSENL78WS0mm9wkXS5vvff2kvLjKdkx
         zlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187044; x=1778791844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnuO/zosxDfRrEJIngyG6XeRQW3GT6C0GQiewkPFchM=;
        b=m8v9vTJEprZZVttwB7oeNU0Gl1jXyGKoGboGiOT6sAR2HOMyGE04M2MLshqmhn6+Ue
         BtRLUyzrh3TZ1fwd/O6vZtvtwSp29MP/De4c3Ln+YyQwYa0MO925dR9qCUi9FdIO9A1s
         fWTfX390FUuwVuo9cCpPzd2yMgj5w1vc5d7lps51hdmckXIsCTEHRuVvEUyrUiFN/ZOw
         K33S+LHESbAiDAiYgF0T2NU9D4Ism4qfQtaM4ahwL3S0cRgjOjSafR912Ivn+ap+yJ81
         vfBkpOIpEESp97m8mkdwaiuL1SOth1m0IWEaNB7iD2AhRkauiwUUpxTbh0mOUjoENZjW
         NLQg==
X-Forwarded-Encrypted: i=1; AFNElJ9kgahHm9XEfMPihn/uxFVQRxPiWqWR6ypF15ipreZIr+Wj640PaLYX0wZyTk/3spYz9gAO1Z2UPfBo@vger.kernel.org
X-Gm-Message-State: AOJu0YzOP6LL9FTB3Ys0m9i8OtkDwSHPmibWoZKm+gKs4oKYGanxvwlT
	xaOk6jmM4UAQ81PFvicISnYSsz7Kh/O4NNTHzIRZut5THBJPZuYia2Qg
X-Gm-Gg: Acq92OGnjAt3zBw6B4A0xssa/xGjt/nnbTuPb997ZmLOQTPAh/UVqalzNd41qnd+2sN
	2bgCUBAH4u2PRJZp2puir0rWy810dmay1uI/EfAbcb3LZhVIY9em39hZ7XqNCVOvzkBrw/UNn1R
	CIqPAQPUzABnxlDIDj9gOqt1hO1nIE9fYgO0Lq/etmK7o5TEC2p5y07yiuf2urQFzmFDxDy4/nf
	j3wGRvUr8AXeFBHsFHzyLrQ5sjAiJljCI/FRUrPLSxGPDq5Y91WOB/xPdmq5XP61q91ThIlUmz9
	t2PThXIwGn8E5WuJkgY1Uqhzx5x7dvaovcQeDKmYvLAge24BHjwiNNQYWVTuJNoKPRqtCQYch/l
	eTEpbABlVvA8fMdTq2PQkWumMVFeoE0eWyv/1RzwWFPKWpBCdGjuUq9oQZe3b7rf1ERiLwRE54f
	9x4n7M4fBXrw6FZ+5Empv94NvcZOisuw8G6k/iQbMHxhPK1bR49oNnP3HBGXKCu+lo2VF5NfSsb
	0MLV4H9uUgL/Q7WUzg=
X-Received: by 2002:a5d:64c5:0:b0:43d:70de:1c70 with SMTP id ffacd0b85a97d-4515d5c54cbmr14522135f8f.32.1778187043449;
        Thu, 07 May 2026 13:50:43 -0700 (PDT)
Received: from ai-node.taila4f726.ts.net (89-139-15-25.bb.netvision.net.il. [89.139.15.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454175f59a5sm1401635f8f.32.2026.05.07.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:50:42 -0700 (PDT)
From: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
Subject: [PATCH v2 0/2] iio: magnetometer: add MEMSIC MMC5983MA driver
Date: Thu,  7 May 2026 20:50:30 +0000
Message-ID: <20260507205033.951990-1-vlad.kulikov.c@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an IIO driver for the MEMSIC MMC5983MA 3-axis magnetometer over
I2C. The driver provides raw magnetic field readings with
per-measurement SET/RESET offset cancellation, giving 18-bit output
with a full-scale range of +/-8 Gauss.

Tested on a Raspberry Pi 2B with the sensor on I2C-1 at 0x30.

The initial driver implements the validated I2C single-measurement path.
Other chip features are left for future work:

- SPI transport: the binding describes SPI wiring, but driver support is
  left for follow-up validation of the SPI command and SET/RESET
  sequencing.
- Temperature channel: left until the temperature output behavior is
  better validated.
- Continuous measurement mode and Auto SET/RESET: left until the
  interaction between CMM, TM_M, Meas_M_Done, and SET/RESET sequencing
  is better understood.
- Saturation/self-test bits and BW/decimation tuning: not exposed until
  their behavior can be described reliably through stable IIO ABI.

The driver uses a conservative 500 us post-SET/RESET delay before
starting the following measurement. The datasheet describes a 500 ns
SET/RESET coil pulse, but testing showed that a longer software delay is
needed before taking the next measurement.

Changes since v1:
- DT binding:
  - added SPI bus support, interrupts, and vddio-supply
  - made vdd-supply required
  - switched to unevaluatedProperties with spi-peripheral-props ref
- Driver:
  - replaced scoped_guard() with guard(mutex) in a case block
  - added datasheet page references for timing values
  - changed product ID mismatch from probe failure to dev_info()
  - hardcoded the IIO device name
  - added trailing commas
  - added local struct device and regmap pointers in mmc5983_init()
- MAINTAINERS:
  - split binding and driver F: entries across the relevant patches

Thank you Jonathan for the review and quick response.

Vladislav Kulikov (2):
  dt-bindings: iio: magnetometer: add MEMSIC MMC5983MA
  iio: magnetometer: add driver for MEMSIC MMC5983MA

 .../iio/magnetometer/memsic,mmc5983.yaml      |  65 ++++
 MAINTAINERS                                   |   7 +
 drivers/iio/magnetometer/Kconfig              |  11 +
 drivers/iio/magnetometer/Makefile             |   1 +
 drivers/iio/magnetometer/mmc5983.c            | 351 ++++++++++++++++++
 5 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
 create mode 100644 drivers/iio/magnetometer/mmc5983.c


base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.43.0

