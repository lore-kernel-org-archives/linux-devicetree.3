Received: from mail-wr2-f19.google.com (mail-wr2-f19.google.com [74.125.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3753FD4C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653529; cv=none; b=bKvD8cXi2MbTOATIuhhSn6It+9JuZGm9MyUCvS8liKrXcex1NLjBe2rC4FQlZXq6zkdmEk1RPY+MFCkX6z75zkqq8zv5WsMnf/NU4pU+zHh5qo2nkF4/aZFSqBnlPjB1BZHS1FveGsvmH/upov/L2TvPgQ/osX6jlSLCBgEOXM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653529; c=relaxed/simple;
	bh=ZqiXbA8s5RbN6r1kc2favZDBkjio0ckGcJPsbMrAk4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0M6i3yUFrqRn2b7nQ3Nxxao2QOL04hnBqNe1zsvR+N8tRW2koVWtMKiYvse6abaQBDD69P6uiD70tgKIGtCXo//uf4085z0ELCsyXbfHyJFwQGsQOtIFqTpoLeoqKlm80G54LWHyB7uukYzLlfHDmr+JQPWHIxFjYDoMXeOJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7AA/0+K; arc=none smtp.client-ip=74.125.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7AA/0+K"
Received: by mail-wr2-f19.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so451530f8f.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653526; x=1790258326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5IhnPgW4pLNq49awgTAAmlkGTKl3vSsqH3Qb0oXmSU=;
        b=X7AA/0+KRBWI2+7IW80qq0e/uJPsnUQRavQTFRdvVqYQTQHuxLjwebcyv0EJ4ruQIC
         JYBYejAxHAMx0QB3ohpCl7p6vav2CDBuHhZ8n6mOpcyOrNt5YSzBnYV7oJpGsoddTREg
         ecvLykpidPGwj8/b0BBmTTh8gO1rQ9O5nwC8rAAOmBAu30VZ+3ouhRIoGU9YsAyY0xN+
         MVdtQxKtwcmrs35CqGPb0xJ0Z28u/q+psk9nhHYUPU614hhczQEpJ35L8dyEAtg2vqeG
         OYdrvLaZtc5qTuAyifgelNkBgsnRPKYl9AcjOtwfjQuXMu2o3/5RvpGvwEonQpW/Ouzc
         hGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653526; x=1790258326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5IhnPgW4pLNq49awgTAAmlkGTKl3vSsqH3Qb0oXmSU=;
        b=Kd+zvmqQVmNdJhkTyMdwbHPdJrLcnVMQj/YEFBvCMjHy1NxVMTQJwTizFZ9x1sBN4q
         NH1jaLYKCn+JTvUF62OgbQDnMNDFyUvoN/j1Sk2gHjyWHm/7kb4eFUbd1YLHh4qsB4FB
         HYqYospdLxNiulCRtULk++lMRO90OyUMawsY9zqgX/gUyr5x/Z76imznUWTiG1rYRopR
         EhAnVg9fDGB20ZENstcWxvsumSNQE81/ujro9AyQ/VfCQ/J46QyF928u/DPTBd0If3Y8
         QZiUeOaP8fHzM7vH8gZY7VSzTHst7eiFLOC5BhZdQlqZu/LCmcVxGKJSICqvoT7KWaxm
         c5Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzYu8EpjbDuncPqSpMeA04bCCd6Tu5v/V4J9MIHwtFOrSxgWpPBtNhCHVAuIhAs0B8mDVv1GlmpxgWj@vger.kernel.org
X-Gm-Message-State: AFuF++mMHVuRGz5xDAm2f2chtMjcHSQhLB24enUgZGQnQItf7unq8zL0
	aa4Oh2eaRJG5ZcFzUpB4w9L5Gjhp+bxgEjKGUO8xqhwM0pzslNLC5zv9
X-Gm-Gg: AYBFou3mhh5hjHvokONddou1/oPvBjZyMK3Qz/kqZ6LHDAx+tofbjWoN4Z2GSS2JWvi
	pRx+vmHXkHAgQfyHjSwWF3BNY5wPaN5kBjXIk6WIGHWImRrzN5iTB9MyLqqWfbLQsSsRywbIDx8
	14+W/PrsG8ygzOOZXMOmhUtfZ4HwLUv1AeAZBWlnMZMfwfHVoIncaB/lQiXUVWgWrr/bwCoVwOL
	9NVrM2ziHPHsjIt2Ex2vwWFj0e2+Qv0jNoI090TT5OWK267nBrckVfmW7+R0AzZmsgtOp//mMuy
	cOhrV2RY8mJVpibx/FLHf3KJv+cJlyQ6zvuG9ehX9KD2plUtWTOxAriU7kji2HSQoKy6s1Uq5P6
	IGSkuMWMCwH5+1WLVhlpn9YevyZIkwXgIXU2hXgmYPb/fIMNXhKZe6M2cOktKY5TIN+j2lntyOg
	ThwpV5mI8l0sUSdObQxFgpDfY84M3HCBSyd13aaONuHHfrEffd0GhTyPvsdZHpuC9yxLDkJKchy
	x6Cud6ov8t8X7KtS4Uei9t3bV/BmgATSasI0kaSNO2s0A==
X-Received: by 2002:a05:6000:60e:b0:486:e901:e59 with SMTP id ffacd0b85a97d-4870d05a86emr9440738f8f.31.1789653526020;
        Thu, 17 Sep 2026 06:58:46 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm12851706f8f.30.2026.09.17.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:58:45 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH v3 0/2] Raspberry Pi 5 RTC driver
Date: Thu, 17 Sep 2026 15:58:39 +0200
Message-ID: <20260917135841.841680-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a battery-backed RTC located on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2], "There are no plans to release a public datasheet for the DA9091." So we are stuck with the firmware interface for now. PhilE also states that "The firmware needs full control of the DA9091, sometimes with extremely low latency, otherwise there's a risk the supply could just cut the power."

This series adds:
  - a DT property for the charging voltage of the RTC battery
  - the RTC driver that talks to the firmware

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a dt binding property for setting the charging voltage and
binding the driver from the raspberrypi-firmware driver instead of from
the DT.

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via the device-tree.

Testing
-------
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 272 ++++++++++++++++++
 5 files changed, 315 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0

