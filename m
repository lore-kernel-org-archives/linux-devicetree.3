Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE0457E47
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592021; cv=none; b=r/JP5CBR5S41D737ufY7Y/upaCkyfQnf9RDcKzGX9dC1qkj+ciRLWDxbB07qv8rgb1aCBYHlngjG6NyYqnQrxom1MDz8+2Q0gr45+GcdSXtHUJCog9hy85tBtmnA1+zcsJodukeQC8gvtAsbaghzoObF0yocYD1QrOVv/eQ03vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592021; c=relaxed/simple;
	bh=XPHm3b8/rIzDZZ4STJ5Xi89X9+v39OyO2AgXiID+OyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AsReEPldkD3JvXxxkmVQ9K7JdZacjxLgsasfG7AHCO0OyNtdRZ1HRQktSeMrOo0iA3f7tluGz0uNr2FYHyJZQoUXOP8pacjnm56ESr15cb1fgjavwdx0F6SNPHdlVATXoW2Fdpjj2kyePTnRDkMmDdei3aFisso0Y9nVj/WeNYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFW1PcAv; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFW1PcAv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so87183f8f.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592008; x=1790196808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzAo6Eq/l+nsylIXF7K1e1k88qd5mp1HvFUw+KqVPy4=;
        b=tFW1PcAvmDc95YkuSdhRz5SoYlfkeaRaKKgZcDOHyDWV/OiIUX393yutYIZpGnVs5M
         q9XjG4tPqaqL5UfWmJZParl1QNwUjS8tYk96aJdfJGfq/PIvrADcJcq6p0puRNPdTuuR
         sozCTcbShDVNLOP0HUhfnA4dCd3qbuCDu1tM0pU5DB3Sm9FaPLOGbPV9KbpRVCZ5X0EA
         6xBgBjugDHSQUQgklN4kK7p9oMO5HjAM17dNbIl6WI/NogiFOfBDDb2uJsDSEtf4pBkw
         uCv0aQIdoGq2b4Poyj6NqQxt4U5ZbHSrJo2UvGduLhNhe1exH489+QgkWoDxDSJQi7d6
         +lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592008; x=1790196808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzAo6Eq/l+nsylIXF7K1e1k88qd5mp1HvFUw+KqVPy4=;
        b=T5Hh2i1hTCM/pCVE6aNAYgfT4KRaNzndulFMXQvETycaSdxgYf4i4pZe7zwNKDklA+
         aGR8+XHfWZOrzI8Z9Svy7cP4qY/rCbVePXiz4JJJHLTXbqkrUML0yxpLx9d1+uQOVQ3h
         vGk25+a/1r9e/5QOOnsEFuN+9fFQwou/yVGBDxBlqKKkGTZWt+2hPTRGy1TerjPHYprc
         vvvR+YZKa3gLWIBQGz4y+1MW5I/k5qAnMZXTLHUAtz9vTkwPO1h+ibM1QgMfEZy5zwQJ
         JQjPejWa7ZGqwr1Nq58J3lnLUdn+jjk2HsdIVn+Q1UgCYrAJ7QrAZXx80rRFigC3hnKq
         5p4A==
X-Forwarded-Encrypted: i=1; AKwUvBwMjCIp+m6QIVqTyh4Bd7IeNi4d++PNseavh7bsNfSX5pv4UibfLKrU97DcKuO8L3sg397Ai+Jr752g@vger.kernel.org
X-Gm-Message-State: AFuF++nanygxTjsEoGu+wUQev3wk//4kt7/EVNpLn1cw1F5p3o3o0tD1
	fXetsqAkaRlQU+jMB0IDxJcDkRaSfPaYnwBLB3wCuMjr8UfEbRsekjP4
X-Gm-Gg: AYBFou2E/wln69zyzr0UjnGNM8yUMx6QRFyojgta3c0/hx4w6PyYuMtfi5oFt2fT7vH
	JShVddGXdm9MVPHaIXFul1UmVEBILtM0nI9+3U2+maF7c3aCP2Xh5C8E39N9XErZTh0AKTbdTR/
	/B009M7vJz9ZKlU1mOn2YfFwAr4XFVFCu/FxUyaSoiHrZ0jvmeYdzvhJkE494uDizTDT/aXmp7E
	+vHBakMPk0WjgHY9Japh10huZcvYZY80IAzv4Pb48mawHSZi316VW36I+ACJwX/RI2MiIIfUpNc
	Y+tyoZKOTgCfggnHl3h4YcEbEuu5WBL+OCyVYFfxUIujzXPMnYUEk1yYwa2yWovtxvL8JM8UhxW
	3vK210Shh5/8frY68JF7OSRS9JNa8im0eBE8a8LuUwpC2lgwb9/wv0xbO8ynS84JAItuYyrMNBT
	Un874rkdrMvn9Tuy1Uaa7GTfmZzuDQw/dNhftersFDfoy0CFOKIR7wU2b5ipK6gKYVexURNw==
X-Received: by 2002:a05:6000:41d3:b0:486:f767:8be0 with SMTP id ffacd0b85a97d-4870cee660fmr4802574f8f.12.1789592007595;
        Wed, 16 Sep 2026 13:53:27 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:27 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 0/9] rtc: abx80x: add support for abx81x
Date: Wed, 16 Sep 2026 22:51:29 +0200
Message-ID: <20260916205138.16771-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
This patch series adds support for the ABX81X RTCs, which are essentially
SPI versions of the ABX80X RTCs. The first patches (P2-P4) contain bug fixes 
(added after sashiko's review in v1-v5), then (P5-P8) we have some cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

Kind regards,
Antoni Pokusinski

---
Changes since v6:
* PATCH 4 ("rtc: abx80x: properly handle shared IRQs")
  - handle_irq: write `status & ~status_flags_clear` instead of `~status_flags_clear`
  - probe: setup watchdog right after register writes
* PATCH 6 ("rtc: abx80x: use regmap instead of I2C specific API")
  - removed the `return -EIO` case
---
Changes since v5:
* PATCH 2 ("rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()")
  Handle the case of 0<=err<7
* PATCH 4 ("rtc: abx80x: properly handle shared IRQs")
  - probe: added missing configuration key unlock before writing REG_OSC
  - handle_irq: fixed the value being written to REG_STATUS
* PATCH 6 ("rtc: abx80x: use regmap instead of I2C specific API")
  Changed the type of "flag" argument of "regmap_read()" from "int" to
  "unsigned int" in "set_time()"
Changes since v4:
  None
Changes since v3:
* PATCH 2 ("rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()")
  New patch
* PATCH 3 ("rtc: abx80x: add mutex protection for register writes")
  Replaced "guard()" with "scoped_guard()" in "abx80x_ioctl()"
* PATCH 4 ("rtc: abx80x: properly handle shared IRQs")
  Disable all the unused interrupts in "probe()"
* PATCH 6 ("rtc: abx80x: use regmap instead of I2C specific API")
  Changed the type of "flag" arguments in "regmap_read()" from "int" to "unsigned int"
---
Changes since v2:
* dropped patch "rtc: abx80x: move part autodetection before RV1805 configuration"
* PATCH 2 ("rtc: abx80x: add mutex protection for register writes")
  New patch
* PATCH 5 ("rtc: abx80x: use regmap instead of I2C specific API")
  - return PTR_ERR(regmap) on I2C regmap init error
* PATCH 8 ("rtc: abx80x: add support for ABX81X")
  - return PTR_ERR(regmap) on SPI regmap init error
---
Changes since v1:
* PATCH 1 ("dt-bindings: rtc: abx80x: document ABX81X RTCs")
  - added missing "spi-peripherals-props" reference
  - added abx815 compatible strings to the trickle charger enum list
* PATCH 2 ("rtc: abx80x: move part autodetection before RV1805 configuration")
  New patch
* PATCH 3 ("rtc: abx80x: properly handle shared IRQs")
  New patch
* PATCH 5 ("rtc: abx80x: use regmap instead of I2C specific API")
  - changed regmap_read() argument types from `int` to `unsigned int`
---

Antoni Pokusinski (9):
  dt-bindings: rtc: abx80x: document ABX81X RTCs
  rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
  rtc: abx80x: add mutex protection for register writes
  rtc: abx80x: properly handle shared IRQs
  rtc: abx80x: add irq to struct abx80x_priv
  rtc: abx80x: use regmap instead of I2C specific API
  rtc: abx80x: replace read-modify-write pattern with regmap helpers
  rtc: abx80x: create abx80x_i2c_probe()
  rtc: abx80x: add support for ABX81X

 .../bindings/rtc/abracon,abx80x.yaml          |  18 +-
 drivers/rtc/Kconfig                           |  25 +-
 drivers/rtc/rtc-abx80x.c                      | 656 +++++++++++-------
 3 files changed, 449 insertions(+), 250 deletions(-)

-- 
2.55.0

