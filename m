Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173311;
	b=GHrNtsbP0xVbQAeLPcLkecSXVqINfiKMpy+RYFBd1r3B7ePncy0wadHCAIA8pIa5sAn2
	 x0VMqClAGqcyjbUEFsMVMorMoJuHaXXkc/KjHWCe6K/PxXqSlnyTebGaNI9tbfu5i20jD
	 G78CNxaVdxYgGJNfT3kzn9KCy3TLxBAnFSYZdspSK6aenvfFR1OgaF9tNrF7hIhhDL5wV
	 CXgKzUneLAbFYNZy6VJCPPOsFN7OVcxbCfApDw9nnn/4EUFGvWfGnO5FJpSpEm1fnIlmq
	 2l6kj2sKKZLg8q8R8P4PbLCEN4icxXeZL5jQLdupvhJQi4IPl8SCdaNBTxC3KzdChHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
	b=QgoSudlH7IW276Np0kSc7nV6yVdErQc19ZhwquoLNj85pEb3nTBYz2V6FaH48pvDODl0
	 dhF197h6yvm4xQYwoHIqylfOO1RzO1nNt9dnPZIwyvf8+yPKyEsC1sBb1LZugNMeKkItD
	 F82La9qnL8dbz0NRy8n1U01m72KE48q4GQzYc847PtTmiF64jGCaYjGsLVJLK86ZQUmMO
	 XwUMkipPLii/magOiy4Hn8ABwnNtpoSi4thkIb98lTi4ejKc7fF3El+gqY9vQ7fSLcc10
	 quRZAGeLlb0drb459NgcVB7n26bL7dLjHIvaZvq4cx7KYLCywRZvlk8CA/grXrCUAYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+F+2Bwm;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408A606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0408A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+F+2Bwm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so1645515e9.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173309; x=1794778109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
        b=Y+F+2BwmYv0DtI5WOVJMdRg207Njhn6eyGCR6e0FzV4rgq1N/TQt94orO7XzdbyVDr
         69xU8w3l9e3PvI+9rmrpR/oUU3a8C6uBuSHNUhGmsDGhXQlM1dBkod8PZ9j+n2D5ZDfy
         ooO+ylP0lqi3cUDo18KJelZ6kbyoIvhqXAVcePTpfYbNfxkUArhC8R6BXN15GlV1Hrs6
         Ll4GWvpnPmDLVkACkZxFQ0ymePnrTlDBAbaW1FlGnmHG21eFkEW8SZa3VwXMCkIIHLbi
         9ETtdJ4lA0RlOYRNSgae95R8OI0XM/86YfYu2VtV36V8P/c6bo+Oy+M2oyBzFPL10dd7
         UYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173309; x=1794778109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
        b=zc0jcxqHXxAmY2/u5GWECe6pudePPrQ2rYp43OfiEb09HEIGDLQrJxdWir166gRP5Y
         UufDz80Ayne3654BCcVuc2mMTgeg/ZWt0yBYCX9BJuWRCIqcjoeuZx2Q8PTfkCZIKbJG
         JvTAUemiGRNEgKp99Qyfge6sINO4nXABP08qo++6JrVKniF9vKKwLEpT4YtF1WvQdLJ3
         liOw1iIY1E9lEii8dQ37u5ozzP3jFiK1zqTq3txbA2S8FxyFcXc4Ytqj3YtkDL2y078S
         dZIaFQj7mxJUSloMmJ1RZEfGLCc1YFhO0hR97wKi+8Ed0EoNnlHHYmxzGjkldj+gxLN4
         WV4g==
X-Forwarded-Encrypted: i=1; AL+hErG+MIMeQKvNG8Z4xUnHnXgbKt69unESIUMYLvzHfxEu2h9Swh9XUwreWAsdQgskjXEZXwtTQWc3RY5L@vger.kernel.org
X-Gm-Message-State: APuU4Z9gn1PXIt5jLcg72nyMps4HC7kiGWk4SRU2ICsJU6WbCtpSkDbx
	nMolly8ZMwZX+1SkMeqpQ+b4EPSIJJ71n0RGsD4wjlDz9Icwkqm+RNNI
X-Gm-Gg: AYBFou3VkpwMZszFI65acbEQ46kFHFVG98B0BTy/1yG5NfZKY+RLZWOcWPkQKGSXgin
	22tn2nU+Q/gZpwroKsu+wHj9Y6sneOqStvUozys/8HBx9dgD7/jn98OXQYSNaazxRy2ZfB9cX9B
	wqnUdLPbizmynpTjurT5mVxq/NiujeBGXdseiV0GCEhxVwpTysJ3IldKZ0zKU9ricmUYdaQN4zb
	vg0sQrHjlT3Z3AS0XY48RjXgp83Vb+Ymx8amymf2qshTtwUuj/Zeimbz80X1EPcCMsNSthRNOay
	uxHjqbKv3cMVny1Na3fbzCrlJdqiJubppc9yKp8ZEqgvCKpiETQFnMZ7DZfVzXeZf0qgamD882I
	Skrocu8JBB3p77jeUGNkLiwTdbjxzfB0lZ66MdCDKr072+wd6smJAn9I5PIpoWrxVO4+cfpqCNM
	MjiiCkSdaXpCTrFahOEp4DW+2VQPE+5/SHcmNKn2M+XT3OpeafKtbc3YBMDKBs+NMfS0lmZVN/n
	jZx9HgTc7KTsOJH2JlSnejtkeiBTs3HncfKcqYyNCgZmaZLxoGCaCuQ9u+DgJ+WkOzW0uIyxPTS
	i+I8PvsX0L5K8HyEB21jBVWEPerwxgJquw==
X-Received: by 2002:a05:600c:c16b:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4b963c6754fmr40690035e9.13.1794173309099;
        Sun, 08 Nov 2026 13:28:29 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:28 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 0/4] rtc: Add StarFive JH7110 RTC support
Date: Sun,  8 Nov 2026 21:28:22 +0000
Message-ID: <20261108212826.15890-1-oo.hehir@gmail.com>
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

Changes in v2:
- dt-bindings: list myself as maintainer instead of the RTC subsystem
  maintainer (as requested by Conor)
- MAINTAINERS: new patch adding an entry for the driver & binding
- driver: drop the <linux/mod_devicetable.h> include (as requested by Uwe)

v1: https://lore.kernel.org/r/20261106175600.3877614-0-oo.hehir@gmail.com

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
 drivers/rtc/rtc-jh7110.c                      | 323 ++++++++++++++++++
 6 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

