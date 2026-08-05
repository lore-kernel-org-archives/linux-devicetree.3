Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43F43F0765
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920653; cv=none; b=SnDJrnCZd1fsHwb1y1bPWqWeE4zbL/ToMgmY2PkDcantN8I33sRXaL/08KBbIi6WCo47kCbk3gXzNgC/FqcH+NbCYhlCv4JqlI3RSroimt0xNN6A9wQ6kR9omuu1mS/yVpcvHEhprBMgNQ7zNctbrLR0VnHY1IekwujGjkNdqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920653; c=relaxed/simple;
	bh=BrPSZgHrp26DXRe+wCiZ1hWOkSPTszZwjRSrkVF+IJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/5Tj7Kpgi2v5ZQD0j+Tqhsi7AH5T+m8TDrYyNJ6JrKUHA9wUFamPYC68qLw2nFIEMU3/MbWyrY5pq5C7seJ6ROSqLSd8HEzTOVzLtYw1H5lKOhD3tsRuyq1M15ep0Zl1bfI2jt9GAnsA7S2GFxFKv6jZRhr3p2Q7CeUP0C9IYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SZgpHfR1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SZgpHfR1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10234095e9.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920646; x=1786525446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDJsuYD5gYv2hkvet8UFFexByKmS2paW12lnOAiNWD4=;
        b=SZgpHfR123SoFVtHAhzgPJXJY+ipPwWD5hmMDDv+bFAj8Dhel1uiCZll5rdBtMq73+
         Y1ugouI5y8rGVbLP+QjGMHf/jbYgnR+WT4TR4BEETvHJUgsTJ+9pevI2VtRbb/2CEwAi
         sAGNnyXAJXyHsO8CrDI7fj+bP/oszU1KOj/MnRsUOX7aTYC8x2X/MNhy6SB/Y3WOIrY1
         7swhoaKt7yscz+vAYKBJ/CjXVhMoERMfQ57/43L0Ef2VkBw0H5RMW0t0EtDL8zV2PFtP
         HBEeaij5Oig87C9Jq0BdtHX7O9PLsYAn8LKY0DGWaF/qytdssZAvgoLfq3ihwUCLSgJx
         Kx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920646; x=1786525446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDJsuYD5gYv2hkvet8UFFexByKmS2paW12lnOAiNWD4=;
        b=RPvhqP6I/UkuvGCegc0Z/ICAo++vcP5QIc7I6u/uqh/RKNA5X5t9IROz8POfrYlRHN
         DuSqHj9MRtgM8oveTnyqjvw5xdLieUtrsW5GKO5O2lR5hOWfaCNpBZsDAN5Chss3gywa
         n0eTYJEFjr7UqEl4Dq1OHiZ3tU+A/FZaJtXnzws2lLNsYflpd2q+QOXrjiLrIQWyGHlV
         huG+QcMyJfo0x8/7PBt2P2V/rBhMnFIxhBbqEDHtRBVXTJtkC1SS/qPUyzWKip4qYDYS
         1mv9fZRl/6J+eAATd9jdnV5tnS50cgDvEzdOhiKeHf1PfUUFKGruaYJtho+2ebg2CIad
         70sQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEYNTWUGrCytiXre9SQfyrAfDZKx2FvlJ1qSTiEkpGPFhVaTbpcDuNemS7WnFuvHkz54/YWMUcyynW@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbzoighi0Ak8H9PqujHlDHu2lsQW84pfobddIqRxXCTY/Uy3f
	evQyJFntjYKEbeovbanODL5HfZmAkre5t8pRd3shGRpx7GPiV//QtYBFWkpoV+31dIM=
X-Gm-Gg: AR+sD12GeLDYtxwy/LhlJ+tX4RKfriDk1ecHPL2kBcEMhNxhRtuLMJUqob+Jn6fMwD3
	6qSdDEGe+804K8Xk5O2U67UyIMkQKdLvMgtZ/tc3nZ9QGu0kAyVYmU1PkXszkX92pFTfpRfN3pd
	+1UiLZCWKydAIsXUNCUrf4YGmDD7qe1dqOEAi1bURoSIY7d2iYfydNMl3ViuoIGYPmJkcYIYNJ4
	SdC5UPfOy+ZN0H9fMqbNq/+RFIXnvk8OOlIhd2Cm3kX7NTdoyxf+Zfpiroa8Oa321M3Aq30GfWe
	ezCW9uW1Fjs8xUkIaJ6EUD3pknPlajgKPE/OZRXE1N/Joj8XqCV3QiG+N4wN9OUusQzrvtZF+tA
	ZsJoCgMAQ6ZsyUJ15u7eEcqyfsoqSQ3O4zENd0BVCovEFumF3kXsL48SKl7W7Pt8UuYsOeZPCGL
	PL0GSV5L9ZcyL/c3qGu9DvccK+jiGRirxCz/GquCTXnUAWotgO96aDKrd7RxdF5YwY8zRuAyOvP
	GNYaqhFEkQatihyr2XH9qxP4pdp+jTDv+UkkdrnLbvCgkluxuCAjU1m3Tj8qv2vLqxt0K3/T5CU
	wEpcDAyNAg8QJ/CAJOiKUDvFalAPyj8bDI5jnxKP
X-Received: by 2002:a05:600c:6298:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-4994e7cca25mr49897635e9.9.1785920646111;
        Wed, 05 Aug 2026 02:04:06 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:05 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Rework TPS25990 direct conversions and add TPS1689 support
Date: Wed,  5 Aug 2026 12:03:54 +0300
Message-ID: <20260805090400.2059006-1-sbogdanov@baylibre.com>
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

Link to V5 at [3]

v6:
- Remove special-case conditioning for IIN_OCF so both TPS25990 and
  TPS1689 use the same logic.
- Add scaling for TPS1689 VIN_OV_FAULT according to the datasheet
  VIN_OV_FLT table, keep the existing behavior for TPS25990.
- Fix incorrect PMBus Direct format conversion coefficients (m, b, R)
  for TPS1689 PSC_VOLTAGE_IN in struct pmbus_driver_info.
- Add missing PMBUS_HAVE_IOUT flag in pmbus_driver_info .func for TPS1689
- Restore the const qualifier on struct pmbus_driver_info, which was
  removed unintentionally.
- Update i2c_device_id to follow I2C subsystem coding style by using the
  .name and .driver_data initializers.

Link to V4 at [2]

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
[3] https://lore.kernel.org/all/20260728015857.193890-1-sbogdanov@baylibre.com/

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework driver for multi-device support
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 227 +++++++++++++-----
 3 files changed, 181 insertions(+), 69 deletions(-)

-- 
2.43.0

