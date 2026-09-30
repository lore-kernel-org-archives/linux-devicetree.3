Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2BA443A88
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754375; cv=none; b=bq7vv2kWjtxiwUXgOfjYpYaF4hRVtydNSBPHNriwwKdVK3IZ0RIOl980y9eDybOuR/aH5olU9m1tHk1n2vFU7mzMGVt4j0tR9HuoLTs1rlkodH4RemYfNUTI4nDtp5rwqzggszWw7cei3oRdxcxlOvmLI9+WULNGxHbSBoTmet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754375; c=relaxed/simple;
	bh=XTNinBk7hZTvbTte1FT4wZGpG+OlZDOhdwHWpbQga80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djNWu9Vo7fznCUw/Z8sh8EFat5j3g2/N4fn6Zou9hSyE/HljRiMc0hAPP+HJkBj3W6wJqQeCYRMQSmm7uOTSG+Wp1BfC3PuUAcwJcESuaxyoYkjsg2DGjH1DViC8Fqz4aCM26qYfPVOzYsgoRYyjWw/FxczBr86P1aXbZ+vxfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dci1kWfQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dci1kWfQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso3895956f8f.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754371; x=1791359171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nV+g1hQFsSgbglJkQaFO0JiMO0Uva3k8KCHEJ6l5/OM=;
        b=Dci1kWfQOKZDaLCd4iWULibwvL8NVEFPlLqeF30MQryE4Kz4gtpR9dX/7qLbAv/5YW
         tqflPjPvFLe+8wKk5+lnuJ1t840el5ohEQtnDmTaLCDfJRhriwQrBidORLwBGy+6NJP9
         SOP/P7FW0SupXhXXJDJQ8Z6RK/LeD77eaJBwluHpQSm/tIA6hdlXgamVF2Fpcz0Yn/d0
         SNMFeClCjxN5n1JQgLaP7zmBFmqLQva6+D9eGETF77doyrODCQaV+/bglE2e1t52Wb2x
         yzr92NaW+s5qR43cJUyhTAs1GYW+K2Ha0PRjryxUwPs0tOFEO+tfCsF0ckxhFx3tvgjC
         kRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754371; x=1791359171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nV+g1hQFsSgbglJkQaFO0JiMO0Uva3k8KCHEJ6l5/OM=;
        b=gVgLUkOEYHxeqL1M0FSszkoRe3Ifq4B6lu7ilRKNQUyL9YcDuuJAt+fimmwxO7rC3v
         Xolr1Pq/T2lfuMFQ3OS+Dumxtv/DmckmTeRMIgIG83fs41mul9mMpDyW/g/arSCrNr/A
         x5A2Ww6IR8RICj5hpAQK2MB2dLVozn5OlV23FY13+bZnz0/OZ+uI/GsKTVzAbqKDNiUl
         6O5FIv4bfsVWqP4okmZ3Lz3+QzE6pemsetpxbtwanK+Uv8M4iGP3vszklkM9s0qPIbnj
         T0MYZefmma/pm0TxePBFtf99m8YdwpCRg8DALM8U8I6lcqN3n5mC6Qccrpof5yxufbBX
         eF6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkY4Y8f8xwEmGf0J04ioKMWGqZbYQDo7gUv7Ch2tqUVyV4ntLzxk6IqZdrK+un2aNSk+iS7XtKQILr@vger.kernel.org
X-Gm-Message-State: AFq9FYJtNFfAe8w4XlIQf3mq9nabPCidh1TLVGGG2sxxDMmyy20bymYj
	n+MTLghwD923VOIdWIjiDdV6wNMLGCbDE/RJSAfgWfFQPLf/EurG+43J
X-Gm-Gg: AYBFou1YwghYDg0/T+OdHcBC0AahtAg6DypV4sl6OhNfPvzZA5FhRuz8PPsGHxOJLIm
	croNBhamKcBTYVFNkLUoJBxYhb+GMor84WROAJ8mX9KlJhmYElT3qnN4A9xpramWetu4vvUQxw2
	st95kNwDWxCdXPhauf0J2F+mOTf3n3dBRNn4Z0Jhnl1d6ojZ2+Sw4EIx54J5Gw9WlcJ54kpArU1
	+Clrl6U4dIIpDc6fZ1u2EDwpglHWo6NA3XHWqXRrg6uu8JWBmvTd/0MHxxryQMCIdCfQGuyZlGk
	+j7FzGCguG6Ng6SZ1O5a+Lwd7dZpMXilZPoRHrHBY2wtIhCVaofe6x3kmPbK70dy9CnfUq4mwF+
	2Wy3L4vLeuwDSpvPCVTPKD/FjaXUhYMVwj3hH6JoiOA73i79UwklLNMeU++StDscYdTnuJYJsqM
	GM7zBYf3eDeVNMF/EcXYAWV86eQFpt/TcNrKsTyiq6ZCHV31lYza4/8+wfE3KtXhRIpK+ozfqgH
	tEvEIjqX5OjpljDXO1cViVVx9Xa22szqHl4iOw1gm7eWw==
X-Received: by 2002:a05:6000:186a:b0:48a:fbf7:15b3 with SMTP id ffacd0b85a97d-48b02557516mr955736f8f.54.1790754370568;
        Wed, 30 Sep 2026 00:46:10 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0185asm1487480f8f.32.2026.09.30.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:46:10 -0700 (PDT)
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
Subject: [PATCH v6 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 09:46:06 +0200
Message-ID: <20260930074608.479089-1-sander.speetjens@gmail.com>
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

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 251 ++++++++++++++++++
 5 files changed, 295 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0

