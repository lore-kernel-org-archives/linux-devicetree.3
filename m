Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275A368D69
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700438; cv=none; b=A7LnUkxbyX2jEaREOMgHGnMObJ8a0hqGxx5olAo90rdAfkLg+RZ08wY3M5Cp0Lbqj00ViRPffW0CaakgRX6U51HiHsrIxw3Cw1zpmVcHX7hZ32Y+fmfF/ztYrnIyCuyDjsR+MM93t+rQdx4pbyfldAsFGOWxa7U6ppkxXMcswKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700438; c=relaxed/simple;
	bh=b9mQ07bmNf6UR+5kD6c06+iQHs9slUIKumO/aQn894c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZLV67nXDIbveiCkKcuFGBIPnupxpbsVg7Zqz12nHR559IVr+itXaJaL60cIktaKdwQQF+1sirQVKf/EHl4ZDLOwWFFroxu0ekTk3zPAc/MhZq7Kjux89sfL05GXl60Y/LTu1Sg53kLJwQQlnW23x/iHHDA1zOswMYeKnUHGrNoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kwHLHFq5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kwHLHFq5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f6de72faso3276335e9.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783700429; x=1784305229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+oK09CtVciKAJMrFWWYRF7B4ymx4hLjxRDpKjGKu7Ag=;
        b=kwHLHFq5vQFMdfKyJnDg2ilG6bX0xI0Jh+C+3QIahiBaS0pnbnhNjFLKKe4XAaApFI
         NpqdjzwOCLhwk9XwbfXMXKBRrJE60OY2/S5seG4MlWwiaZLKsL8SiNHGP7u20SCrtg7v
         vIrviBdVzvM2gabHnQ7XeyOz0lyl3Uj/ynaz6Aj1BnEp+5XPxAVENJveanwEr67oEBxD
         JK85uSRm89L1rYIHZX+JSWf+lkqK6lQ+jYezSfVFKkhvobaY3mRynXUxeqRl78nXhGec
         IAXwZbDCP0WZeybKdH5bbdxy2SjEISQZEQNMjWnkpiGL3E3T//Ch/pafCJ872d2uxxf4
         vNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700429; x=1784305229;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+oK09CtVciKAJMrFWWYRF7B4ymx4hLjxRDpKjGKu7Ag=;
        b=TSThYlxIwCtJDtAWsVDmsLP9rG/GbI4bjxTJXr26UnIaUqa1nLIoxyO7B7ncEImf8g
         xDCvTM3GfgdVy3oUGDOczLREQITsNU9NhmQnS7wR48zy8/KmIW1upXWOzdeow7t6z16w
         eBF7d1nvByUqeuuDgBrW8W4EneA5+9j5LVNftMqpYdpivyvEB0ezl5LpsLWKHNd0dpwk
         91WIMiGbAlxs+QTkE818eHKdGqT3liqvwZZxdxJBKYPp70FHpTr4utFTgVJyT3iO03Oh
         xvqyU8rZhqfVLJrR9Otq+3btgjeld05kR34GDqWEDfB+gTFsHVZyaS8F1G5eTmd2ekkv
         5Ukw==
X-Gm-Message-State: AOJu0YzVTZnWp+zyJp58AGtk3aTm2hKvz1HvO9esgIBDZoW6mZaCJb1j
	qCQU/1LGFYkXSWM7n0758e/DJcKQSkz7XkFLFXB/3anGD+f44AbGJGc4D3sNAsoAnys=
X-Gm-Gg: AfdE7cn6jUp1ZUvGEZ6DZQmlDWi/Nc4inJqYzVOoXaNvfr94V+Meivr+6qBQy0yg4NP
	fLBcZLK8W7pOgAVKYdV4FpWfIBIYZpHM4bBpS/aKzP1Eqv+T6lBHwqD0uP9kF9V1bCPJf4aovGX
	6cYZC5vA0K5erWy1IyeakH/cECzre3Z77l3qkmHCeQmGTgN8/SiLmAajVWuCub+sbnKHQMVnFdc
	n6oLa/qnc3/JDBfdSZ8rgsm3+oeFItC0BocBGhsP9cK7bBW7uZkaHv0lNAjs+Lh6z++wEUcDGWC
	V7YrnreHwQYuJjk/pET+gGXI2zm8bA4aKF6rmmiRQlf+z0g78ImGT1zq9RP9SfGtB1jBf68Ykdz
	9cDZi7nYOsEAJZbzQ18jJUntWGA0lYUkZ0Yw6cLotrbW+cpJx6v3EkQ4fFihTsk8BlWdWUyBL5B
	KKis8vESPrn+w=
X-Received: by 2002:a05:600d:8445:20b0:493:e963:e671 with SMTP id 5b1f17b1804b1-493f2b24ce5mr34094395e9.3.1783700429200;
        Fri, 10 Jul 2026 09:20:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e43:31e8:5645:d4e0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb73b161sm133508055e9.9.2026.07.10.09.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:20:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/3] regulator: Add X-Powers AXP318W PMIC support
Date: Fri, 10 Jul 2026 18:19:24 +0200
Message-Id: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIwbUWoC/zWNQQ6CMBBFr0K6tqTTAior72FcjGWAGqFkCooS7
 m7RuHzJ++8vIhA7CqJMFsH0cMH5PoLeJcK22DckXRVZaKULtQclcR4MHCRTM91x9Cwzk2e5JaM
 LqEWcDUy1m7/J8+XHYbreyI5bZzNq9p0cWyb8p3NQGgC0ApPq+HJURoLEvmJKB36/nsh4Qu5S6
 zuxrh89WQ6XtgAAAA==
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=b9mQ07bmNf6UR+5kD6c06+iQHs9slUIKumO/aQn894c=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqURu9A+Qx1upkLOgUHDXcsiATs28I8XqI+DoWF
 R0wOlgFKLeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalEbvQAKCRDm/A8cN/La
 hSiPEACW1gF0TK51QJbk5++c7n9MT9o6yTDUMjNQhDUl4pjEdZcqiEmIA9MOzEDBp5ovpC5fNjz
 7x6ZlZQidve/3ZtzSnqjtI9WXOMApDIv+Mbh2mcfkkOT3B25yxW3e0LLfZ1TSmtWvYl/ALimRcV
 XuW9gdBy76oeUkF4bAN4aI3iOOzoB8dleluFwnLW1Kca+MZSszu9vk3FWb90Dsag5Bw3nTxh6jY
 0iteCPvQuzYXiDMQv2HHjXd8O2dS+7djf0j7n/e0o4WBySIvHx1kIdGAB2bcaumzjLc3CnfCFbt
 TYdslZN20+hWMIZBRTupmApAj+e5ncFVPHnPDjroMB1pwgiH8B64RhYQLDv4H/iPLr0FVm/9rM5
 V+pKINhJ/P/jPrEe4O1qfmqu1s4zO84MHZ9nNvRD8jt2r9lzzoc/gIt8tnyytsxIUcPoNXENAQO
 EHIM9TLT10uinFgEQXTgXahnfXoxg2dw4LFI5hs9q8YkBxBOOxdb3sOuTVl4KplZWxVvzo1wqNr
 kgqJueBctJ0+S1+wdbvK1wxMngnbvgOsymFpusLspBalfEQs772m6qCpDKMGBVa/ARh+gZ1bK8z
 NICoj8KoXPq9eABxNvDeMSxFQnoE2ClLb30U7ruSoaMm5ciMw9LHKLGDfj0+zvUKOta9mb5Qlk1
 an7lB6wwCwGzKzg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patch series adds support for the X-Powers AXP318W PMIC, which is
used recently on new boards with Allwinner SoCs (the A733).

The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
interrupts, and power key components.
A datasheet can be found linked in this Wiki table:
https://linux-sunxi.org/AXP_PMICs

Patch 1 adds the compatible string to the binding document, and adds
the additional input supply properties.
Patch 2 is the MFD part, describing the regmap and all the interrupts.
So far we support the regulator and power key devices, the ADC and
other pieces will follow later.
Patch 3 adds the voltage regulator rails, this part is crucial to enable
any board using this PMIC, as we depend on those rails even for basic
devices.

There was an unclosed topic regarding the handling of LDOs output
voltage being limited to input voltage being provided by the supply.
Chen-Yu noted the min_dropout_uV would be a good fit for that but
the actual minimal dropout value was unknown. I've arbitrarily picked
1uV because it is the minimum the framework supports. Realistically a low
dropout regulator is bound to have some dropout. This choice
is very likely optimistic but does the trick for now.

If anyone has problems because the dropout is actually higher
* it is arguably an HW design error
* it is a good time to let us know what the actual dropout is :P

Changes in v2:
* Droped _NUM_VOLTAGES macros
* Use min_dropout_uV to limit LDO voltage to supplies
* Add bypass mode for EDLO4/5
* Prevent crossing 1.54V threshold for DCDC6/7/8/9
* Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.przywara@arm.com

---
Andre Przywara (3):
      dt-bindings: mfd: x-powers,axp152: Document AXP318W
      mfd: axp20x: Add support for AXP318W PMIC
      regulator: axp20x: add support for the AXP318W

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  28 +-
 drivers/mfd/axp20x-i2c.c                           |   2 +
 drivers/mfd/axp20x.c                               |  84 ++++++
 drivers/regulator/axp20x-regulator.c               | 298 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 129 +++++++++
 5 files changed, 532 insertions(+), 9 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

