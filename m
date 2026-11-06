Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987767;
	b=3sxgIUhq1NdMzp31KHwS39JzG0iqkgu+s/FeT/IEOQHXtVMxftDHO8kojIKTv9pIMK05
	 XfsP/z2rT0KmPOOf7O6yohiasQKw8/UmwkJiVIZo7gYHSd9N3JWiq7UoI9wMQ/egkTJrk
	 gx4tWVbrrVannaR3C69lqjIKKiyyhzyGYIQXoX/cJOvjiHkzB/VcXcWpNJXoImGe/WKKq
	 NmVpJiWdWcMBF2519eywhWtV1sYBBcT1VBXoiwhtArFe728jfVFw7BuG0N7Os8cyMcVuo
	 XK7P515DBwW6mK+hLs+gi+AZB+d8AfjmxFHVfXDmmwbx0cs0RZR2rtqnBZ2yb/RkL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
	b=Tog+vHVUgDtUdBOFnXRHr+QpvaFzcZO4D7mzfFPz4s8Eck/dvtxPI5UvP4qzKbAa4d4P
	 M9sCWaOdSBe31DzkrT2dTNcETkQ3deOLY3u7SQfQzQDaG9YQE1+Q/u6JkmPLyxscZ1KUV
	 43IVV25yF9E7SKp5FDWJjn0dTmdaETEJlUO/beObfCONwOKi2sYOJn47msbbLOPVZ7o1n
	 HlPQJq9bwQJ3iZ18shiL5TtTP7zugjajrq3oGG/JFukRMQvBFr5x58BikRX5HjVoW4ZuL
	 97KIVoBx1rRCLEvKGccFqFLGuSh9GpZBtpdUyHz+BAaisHjsjgBSUacjIGWEmJv6Gzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+H0HZfu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CFD606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CFD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+H0HZfu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9324615e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987765; x=1794592565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
        b=V+H0HZfuTjx0Yt+dhwl4yeTKKlDgXEr3C1GsMwtWgCCUZjAxIesAi7BUXLUNUSahqo
         ICrbdZax4dlin0+p4rGRpLRVfRDMJavHxfuDXVl5AvWk1HxXqAG54IC6BERDolBsf/1l
         gJkrXrEfAtsF+vfP0ivxMiNmYG2tcMCbFPOnLa6cPd1Q4pQRkQIkwmiBhUV8q1iTAMaZ
         zlJo7pppydqapsxWdkYw5O2qjSbYx8y4TMeer+qhSvxjARNf3fBLSrxymEBy/u2k6TD6
         uRuRsBu8sMSaBLbjHUTk4ft50a65InkQLoA0caroKnBb0A8igA0KcIjdJvcDDTAcjIYl
         wYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987765; x=1794592565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
        b=ljM8sBICCJ111+NI8bKYS364oNZcRSWcL+GLdzROtAMHRa1aJ6F6YYwkej+Zqz5mui
         WUz6XFQK7ZxoqBMgaFijtScSe8uMw79bBxwBOPB3cRywX5YBq8cp04ZGa0PLWUQNbozq
         Dm+dM1rPqtlvcYW7e11VvWxnnBa62KXsSA5yAzKAdsRK7YK+trLOU9yTbo7b86hoMKV5
         nB11PRl5/O7/YbvoJSf3CJ9KU/SsCG7IMX6o4ZADB3EDxb2iZ9gn76l1qk+MStsxswrm
         IAHYUZBGcjdqr+d+79Xeu3RFzOq/xTPShq7gPvFZpw+LF3pRRS6T7C/YCFdM95Omfhd+
         iLtg==
X-Forwarded-Encrypted: i=1; AKwUvBxF8LxRYUiynNsxtR3oCrtyXNld+nmz6jGkAYcU20ipAbke931WBLxV5C+90qO+9LqTilotwDEBUA6t@vger.kernel.org
X-Gm-Message-State: APuU4Z9k1eu4akjkGhPVVobv85YJ3VAk1NomrHxizgRjMAZIg25zKN2O
	uuiG+sxhGCn+nE125IHdC4MYMF1EYa6dRZ0oQfcp9oEKMPeOMY+/PdX4
X-Gm-Gg: AYBFou0WMQ+CZ2NruIpXWjBM4MP1Ssoq/U1wXkDpADKJ27RbMMAAnBYBn+6HUtV/JHH
	5KzE70qqEyXS78Icrr/GuEXt3ecfukKSTpjJToH4cEsHOeyQWY6XMqqqkS9PRRJ6HUwQdSswxdG
	hP3KcwtanL8sCH/FJNfFpnqByg8IdqZQjw1zfq/0oFAd9wTGwGFEBJJQhQRVvvZ/kGpyJdL+yNT
	JmUVYSICX2ODgS+TKzhmwLaCNYEkaYTQfwZL5VHiWt42dUxDcXlneuNbLy/6nNavKbO3bF3x+I7
	6xYc/8RigeGp6+htXmz1dWN5FAcN/G6ddpuP6CqJGcu9OxvHB1mwNRtWmpfD7FF90gaBJypsowi
	Cv/vukZJjeczM8FzTt/wPaTVSlyF/ITxIX1cMc+ntlaKcnIzQY7GKiiYR7wQ4e5Fjn1SqnYMoN+
	Z8YmskMCsOK4qLQJte5SFWKavSV90FANMZlW/m0+nHCUrqnwnaKnnRy8+QQujsr1pJ6j5SSGAn1
	hSbgfMQ658kPDDFSno206mQprpXVcKceCpk+wWpNLax68JqLzAakcigsAxn0tZEV7M0yGcoOR2C
	kyVqUjiGmd9vOFm333hgEKp9qj2CDCC2tux0qN8K1cZPlri7sziT
X-Received: by 2002:a05:600c:4f4a:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4b6e017248dmr56108655e9.30.1793987764822;
        Fri, 06 Nov 2026 09:56:04 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:03 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 0/3] rtc: Add StarFive JH7110 RTC support
Date: Fri,  6 Nov 2026 17:55:57 +0000
Message-ID: <20261106175600.3877614-1-oo.hehir@gmail.com>
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
support. This series adds a binding, a driver and the SoC DT node.

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

The binding lists the RTC maintainer, as no one at StarFive has taken
it on; I'm happy to change it if someone from StarFive wants to.

Owen O'Hehir (2):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 324 ++++++++++++++++++
 5 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

