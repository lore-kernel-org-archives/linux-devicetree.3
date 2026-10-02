Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A13C46982C
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936670; cv=none; b=TWRtSElvOzFZSmEPnjXi/kScVhPtpYhrsuMP7nn0hfsl+lxmIDmIFJ2gMgSi3WWpRxPpqTm2yQvVMh/U0j5HOpiU1FUpB3V9jKHG6viKVWwGjtzH8EVy3NgGqS+mxu8K36fxrq+lhCvbZa7+veqzySy4/Ro8a5jNYnBPOsKjAOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936670; c=relaxed/simple;
	bh=HeEXUdktO9KuRaUQsVoZqQb0BoOKr1S1BCYes0d8csc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cM+ttCE9cbOj/UE49dZekiYEpN4J+wptT255DoC4UcEzQBMcUSjdYyMI6GgZ/Z3+rGH6ZhNQujbwSSqiV3/vlGaqYn0YMHbmiR7GpTzqDizMt4bpVeKSGW7c6lBCPDnAoU8mwzsEU3k7cI4NNKC6m4s8aSbDF+3/C2Lii7CezN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKwMZdgI; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKwMZdgI"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so1215499f8f.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936666; x=1791541466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi+ts+54+GxWxgSe/WCnTwbV91QjI4mJzfhTrvNy+Cg=;
        b=UKwMZdgIsN/lRpJbW/OcL9e2hkPcfvl+tMPrCC6YFj1AI6M9Rn6CFIirTISlou3a0g
         FtdFrmPmu6bYOeZdoCFHRftM5/HxR9u4g4uGY55eQGvDX0uUUwfgt21YRe4XnKD8hMYx
         2AXulJtumSKByfocPlF18I/y9hx/7Rk8ZkTiu56ksLf8+Xwb4XM126TefeSRhRPMDvcK
         0HH+isTk5dqKa/SZ9KiQPqBS6zzTkiXNxgdvmvrpq3nhTypBK15rZohcdnha4QLxZAOI
         PKEMDWR1zs+74RPNrhlImaWl/c5CyI75KxRNj0Ii2kxaDA9gMOctHviIMhd1Hsld5Zkd
         xcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936666; x=1791541466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi+ts+54+GxWxgSe/WCnTwbV91QjI4mJzfhTrvNy+Cg=;
        b=oxNoeiB7vTqnm4XSRRJdu+eAAx01H6DrL3yZAYnXdXNe8toVZB1G6MOUnwdrN/EIGO
         m2N9CjQvuWykNZss4xDXE0AcMJyQhLIA1EW61hnzI565OQtmmsO5FxEHwniTJ56KnNEd
         A4AtU0J8x8+nxNZjP7vr6u1u2tnyhsz44W0Gr/j8TSd1X+3vNqza8agXRqoX+N3Y9eKJ
         BwkQ3W6IzmFBHRWGjSK+VawhLqePiXTzSKlqadl+9Wn4/lx7s867uPT3a7OIPy6zfKq7
         mxPMy2Fl2U+kRyvImB9oTLs0jFYkSKsRCFAOpu8cv79s99HoI/1PAEQtxH/50z8u5A1W
         Yp9w==
X-Forwarded-Encrypted: i=1; AKwUvBz1FeA68Q+nZbdFUiFpjEyz3AhUIPJVa7KAuxW9uLUOOwX9MBYeH5jTKCH0rCoQsSbJWT7F4TAXHT9Q@vger.kernel.org
X-Gm-Message-State: AFuF++mqblqkGoMD9pVgMEZVS0x/s/PbFxkZ87n18B5Hs1bg3GnthIsH
	U6e6/qHb/M1stK4M098wq+mwEdCLnUtUqMfTSynrF5ynylNx/yUjRRa4
X-Gm-Gg: AYBFou3MzV+CkS44pGyiBpw31St1s/xvyzN1LoOrN1XAWtt89WQER0TiYOvsdYE+gm5
	HHQZ6zTue0N0JQ81YVRCeSs9+Ej0OpIl+aiO3bk9dII6XDF9iWK02TrXhgc1ie95j77qBPi60yg
	QxrTxt3AD7NqgT4rP61fjDjm0dIVoFK8jdYZGPpmWOa8QJaD79i28FUGEqHaUvchB23BBwle2GO
	J6jxJvMVT0SoPaekstxGNQ3q8c8Y1F+urmGq8FTc0VrCFMjlWrrfKU4bVkCgU5SAoP2tZWYlRH8
	N3oX82Xm8yHrEkdPe51vw8/thRHAlJep6aLv/YizIbU5DpP+M4o2ik3cypddNTAeQyB7fjD41Tz
	r+9Vp9r0cqnmligGTVv9K4AYC0UaXhwzPcOOoAYTigM33K4S3iPeNs+lQEWX6xJUOaEPn39RN7n
	5i1+G5blOTygSBYIhsys5P2YxWN6w6HmhOgHne4j3LO1JhbSPXEzfmLfnFiYXwcEpmzIrxqXSFy
	0PPuCRHeYLfLRuai1NNkD/G9JFhp9ezQvauUfxq+bDGKQ==
X-Received: by 2002:a05:600c:c102:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a027534963mr34224645e9.4.1790936666286;
        Fri, 02 Oct 2026 03:24:26 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm99557875e9.11.2026.10.02.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:24:26 -0700 (PDT)
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
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com
Subject: [PATCH v10 0/3] Raspberry Pi 5 RTC driver
Date: Fri,  2 Oct 2026 12:24:16 +0200
Message-ID: <20261002102419.830595-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a battery-backed RTC located
on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2],
"There are no plans to release a public datasheet for the DA9091."
So we are stuck with the firmware interface for now.
PhilE also states that "The firmware needs full control of the DA9091,
sometimes with extremely low latency,
otherwise there's a risk the supply could just cut the power."

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
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (3):
  dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 .../devicetree/bindings/rtc/rtc.yaml          |   1 +
 drivers/firmware/raspberrypi.c                |  24 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 276 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h    |   2 +
 7 files changed, 322 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

