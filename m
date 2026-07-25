Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0502EEE6C
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784991542; cv=none; b=MfJZgOatIefGZaQoTiuCM3sZyyQqgPXzj7Ph9C9qMcsYO1nl6bjRGZHzlWv9imJuemNplzASewN/B/qH5VT2nZwjARPFpDYPrbQlkPcI41bJYhahKnnEDseqJsJh/j49Yr6KnM0fwkGbSX7SCEHIGHlBU+FeKGTxYhE11axjpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784991542; c=relaxed/simple;
	bh=eDz3pgySkJ3FwHLM86QgjHFIaSpcds9QjU+yqkELM4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmb/bp3uYCLx/pG2fMRYhW16osbGjbdnsZuZZMJN9UxEvkjcCV9qJkuilrpXRAqSgCvIppSmEVpJgZg/pwHjwb2UUV1PxT9fvTArqqW5+FGgKsRYjX5NJ76LDi5Oi6bVxPUfX20YwEeXY0NNiu3USniVYnKh9GgobjYE5Dgs/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhLPJRSw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhLPJRSw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so8002045e9.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784991540; x=1785596340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLYzxrPJVuTJC5CqSna3XzjrW2NluFGsdX52TDIqBEg=;
        b=dhLPJRSw01eAPgu1PnVaxh+GW7GyqNPDzRs+MqZzyxHvDdXcT+bCdN8V/1vvYefTze
         CAWFC6OZ5hSj6s1AlOYnSkCSbjll6wiG8RPmyzZhb462gko//avwwE2hV16hkYwzKYnn
         PWtaoW8U/C3CekD2UgIQx2TlcX8LrktsF0y7zYCc4vd3XfZ2+77LD2GfFFfk84752dNU
         Sg30NI5DrBZlOW6Ppz1/h3k6ptBH2CaI61qBE5DTwyj/yj6Hq6TR6f7LESJ+prPu+zRV
         24SjiPQrkWgcnZyI5iJdmiK3qBEWP8bHS3gpNxl892O0A3y8Vw9jySYrGtB/qUnmiQWU
         D7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784991540; x=1785596340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLYzxrPJVuTJC5CqSna3XzjrW2NluFGsdX52TDIqBEg=;
        b=NLlmuJY3ACNjNYoFeNyc2o5UhCScSuENcQPQ7iVakZyHjrMjyKGwf6KESheDlT9HF7
         23TaHkaasgLmw4LNm/wT5w7ZeVxrmMvFXKQo8BwWYk+M9C5itaN4IcbkEphY4bJHCx7M
         hv9F1YXX+FLNo7A1oFDzWPfFIiyu25RSwnx6fUT0x9guKzNm4EiJKIAnNQMWc/T05C7l
         QIFx87K8pDhh9KDbgeT6gTgbCxhRye1IcdvGNvnB6YB7mEPyTaaHENj4mc01rzU4fP2+
         dP9VihWuSmhaaTR5bKZYLMSkxc/bPQ/t4K8YE2Xex1JOGqFI/jmWG58oDEynTMVOYAE0
         sWDw==
X-Forwarded-Encrypted: i=1; AHgh+RqPiRLeurSnx+DqQlCUKNT1DugrZ3mD3S9R6RkguTIIaMS+YwRIbeeoWJbqBhugvQhou7HSfCqk9NNY@vger.kernel.org
X-Gm-Message-State: AOJu0YzyeqRsiD5NKDAzMRPZ731kFAu+kz/8C47CHNhe8zuaVHxv3gyi
	rAk1yilZTD/RUd9jexXM8CaatkpaWwSfvAI0ss50aaK/TOXIHL5gM7UItmTEPQ==
X-Gm-Gg: AR+sD13yMZHGpGT7MxZSp6aZS8r10JrVFKWbHpASFfnr0bSr55dP/53aeXHgUSRWW3k
	gF8ToY3PV3MBzED0PTE6qup2RFSCo+qShOzOirKSKiBiGdbxE/z20xivUvRCV0OevqcYti9B6Nz
	8ATnMG9pOzD26hBUw7uLDRubGItxbfgnlhz1iJvXuGS9nSmHqehU0im8TKXrHfA5LiZ8aFs6QDu
	UhqUlWY6x7MMkWD+k63BU77xZ0DzVqN3xYfDyEYVwKKqqPIeAm+Y/qFAST7iZBs7TCZPntCl0uj
	Wb61tF3z7LhJAVilsmcCFqQvY3hjb/IIub3m+hoyZ/3p0485Ql9w9fsbDm0vY+u740V0PGGlTHt
	9A1/cZUPxQRC378+WdVGMu8Oeesxf7jGxipGPbKkKEDMfyGbqcQk2a1Oaqnykn+FTJfgdrYT+P0
	t4RQ==
X-Received: by 2002:a05:600c:4513:b0:495:5cda:52ec with SMTP id 5b1f17b1804b1-496b56d92e0mr26321205e9.16.1784991539493;
        Sat, 25 Jul 2026 07:58:59 -0700 (PDT)
Received: from antoniarch ([78.212.96.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm79704435e9.11.2026.07.25.07.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:58:59 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marex@denx.de,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 0/8] rtc: abx80x: add support for abx81x
Date: Sat, 25 Jul 2026 16:57:10 +0200
Message-ID: <20260725145718.14733-1-apokusinski01@gmail.com>
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
SPI versions of the ABX80X RTCs. The first patches (P2-P3) contain bug fixes 
(added after sashiko's review in v1), then (P4-P7) we have some cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

Kind regards,
Antoni Pokusinski

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

Antoni Pokusinski (8):
  dt-bindings: rtc: abx80x: document ABX81X RTCs
  rtc: abx80x: move part autodetection before RV1805 configuration
  rtc: abx80x: properly handle shared IRQs
  rtc: abx80x: add irq to struct abx80x_priv
  rtc: abx80x: use regmap instead of I2C specific API
  rtc: abx80x: replace read-modify-write pattern with regmap helpers
  rtc: abx80x: create abx80x_i2c_probe()
  rtc: abx80x: add support for ABX81X

 .../bindings/rtc/abracon,abx80x.yaml          |  18 +-
 drivers/rtc/Kconfig                           |  25 +-
 drivers/rtc/rtc-abx80x.c                      | 650 +++++++++++-------
 3 files changed, 421 insertions(+), 272 deletions(-)

-- 
2.55.0

