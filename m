Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043CC41442F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061393; cv=none; b=mGSuy6QHwVl0ARbbbyelTZVG9pZENeKtgE2GfRf6WbYSHHzphpPha9klLLzgd6SicyQuJCUypQwJPVpetbgOIQKdeIaDsBX0WLjYZM+OrnLtN4MAGYqp6/0OaI/G+DvCK3UeyCCzaliWoYufiqaEjWYrJxB0oouTHEjJEbKSv5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061393; c=relaxed/simple;
	bh=cWH2oApMwLGszAVLYLTshVOSXvVg6YwcJsJ/Fg4Q7cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSFUvWyB6VebYbmnH2ZxHlK/h0uBBHhxVs9pLZpE0cgiEa8BM7bvCAPeYv32zKU8ls9RZvhPFek8lccvduFLAheREFsn1ATU5Jw5ZF/yTXv0njjgB91DMPZv/3zCEaJsjZ047Mvgv3Txeg4QWrOe9fCwYcaR3CPBF+etXC7x7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCHV7NrY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCHV7NrY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c262f1186f0so679706566b.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061390; x=1792666190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Av8/3RB6a5AVpF/WrR/TLgMG1QD5EKBDa39W6PNYmOs=;
        b=RCHV7NrYc+hMynqLZPT8eVIagQ5n0Y8e/XfW4A5F3+byvrI/H2ngjEKxQT/UUXnnUK
         i3KKYPa9WCO80ElQR1aShxtGMesJaxQ3rPSZIom4GVzShBEQKB56JEV3hrZ9koN5i/YU
         O7Hj8vqQQTaLPvTHEAbcMzqpNM8e36Q1ZoL7BrQNrTILGxiDDhnsyda0FhJQ6POT5mpL
         cUJdln0fB4fEymjNUb1rTbQrWM6ZZyMqDwxPf+h1Ieoqld2W8NasLAp3eja7CcoKlntU
         we2b/DQ+AOZfgp8YduTTeeYxVc3q+ilaYRL/auwQLD259ra6LV8ffz++elRW7JY7bAya
         A71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061390; x=1792666190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Av8/3RB6a5AVpF/WrR/TLgMG1QD5EKBDa39W6PNYmOs=;
        b=aZRvT1WrSdXWMLxkWSPG2DeEx3mcdXWPiKK19ZA4HqjHmUqyO13YwztiE2EAG3eNzG
         3tGkJwNsk+KGTlUhyBnGm8xfgkQVxBCOmjHQQErCY7ix1N9IlTPeY8bwBN6TnHHuK0CE
         DUnseAh0xq/d9HJ6xNRxxFq+GMV+KkDgg3hcxWIx48rGZvG3e/wBkvcrYv3gbNV/YxS2
         N/grOYbDXBHCzUMU1DGeKY7eF1ZhQ8KXx/Q1xlruW9FmR+gzsf5axB6mD5ZkKCfIQmDc
         yR+SGdp8U9ZLGyGGk/pZui3yossW4TdLztCKWf65mXOccWa50RAmwGV/S4rq6AGQrdWZ
         pe7g==
X-Forwarded-Encrypted: i=1; AKwUvBzIKeGAAoGGhOHtUvrOhVsBxSVeg63htSjl4XXc0KcguAdO+ndRos5xUICpP/eFgrHB9/a4tLaNndG3@vger.kernel.org
X-Gm-Message-State: AFq9FYKhpQ+ZM6OFsfMRdK6/poNpYR2JnJyX1+h5a5e5DnhKMEhym8eq
	X+fsBcPmrF6oN6xJr7n+J3RsgWxbXihEUgWsLOpTg48Rm9RW04XOgbNh
X-Gm-Gg: AYBFou31f7kSI5teCKEsgsx+e3IhfaZUNYtja4YW2IUSINx2PeH6zeJhAkaRq2EVLx3
	hwKWOOzAsTXanMhiLvRCufDY032JOF64Zhc7Zbv5RvajkW62vBDcED32txTY4v9rXKtqcXW0HP5
	qDkgLv4AVefmYzYfEo7SojgTJXDBsJ9e4ld+hXuVSPexsHegxigEI8/yZHEmZGiAqifGcsanI2f
	oFgROsX+hFPVzWYtyt8u99ZEYTXuLvF8LVlmdiUWX4hDFiA/NwjrCzJImkNgE3XGQelhq7rcj/h
	O81XAYIti7nujm6Q523k+17S/swO3MMtYpzQ+ST8H4aXXJzLKrAkzXZvH0VwdUyYrQ8sewkwFM/
	hWg6mi6jcklBfAs6fhCCTSbt7pDOE7QMz6FtsbkkHVmgxnFMA7M+muFXqwr9AE3iGNdi0IlijpI
	azSJww9r40tbprMUcIDUbNR9RQG9FIG+hMErJk4+3YFo1YQ7m5rHo94OC/k7PrpA6+9sldpmcAA
	oelcq0gn9haOf1jueMGMd2VRdKZ0mrOtLHnpLUkHteygdmmXtHRuihS25eF1v0CzwX2fUjkJ/k0
	MnvgxIpOvRhO4gm7vmN7c56C/sGArdrLzNsbXA==
X-Received: by 2002:a17:906:f58f:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c31aa04b413mr1921502466b.33.1792061389965;
        Thu, 15 Oct 2026 03:49:49 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm107890066b.33.2026.10.15.03.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:49 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v3 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Thu, 15 Oct 2026 13:49:40 +0300
Message-ID: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is a register compatible DPS310 with two more
pressure calibration coefficients (c31, c40) and a different TMP_CFG
layout.

1-2: Vendor prefix and the zilltek,zts8032 compatible.
3: Per-chip data in the I2C and ACPI match data, no functional change.
4: OF match table.
5: ZTS8032 chip data: the coefficient count, the TMP_CFG startup value,
   and a Horner step each for c40 and c31.

Based on iio/testing, on top of a22dc7ebb21a ("iio: pressure: dps310:
fix overflow in pressure compensation"). That fix replaces v2's patch 1,
and patch 5 extends its Horner evaluation.

There is no public ZTS8032 datasheet.

Testing: ZTS8032 on an arm64 (MT7987) board, the series and a22dc7ebb21a
backported to 6.12. in_pressure_input matches the datasheet formula
evaluated from the raw and coefficient registers to within 1 Pa at every
oversampling rate from 1 to 128, and TMP_CFG reads 0x00 after probe.
Every patch builds without warnings with W=1 on x86_64 and i386,
dt_binding_check passes. I have no DPS310, so patches 3-4 are untested
on one.

An LLM coding assistant (Claude Code) was used for this series: it
ported the ZTS8032 support from the vendor driver, wrote the code and
changelogs and the hardware test scripts, under my direction. I
reviewed and tested the result.

Changes in v3:
- Drop v2 1/6, superseded by a22dc7ebb21a in iio/testing; rebase onto
  it and add c40 and c31 as Horner steps. This also covers the Sashiko
  overflow report on v2 1/6.
- C99 initializers for the ACPI ID (Andy, Uwe)
- Add DPS310_MAX_COEF_LEN in patch 3 and bump it in patch 5 (Andy)
- Parse c31/c40 based on a chip flag, not the coefficient count (Andy)
- List the supported sensors one per line in Kconfig (Andy)
- Link to v2: https://lore.kernel.org/r/20261013112124.1878296-1-paulius.zaleckas@gmail.com

Changes in v2:
- Split the driver patch into per-chip data, OF match table and
  ZTS8032 support (Andy)
- Drop the linux/mod_devicetable.h include (Andy, Uwe)
- Return -ENODATA when there is no match data (Andy)
- Add Conor's Acked-by to the bindings
- Link to v1: https://lore.kernel.org/r/20261012114550.1680054-1-paulius.zaleckas@ui.com

Paulius Zaleckas (5):
  dt-bindings: vendor-prefixes: Add ZillTek Technology
  dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
  iio: pressure: dps310: add per-chip data
  iio: pressure: dps310: add an OF match table
  iio: pressure: dps310: add Zilltek ZTS8032 support

 .../iio/pressure/infineon,dps310.yaml         |  4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/iio/pressure/Kconfig                  |  6 +-
 drivers/iio/pressure/dps310.c                 | 73 ++++++++++++++++---
 4 files changed, 72 insertions(+), 13 deletions(-)


base-commit: a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
-- 
2.55.0

