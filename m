Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9C449B17
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164941; cv=none; b=EWodKxx4jY6lKdBFbTMp2ZjK8AEmUmjc464bPR6FxJyvI6JzebngUfJ/Y1lb8K6Bp0/iNiP1uBL7GTqrD72+G21LqQ6vLdwVmkhGZFI5IsTRBZntwJ31McnkSS6eRKjK+DXQNg7UaLmNzvjPgTUkdZzlzUQE1do/BpnBg54+y7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164941; c=relaxed/simple;
	bh=obZwl1YfpAcsg19PeU/FGyCCEMFs7N3QvJbg18vd9RM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ojf7vFSXtcQdS5RdX8aIlP7xOIUL3AhVgqw2MV7oRj1PQc/+hFBT/nMhN/d/sBcy1OyyZQlA948vCCLiX26PE3HEzyyFgSlRBRUxKC1gVoK361mvdhME8WInnL+NlqtBvSVPvA4owvm934VVrndFiQmKHw5zQTMgxuvMjtEpVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAWr3Fli; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAWr3Fli"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so9680517a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164938; x=1792769738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=byHreUpdXpkgVnzr1n+T2qNDhsXwcMUXXAuC2SDWEuE=;
        b=GAWr3FlimvsbIAvBEDHpGCAdW7ugg4S13R7XIlbM7O+FB2W+7as+JC2xHU5tgyVBu/
         OM0VHJn+JuGyb5493xHRVGdwdVaM/6kL5gm7pwQ1RbyIzNDo7baIgmHQ7tpgFooGIkM1
         wC28xHmZwe9cNeVjtmY/qCDPBUr4ZiWp6j2+hsGKxsZvwZ4Y6fDgYyprH/zet1TXAv8e
         UTKlf2/rGYvTRKjjBtUWJKTVuTTtA5KH3VHsdGnJGxaOtTYAr4ZGIz3suggQ7i7lZdYi
         N/0942QMKxsYfmdA6UmyJBdWj3PqB7G+bOIYx1G7GxNHILg06itxYW57BRGrk7EWW8kw
         LOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164938; x=1792769738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byHreUpdXpkgVnzr1n+T2qNDhsXwcMUXXAuC2SDWEuE=;
        b=P2JgzWqe/EL2EhGFgM8d0OnrWJjg7h9O/QZ/5kjbN8vObZyoAzcf6DBVtASIA6zen2
         9g6dHnuYP5nS8GKjEvepjrZ0PTNmzqBWmQrq3CZJSyKstgIMqAUfnEF6su01p8da/Lm2
         z62AQ4RNIPvdTxZENv2r1fJ97uwaAju5FH+40Bu3dKwcP0Bj7AzzHNVy5K9aszU0L3JK
         KZH6CxTFJgPqWwIeRN2QlOi9JVa5X7iqrMu2MPlJBCFcY1z/ICswTmSDW8QM17m6P4Gr
         baojBLVmcDDPm34A2X4YVfo4P0y1oPSu25oLKwi0Unls+tvaS5SWf4H3z0ePZSbGEMVO
         RnCg==
X-Forwarded-Encrypted: i=1; AKwUvBwTLYSKFafeKW6zNrq+CgSkK2xwn4EJP1EzflMEwhPcwlJn9TSopkAMbFEtOSN6RaSYbEot0B1/u3yh@vger.kernel.org
X-Gm-Message-State: AFq9FYLsFA4+Gjb7e6uNQiJxwN+UOM9IVgyAMIsJP5AhV5HjFUOyonYs
	C8DYAi1ypCrKtAh7zuXnPG6OMI+Fmeggt/ckv9oljSPH9saUNyr20wMh
X-Gm-Gg: AYBFou3FvrM7ShHeq2YhTHsRo5IzUffRfrsKudpNyEmft+9bV8B9vLjlIfPbpfuQK9M
	3zozc9lrLuiCEkiTPSCsz421ixAB2jyd8EfAVLiNJVvFhN7XrKWYCAUggJEeEW6elXL7dS5cXrE
	z/oIsllS0cqBAjZMI4vdyXAPQuRk/ekpS530NZ+RIXr7C72M5NaHzwMQQhWisf64GzFcNmrUPDJ
	0zyM6lpGjpJkrXk6f24pRDSNT5LwqWTxqsIb5y3HHViFYv5jqNmrlSjxuWOyMzvONfS/SjYhaRi
	HxEVf8NFdBE6A3s6O53KolvbA1ZmrDA8658BNlygDmpI6/M7Ple7JAn6+ueDvkaT6QPybzIkDdB
	1voTk4U5OCyAhbzhTG+fNeG9e9uORrqjB4EmWeptGnXHsp9QdgCQSZAjWDTQpR01UA6/MY7LZ1n
	meF1d8aZkllMecoU20uTcMc8y3Mzq05eyLQjnVeaUtGO8P/M0We7D42D40FBe/dev6sNXWYCt1n
	AiUEpL6qoTGVY1a0OXswiDGMNgW9lIHir47ket3XhvQswCqutpbDr3JWQ/9NWsonJTZzwk/NZKY
	WxqVWA789qeopHZFxQA2zVM/lAw=
X-Received: by 2002:a05:6402:1e8c:b0:6aa:7ff:4ebf with SMTP id 4fb4d7f45d1cf-6b1e40c6dc4mr10129099a12.15.1792164938017;
        Fri, 16 Oct 2026 08:35:38 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:37 -0700 (PDT)
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
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v4 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Fri, 16 Oct 2026 18:35:28 +0300
Message-ID: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
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
fix overflow in pressure compensation").

There is no public ZTS8032 datasheet.

Testing: ZTS8032 on an arm64 (MT7987) board, the series and a22dc7ebb21a
backported to 6.12. in_pressure_input matches the datasheet formula
evaluated from the raw and coefficient registers to within 1 Pa at every
oversampling rate from 1 to 128, and TMP_CFG reads 0x00 after probe.
Every patch builds without warnings with W=1 on x86_64 and i386,
dt_binding_check passes. I have no DPS310, so patches 3-4 are untested
on one. v4 only renames a macro; dps310.o code and data are identical
to v3.

An LLM coding assistant (Claude Code) was used for this series: it
ported the ZTS8032 support from the vendor driver, wrote the code and
changelogs and the hardware test scripts, under my direction. I
reviewed and tested the result.

Changes in v4:
- Rename DPS310_MAX_COEF_LEN to MAX_COEF_LEN, separated from the
  per-chip lengths by a blank line (Andy)
- Add Andy's and Joshua's Reviewed-by tags
- Link to v3: https://lore.kernel.org/r/20261015104945.2687162-1-paulius.zaleckas@gmail.com

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
 drivers/iio/pressure/dps310.c                 | 74 ++++++++++++++++---
 4 files changed, 73 insertions(+), 13 deletions(-)


base-commit: a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
-- 
2.55.0

