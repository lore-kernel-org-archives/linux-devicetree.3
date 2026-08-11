Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621D4766BE
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477340; cv=none; b=Lk2t6+9xbpVCJT5bUAeL+5y/NpL/reYOgn5WMB0JUEh5uS8Ge03qPG1N0ygX0HOr6zySOsYq1sUmsk244by/fBvqiAS4TsgtQZWd+wTQ17c27Sff/dxZkwS912HdWLbBlZ/KswbuBM8b8TjfGbtFB9ulRPfqsh/0YFh/kiohkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477340; c=relaxed/simple;
	bh=9jLxGPmQdjY7gophUedDuJ2AuFWVcIwvtw1u92qrHVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMsehrVPj28SsA1RLekrdvm2rskK29ritHIqlIC8Fv2k07jU0TlJybHHPznhI5QKYois1m2r4L96zgSfZWHV073qWMOZdP8nrgZj8aH9HtH6xpK2M07jZEdYC5Z9/J/Ci/P5v2vlJ88Sr1orvIq7BvRayexJj7oGC+Vp/JMZaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPdzFfGd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPdzFfGd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so592835e9.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477336; x=1787082136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QD+8mdn/ihWEyfoj8EZu5dauxKHrsP3QtiGEL9IzKhM=;
        b=dPdzFfGdprY3Wp1x6P/E7SU5UPRnWIvagalniuNyq2IWoRYtQSKekajzB0oT1OcGwl
         2YAP3cXFbe1LMOBYpRqN1pVvR4T3nktX3f1OTVkLVMV4TiqmyDcnd14XuXJQvIkxxRuf
         vPoC/kizprfyCxQnHbrOpHr+0RYeTBCb6DtGWruCCAz67YTjbqH7lWYOMr+E5p4bf7Tb
         MhLg1MsLGXZOOvWzRHNCTxmiNI4cNo/mnAi730gOoAqrFEZTF6LE5GkTDTKb0uN+N26z
         2xVWTsl19gwdzaRV403SP4nyS0D/6ey3IeggIib96ycRi5LiI5QJo2LByM1Yx/jVXuq5
         phIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477336; x=1787082136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QD+8mdn/ihWEyfoj8EZu5dauxKHrsP3QtiGEL9IzKhM=;
        b=DTv1zrli4+9SpMXL6ut8YLQ8CR+Gn5s8p2qRQDsxiDPU3ZufjfKPXNYdZ93zuDGz6c
         9/kyPSk337DzS572H0lN7LCwCkI6u7Tp6ZPJCWcok3kY50Cg1nB9h4COW0RiZC2sC0O7
         bhj+ZnPaoZMPHTqGDQZ7zwNo/Jt8jmaPXgbLgADIeuvD6mp+QhVjWVOXBrX0t5lZiXqM
         aP8uLscDq7FFAr0jY7JYirqHu8dIyQCn4U4Dt3IMBqyie24oWUXaH0Fq67j1OVyKpsuj
         zTjnZ8O9GFLvlv0yPJ3TGnv+QM1LsoKfqrv3l69nvQVzuzg9EeUD32A48tcQBty2ZXxK
         C/Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rog/HdpKVQRFxqb7ZkS0dvPyzUhSqWpxVKTYKTCLKlu0EpeDzvJT2A4ws2p3mZrUvGKkY8MIuQt4snu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7SB9UZDgpvlzb/BsuyZvveXzPNSttveMRla3UBmftccabQiAp
	YAbDBdYQwwHXrzpWNi+xbyP7tWKOFfK1e0pt4Jrm5y6LueDfkx0vi/rG
X-Gm-Gg: AR+sD119rDwFmJPIQlACt9XeoGIjYETKemSdGokMC3KXI0c4aKwCOxNw+QBEEZ7OXX/
	bTU5e2O3q00agqpYzln0xcm+T3moyRMfXdlPuxcYScLLnpE68VbRcM544hJrAjw/+jD/p0Wq5PQ
	lMnEljZZElNulOedY7kcF9HKH/LrGtTTKDX4u/Ur65VxeoW32P2RnlRygmtZVOw1yzy3YUVvS0v
	ue0vf+n5avNod37dUIgL87seWxmYsONFh6A8WjDEOyG9ZLYtBRrL5mG1eX/1oBZoluUzp1M0r4j
	pJmGivw806bKRm/HbFG3rvcxHWdNk5D6JTp+qG9LzFP9X+3RrcQViltCB0S0969Kt26t24TaG2m
	Olps+0uLbhNqjCiSvYpVGCopHNeQxg9bjJd0k32wRpXsB2rVYeZuwyJE6RrSh3Btf+KQq1hslZ7
	Jr+jwLPWShnGYmUjfa/xG6A+VL2B3iPs9QnBo/FeL+R/PJVfGtGYLzsOIi15o4uEXC
X-Received: by 2002:a05:600c:46ca:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4997a65397amr28604315e9.11.1786477336477;
        Tue, 11 Aug 2026 12:42:16 -0700 (PDT)
Received: from antoniarch ([78.213.143.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm2606535e9.2.2026.08.11.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:16 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v5 0/9] rtc: abx80x: add support for abx81x
Date: Tue, 11 Aug 2026 21:40:25 +0200
Message-ID: <20260811194034.28937-1-apokusinski01@gmail.com>
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
(added after sashiko's review in v1-v3), then (P5-P8) we have some cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

The v5 is identical as v4, I send it like this because sashiko failed to
apply the patch series for some reason:
https://sashiko.dev/#/patchset/20260810193826.210683-1-apokusinski01%40gmail.com
I have no idea why it happened, the patches apply cleanly on v7.2-rc1,
sashiko's report is not helpful unfortunately.

Kind regards,
Antoni Pokusinski

---
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
 drivers/rtc/rtc-abx80x.c                      | 663 +++++++++++-------
 3 files changed, 451 insertions(+), 255 deletions(-)

-- 
2.55.0

