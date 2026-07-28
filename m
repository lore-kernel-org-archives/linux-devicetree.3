Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F652C326D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203946; cv=none; b=QghizTYxVnMg4nv3q5g5iwmS5eSs5dbV88qJ4YfMSBkogeH/+3C8kRLuOn9nz+wwOI6r9cY3d18p6gY1B39iD2jxn5ckOkJAV8IkjjKK0hvKxNwilXLhEjC0N8QyreWkO9EHHSLTqhqbuC0aHxPLFbvy38u+R3LjR6vaoDqMLUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203946; c=relaxed/simple;
	bh=S1eToT9Emvo9T8yZiXhifldUnql1fMHQdpabftaPcS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBxwjuF3Xc/TEPusg5G3MVyHq7XFZ/E5XAKHql8ExdsqkCx4MdaJQGk+t2sH5i9HpL7pjrb+UgmF30BGGSNmvpp842Vc2IUBCQZvXY/9nhCtFfuJpBypPnjm9vxbAQele1uVjGFpi429y8BvHmcm3xcy2aG+y41TtXRKRSVyI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SC5YlTb2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SC5YlTb2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49557167508so31732205e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203942; x=1785808742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lghiWACiInEXZwMGRDi/paNv9u2DW3lyEoUnCFOiJiY=;
        b=SC5YlTb2CjyAWyQLmN4HrDHtp5Iza/w0FWs6d4emHh3YC8tMMaWr7/1qH548ELoEqz
         6yVO8sj61UaK4gE7x+VKTb5HWuYrhvmrCSwB1ZRzHWoXtLLmuZ9zmO2U73uM6naZCdyw
         VFH9UiArmlv15IByYaWGyp6nFX17o+sD2xW2UR5thC0LpbGR7iMNAJogvvKyqMlFCJ5J
         9+th+lEXrMcri1D2BteKx8pIsXeWLc9dUxjcUa5ccFE9CiFezaoKHhvPPW1kKGidB+Gr
         Nnhdjob+m1jFFpFn2bzg9Fh+JgetNPdQWkeV97lYQnXqPcbx5LsrBKLaXq6cSFlXxjwO
         ThZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203942; x=1785808742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lghiWACiInEXZwMGRDi/paNv9u2DW3lyEoUnCFOiJiY=;
        b=qcYuNms8Q5DyqpCoARoutdABAzMEhcj8hs0mcSXZiETLBRhPLRIzitgMfla5zRxFDw
         F4OpptMf7DMftlTkCCyVBup3uRbtykGFv+zSfUiYXKptqiOestQA4oEWN9/xw+t8JStA
         PwCLycesmkMI191WIGXvgWX4sE+5wN8F2m5BT5rSR/i485IGGNShQllP1syW5Q1q2eas
         6bQ+XnSCaAeupqR3LMaacH9feZkrscZl4TaB3oINGmK30Lcu0vOToV+MpCwT14albK2D
         YU7AhATqh0DIGec4K99HpGsiSe5ec8R/aenr8HllEgjh2orSXXcmJCPbXG0fFXC2n+p9
         jaTA==
X-Forwarded-Encrypted: i=1; AHgh+RqO7qPKP1lq2OOgE+SodovQTtDTYh54A4ecQO+1M/GWBHZM2Vg50WY49wCFFq+qwC0E9DyUXaYkDivd@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxvN+Y5Z9BhS7QTU3IAwn8wjHQRf3Y1HBtJLJkV+gPCNzA2T6
	U4wgBPB9yNbYuR1J3hZzzJZSEBTLgMGzi8L8/6kTlEwRPtT6qFvAtPslOp/zoDc3uqk=
X-Gm-Gg: AR+sD10zKXwpx+L62oTqD6bAxeKA/G6PqmN8uv0wk0Veii1izie87hSKuR9pQ967Bkw
	oSzsv6K6n72Mpj5rwS4NK1JPCgkajxHAxHjfR1kUdluzmbMbWmHbOZqwmkAbmucvrxA7qHq1pYQ
	nj0eKq+YTMmu/PpoWhnaVj/LpGVXMK0//jRQLBI0xXNXmgMCOw0kPRv37KdzOoivDoiZVk0bFV2
	WkrKdQa4SdOQPw+ZFEHa6M49twDjq+DPIRh4VeA5LiQImT212Pxf7cCGTOsMqikD9NQJEYD4tk3
	oWoNMZHHze/xgMFSXSEI4iIeoldOSyo3HVuyujCWVVIcpIIEgT598PCp0MFtO/dr630X+bCDRuM
	PUoPf83W6GISQhGAV5kcoUNRU8p3ltFGabX+RT+AH15mB5+adNmeEUQTjBB84ICyoeQp2dfgZCN
	p6FzeICvukh0vR7n5qr7rIQrc7WNkR0ue2rN4k7FMbn/B0DEw6Hsht70YWwimLpkyAkZUjjdwK0
	DXstWOPWOCoLe7EqEmrsBNOvfi1k8XiCHp1UDvVYJwj1B8=
X-Received: by 2002:a05:600c:46cc:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-496c642c89fmr3041035e9.14.1785203941722;
        Mon, 27 Jul 2026 18:59:01 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:01 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v5 0/3] Rework TPS25990 direct conversions and add TPS1689 support
Date: Tue, 28 Jul 2026 04:58:45 +0300
Message-ID: <20260728015857.193890-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the TPS25990 PMBus driver and adds TPS1689 support.
Both devices share most internal functionality, differing mainly in
supported voltage and current operating ranges.

Link to v4 at [2]

v5:
- Simplify implementation and remove calculations from the driver, as
  they are not needed and were implemented incorrectly. Thanks Guenter
  for taking the time to explain.
- Drop pmbus API changes, as they are not actually needed.
- Add conditioning to separate TPS1689 and TPS25990 by chip_id in
  tps25990_read_word_data() and tps25990_write_word_data() for
  PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_IIN_OC_FAULT_LIMIT. The TPS1689
  value is not 4-bit, so it does not need adjusting. Keep the current
  adjustment logic only for TPS25990.

Link to V4 at [2]

v5:
- Simplify implementaion and remove calculatinos from driver as not needed
  and being implemented in wrong manner. Thanks Gunter for explaination.
- Drop pmbus api changes, as they are not actually needed.
- Add conditioning to separate TPS1689 and TPS25990 by chip_id in
  tps25990_read_word_data and tps25990_write_word_data.
  TPS1689 value is on 4bit so it does not need adjusting. Keep only
  current implementaion for TPS25990

Link to V3 at [1]

v4:
- Fix non-devicetree support as reported by Guenter Roeck
- Rework direct conversion handling to use exported PMBus core helpers
  instead of driver-local implementations
- Update dt-bindings commit message and ti,tps25990.yaml
- Clarify commit messages to better reflect the final implementation
- Add and export direct conversion helpers from pmbus_core
- Eliminate duplicated conversion code in the driver

V3:
- Fix error detected from kernel test bot regarding division

Tests:
- Test builds for x86_64, arm64, i386
- Retest driver on arm64
- Validate driver direct conversion functions manualy


V2:
- Fix error detected from kernel test bot
- Add Acked-by to dt-bindings commit
- Drop "support" from dt-bindings commit subject

[1] https://lore.kernel.org/all/20260217081203.1792025-1-sbogdanov@baylibre.com/
[2] https://lore.kernel.org/all/20260522082349.2749970-1-sbogdanov@baylibre.com/

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework driver for multi-device support
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 219 ++++++++++++------
 3 files changed, 166 insertions(+), 76 deletions(-)

-- 
2.43.0

