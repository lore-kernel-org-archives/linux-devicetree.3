Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C573F65EE
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961705; cv=none; b=t6yBEusTTh6sJutsMIBWzYv6VWuaIYOUC9Oi0toRw7Ntcfi+MMWK+T9m47Ioyswj1D4jSOeTtWWPIFZQjkB9ItpUuC8eRF3e1Hm55f7fUxRBL36WNS/+Yg2SEh3JfjvPzhutblh7apCDS+XeEq1fdzuAJ8+iKcqKAKh+FFwCw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961705; c=relaxed/simple;
	bh=/07Z0NPAnj9CzoCCLg6q4N1CEswLr8QmR5/5BsgGcW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMeiinxZ7g+pN6o5qV+o+Ys26qOe5m5GOpuf4rB/qC6M+TkL6xcBMrET2u9sTOamBPLmAiVQUz8MJdYHIOB7QQlJY02gzyUanU2kxDHrV7C0Qyj7p+JdAWmwhHnUBtcdGlh+LKYl/4MF6VixGOrg4GOo+2eTNKEpvZtn44cxf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZzGgzF+W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZzGgzF+W"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so39994055e9.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786961701; x=1787566501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFns77KTWZWOI24gl45GxSfmFCwAF7espPxpg5+yrlI=;
        b=ZzGgzF+WHx2UOROSyIyaiDAfcz54V1Kf1g3YMIhhO8L9v0jiLWMuChm86oiChOgZAy
         C3R8hrPxePSyskglAGbhp4sBjtvosAaGTH5S3NxTC1BMbUmOF8X05TcREf/b4HjQA/L7
         4h589tnK2w0Rc4I32q5LB3NYefb4nbvXRJGoKSLh06q9faWlBYxu8yO1ieJNnpetlW/c
         EpDEp8Nq56CcLKBWfgP2pFeUGA+uY0EawOiDS2M6n0na2FLQwhp3HsflPcg40KqD3F7H
         PE4gSO6ZYW/QS6RzMfABL21pG/UwWfLDwNG69IqBd7ydRnnY8W4FWFtHd87M+WHMj/5y
         0itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961701; x=1787566501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFns77KTWZWOI24gl45GxSfmFCwAF7espPxpg5+yrlI=;
        b=G/SUOVzTP9ewR9UPrpFfV7sw7Yo7Mm0KZ4+qg/8ISkhM9NbfQ+zPNkha4RkYCeqgEo
         OeA85qeM+DTC1yDYh8qH6nBIqCaI5+Gz0UPgDJIrk10yLXpneirBZbYZvlf5IkILRjJA
         F9yvBjf7o2aOf0JgwceseddrQ9g3mncMQ+6UNOfwdfOvoXRNIfPbXQtTtpF/zCdZ/IU5
         SSR7jZRYlCJnFaM0Q2B1l7oHR6gDlTuhrke1Ie9LBCdr0rp8RiUYZGCRXvmKJH6NZGyy
         fPQVlT7maa8UliyNIpMWlhugBotQbXvdD9u8V8uMFEn2RY3RFOIyzkOyPEQzz77+NOTc
         QOww==
X-Forwarded-Encrypted: i=1; AHgh+RoF8u56iVDa/P64Ps1C9kM5Y5I5dNu7F0PaH7hPbm1HhTI8cd8FFrmSuuC5qNHf/qY+vBbhXKjZ9Bh+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaEFPK8qWc88qD28dMXghCAbV/N7woi6M9fCPr8XV1Ht1Jt+hh
	zlJRqGRQHkDijZJaIkqgbefduFRJZnLCKPZRA5vq28eKm2C8VgsEW7ORG5qyyiDFL1Y=
X-Gm-Gg: AR+sD11h7dKXOPjDxVXjRMVYG/QX0q4tjP1eHzC+HsPv1a2cNltdRdPkViAk3q3TDpc
	IXKTLSdrz5zpycpjO9rR9o1/9beJfC2oVB0JoR8C7Jv6XK5+x/GslrF5DIzgqI+BYxWW9vo1bvn
	Q8C4dPfmWcgGFw8WbsCvN4BMpjITuBboHxij0mA+ivFPPXSdjb338cmfrmUVIeuCZiGB4vmXHHB
	7owUMvikslX3lpWXfShJFHm4THTwL8TUjJ7dzZiHIDa8ghv/9xYSJqyU7ekLFIAugFOXSmfIqUD
	ScFfHqIRpAlhKkG9RAyS2APc8+yknq13a8uTTGl8Od0laBTZymgVDbWz2rvTNgnyhC5lcyrrNfn
	nm1f/qieeP5DHbGO4EDKBHNzxC6Wz7Zcjehmb3JcHh9cVpev2OrIq9TSA3isJaG2o6YNFa74hcE
	7sDEXC4V/aRE8dwUhWOFLwUC9bGsH0HEs9QfuF/h0IsrMOyOY4Qvq4lyHaY9RHKJn0hKnA8jFZx
	UjCH0pQL+vQBnsJ+LIZKPL76FH8v9e10W/94OWomFl63e3emFVpQqqZQeezQLnpL7kK9MpTM2Hx
	sddZr76lsPGFybKY/uqSLO5nFNJFMg==
X-Received: by 2002:a05:600c:6c4d:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-4998799df10mr235578415e9.14.1786961700897;
        Mon, 17 Aug 2026 03:15:00 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d06167csm29542255e9.3.2026.08.17.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:15:00 -0700 (PDT)
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
Subject: [PATCH v7 0/3] Rework TPS25990 direct conversions and add TPS1689 support
Date: Mon, 17 Aug 2026 13:14:42 +0300
Message-ID: <20260817101455.3526260-1-sbogdanov@baylibre.com>
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

Link to V6 at [4]

V7
- Reject negative values (-EINVAL) in tps25990_write_word_data() for
  PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_IIN_OC_FAULT_LIMIT before offset
  arithmetic
- Fix unsigned underflow in the same paths: subtract the offset in a
  signed intermediate and clamp before scaling
- Fix tps1689 VIN_OV_FAULT_LIMIT write encoding: widen rng_idx/ov_set
  to u32 and clamp against FIELD_MAX() of their register fields
- Clamp the 8-bit WARN/FAULT limit group to 0 before the 8-bit shift
- Add PSC_CURRENT_OUT scaling with rimon in tps25990_probe()
- Minor: split the read-side VIN_OV_FAULT_LIMIT calc into rng/vov,
  fix continuation-line alignment, drop unused tmp_scaled_value

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
[4] https://lore.kernel.org/all/20260805090400.2059006-1-sbogdanov@baylibre.com/

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework driver for multi-device support
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 233 +++++++++++++-----
 3 files changed, 186 insertions(+), 70 deletions(-)

-- 
2.43.0

