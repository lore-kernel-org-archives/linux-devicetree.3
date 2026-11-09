Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239106;
	b=sFqxYTAbpg1s6eCDA6lRh2A0zvYpJIXKaZ9W74Lb2XxdWWJw3c0B05zG1Rvq3Ti5+FQj
	 6nJZBbjzJWw3sytnnfskLxoJxfYUR4RBCM+LqtnqiQHBBQaLLy9hjx7X1dV/2FWKc3Dx1
	 6zLvDSGHpPav9mDGhKVeNI3V6B040RF4JVVzkUm14knVuGe+1jvA+eka1m5ntOyx6dAb/
	 kH5TxGIZBahYqjxNokenTjC0BexFNZfK53gFJ5flh0AGPKhSTMNvpTrz6n9pmtAaaXdgC
	 0BSAVlQgX2t6rfMnqv0MX9e7XXIBx31wlj2ylqpHLfrRmcDvWmDw4bgxjk7o6VZDomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
	b=b1fe6yFj0HmiTmCmauVykyIZwqwpXLryA7t/xfIg7+pJiuhkVtXd8+GnRCglxvG+rMNN
	 gahQGmYKkhx9EKqo8cht8hXyaLKvLGmoS8eU3YLsR4tROaTlRCuNsuur2zZGFYJqOC00J
	 /jMCIspDl5fyiTqJHMQCVjVoZOHBHA8Tloc+lO8MpAeYQlb+jfnup+f6HfnjdJJoYct7d
	 TYFwHXSoS6TS4VR4Xt4F0lIVif2ibYMnPj0T7rV/kH8UMinF6ZtsiY2sWZba2hDHsw+ef
	 KvQEbSjRqOMZzQOJoOdsSzFa6NXKq+xNaFzbAHM4CvbP/MjPCcPgztRbpnA2hAAi4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kSco/aPR";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0612606EE88
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0612606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSco/aPR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso7883505e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239104; x=1794843904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
        b=kSco/aPRed7aKGpqjXFcYCWpeSXf4f6oONj5r25xKurUKJXNRTttgl000KMome1nia
         DD6FfhhgoYOA/xuvx/Bnr4N5DWd622HmuNAtU8m9g8Wgh2c9KDhd+bFFW3cKLqMY9dAX
         CG88pSgH+dBsguCWtNgsxdgLclbDp4TQwEngOXDN9+YLC0qkn6YKeQwzGkOQFs+yBmgg
         mOtsq4OcVSo1/2OyXrdQa1wyHSkE4qJj02eRpY4hnjH6TldObpX4tVtZrIFtfQmd4S/I
         CdKTqq8UfVdNxaA9b0FIklb5ZJwfj0r70HCVQ+K99o3VbVfH9+rwd244vJENKM1nvD/Y
         WKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239104; x=1794843904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
        b=m3Poo4woAuRNKYTiuYBxiDYAGYwyR2qvIX10us/1AcxdPI1tRPfF60q24AamuVvkrO
         3zUqSVwBGWcV2vezRrM7uWoK5PaXKlkJ7aQboDTwRPPmRXiRnC8KufIX3k5sgmwMsUBs
         ijH5TEQzW5Ewn7AspgPOZzRZL7f1AzasnrdCl+fILlIK+QYowfeomfyQkA8EfyJhOfdb
         tj2Uz8X+wNgm9JisEqD5R+3w7LcZavlaXb50ZjFO6jBH5diNHp7Uzmu1weT/dhYw/dTT
         hv60nDlnCVZgsp2ntsBRmMlxn/CJTBvuWebFOJIwlglf7BunZaHWaXSFg4aCAI5icbCQ
         oVOg==
X-Forwarded-Encrypted: i=1; AL+hErGkxKVHWtlo+YrRvH+a2X4hIozy5KOHsZTNHMDc54nk3TNdL+ryOv2HSM2Rej/TcECCWr6QAzmHWXiW@vger.kernel.org
X-Gm-Message-State: APuU4Z8lRosut9KAyrbviglEl9pAlJUnPmUig1L12Lqmoodm4SGrqUve
	YpvxZOLguDYqig+nfwPOjoq2klqqs2TQoHaXRrVtYwJTCYmuCsCcYCmA
X-Gm-Gg: AYBFou1pRzlM7jT6ekJl7UmkWEEKgFckTDHUMyDu3H4a48zDoNsJLLRPs5TyzWQcscc
	dO94FTnTmAOaz1c1Ef2vuc384kZJAg02ffw95BvixtZRoznHdMg7kAT00M2tDEyQFEcye0twJjO
	PHuv69bRjeCp0tHDGcgWJM0xO7QJaZhyEAjVgwWP1uQOYtg/2YKkXCJUF0T+A3gLOsb6lWLWh76
	dqwuqTvPPhHBf4MmaJqRKagCy+IpxAZ2TrsbESKhfiM6rB9Pfuk+j667pn0qENKUmkF3kGE5mWa
	TyUcNntLMD6254uxlNWxNTZuBnSuYNTk9M2Le8J1r1upTgISYVOARJicqpYTOHD+t/ds9fA06IU
	W8QUTsUsoIInICava7P9KuKMVkuQoGAUc7N0B5eeC2BBc85YTifJi/DlqXESOXqMTBMLbB/YEif
	kp1MWkZYF15r85jXuMnIu6neV7+7bXTqhDExQKcjTaBGNT0EIUWurAlxWr76G4CEnk1WHLLP+4G
	iZE2jPmTVxRBehHYAGp7isTO2+3XG8xx8eQENV4m+k4Ta+AE0OwK/98265Ao2a8Gb2tBSpAPCiJ
	QYq80dvrUwpcQ4MyTWHoWr7Zy8SVAtR2LRdCRLxMsBnbeAO6zkoPdP4=
X-Received: by 2002:a05:600c:4505:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4b963c85de8mr84815385e9.33.1794239104072;
        Mon, 09 Nov 2026 07:45:04 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:03 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 0/4] rtc: Add StarFive JH7110 RTC support
Date: Mon,  9 Nov 2026 15:44:57 +0000
Message-ID: <20261109154501.63762-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JH7110 has an RTC in its always-on domain that mainline does not
support. This series adds a binding, a driver, a MAINTAINERS entry and
the SoC DT node.

The driver is based on the StarFive vendor driver (rtc-starfive.c,
commit ebac2b5 in the StarFive 6.12 tree), reworked for mainline:
- hardware calibration and the default time set in probe are dropped
- wakeup uses the generic wake IRQ helpers instead of the irq_desc hack
- set_time waits for the counter to load the new time
- read_time re-reads if the time rolls over between TIME and DATE
- the offset rounds to the nearest step and follows the sysfs sign
  convention (positive = slower)
- the 32.768 kHz counter clock is described in the binding and enabled

Thanks to ziv.xu and Hal Feng at StarFive for the original driver.

Tested on a VisionFive 2 v1.3B with next-20261105 and v7.3.1: setting
and reading the time across the 2000-2099 range (out-of-range years
refused), leap day and century rollover, the alarm interrupt with
cancel, the offset, the rate over 60 s, and setting the system clock at
boot. Not tested: suspend wakeup, drift over hours, and keeping time
across a power-off, as the board has no RTC battery connector.

Known behaviour: the RTC loses about the length of a reboot across a
warm reboot; the counter appears to stop during reset. After the
StarFive vendor kernel the first boot found an invalid time. I would
appreciate an opinion on whether this is expected of the hardware or
something the driver should handle.

Changes in v3:
- dt-bindings: add Conor's Acked-by
- driver: add my copyright line; drop the extra space before the
  register bit field defines (as requested by E Shattow)
- dts: rename the node label from rtc to soc_rtc, leaving rtc free for
  a carrier board's RTC (as requested by E Shattow)

Changes in v2:
- dt-bindings: list myself as maintainer instead of the RTC subsystem
  maintainer (as requested by Conor)
- MAINTAINERS: new patch adding an entry for the driver & binding
- driver: drop the <linux/mod_devicetable.h> include (as requested by Uwe)

v1: https://lore.kernel.org/r/20261106175600.3877614-0-oo.hehir@gmail.com
v2: https://lore.kernel.org/r/20261108212826.15890-1-oo.hehir@gmail.com

Owen O'Hehir (3):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 324 ++++++++++++++++++
 6 files changed, 442 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

