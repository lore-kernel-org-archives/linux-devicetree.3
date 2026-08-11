Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9FB351C0B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416352; cv=none; b=U1/AAZoAc0VgUSB171auDre/lXTtMPQYd7oQLr7Fl3kRqiC/bzU4w6nhI/UfI79Cu4dmn4yHwOJ5sYVPjY+OVaypVexxq7iyLk8VTzyLaTChfPGkzWhFsmjK/fku0tgQ1EslpnhHRYFpgJSHi7x+WIC/UbaiR1HwqO3Ow15ANjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416352; c=relaxed/simple;
	bh=qEgnNcLKJmWlemOeo7Gu/L7XvUWNb3FhcVm44FpVdUI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qMeQP5MXZRrj/1N+mvY1Fu/0RMfejT9GBkKrl0poPjAH0tdwzq/DUy1qY/oN98u4uSF3Rl38tOytDdAD1OMCVnLRcNDbhNJyPyyo5+GkVSeKVIM+t1USd3C1yoBikTDiXKU0dZ21LoN8zb7AydPyz6n6jKMENUKDbz6SCY/PYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkiMpbSp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkiMpbSp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so37124445ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786416344; x=1787021144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M0PfwjUI9qKqRqJ2vcNYME7gxL5hCvSOx/yJCbrbL3U=;
        b=mkiMpbSpEGi6rZH89BRwsQgVplU65YMcX8TEe5s5PEpeLbeRZXfVTksKZ2Gl/bFgBa
         hnrgGrgIPNgFU1yRHNoUiR4CVXTG+1sHO7iafzqOirv7ODybVi54Z2yEBz5tXHHrCV6u
         Y05Ej65JaWD7uJ6BAyp9kIho5ABLR27r+f3kIW2Hv/iYpTGL9LB78mPs7vD3DXOyrH0h
         dQ/njyPJ19O2E8jnYXo+uIXclz/v57FTigwneuVDp6fM8TiWZTz90QutO5YE4imlav3a
         w49mmlQuO77MbZ+EsaQzElxEF2/pfJBWz7JEVsFw84S6TvmiknJn6UV6wAGfzj/Er92J
         zu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786416344; x=1787021144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M0PfwjUI9qKqRqJ2vcNYME7gxL5hCvSOx/yJCbrbL3U=;
        b=e/+WFOpYPlfvo/bEtn/m6Ki+3dKkhR/yv1YoB2DpdfFUld+GWbWz66qCxdM40ib3L6
         FH+0fJIaCAus8/ds+vd1YcpH0UnZWWDr/FY0wflhwEHNrBmkxykwIRXuCQUZEQATAlkQ
         TrwJt5xThzTTRvUe7EW4OQPRw9FTVAu/kucoq7TZFSSKr1U4fmcqo33t1hP1Gq0saSZe
         NJX0FOwIlajZ8Rmfb97jnNyYncYNhBUYUXyM1wawPx2+kBcGNgUJwn4/r52j/vW+mfEx
         R0Ti42W/RncSFZ6RdBkJT/0TvvNk5eKnjx5XkEkqnZxPNk/3YjxUsLtJ2fz8VBrnHyAh
         BK0g==
X-Forwarded-Encrypted: i=1; AHgh+RpNcKDrwiKL0zn7mKuL5ob55BjJJCsvAaHbOeUWHYOL2SkHJ2LV5FfavQdjMEO7HCZI5ju6ypnI0X9l@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhu7z5D6K1V0WGGArzpigMOfANs7aNU7Bv8ewS4gZHt5zGCocI
	ntmqFfySLuVGfyuAz64dJdE728FcWS1GDDxSqbJat2l6uFLLzXr5dJw+
X-Gm-Gg: AR+sD13/haUMSQXLfrlJe2bVdry/+qpyGvEWa26GBJJr6BpkrqBYkjSvha9BOcBVVDS
	UFSCtUiKZH5HJ46myqhLx4BAeFxDtIksyOX0T5vAWU1bQ2watsnHtDIwBjrxWQW6+OFTGD/iPKL
	P9Rhx85TlZ9sh+lKjHTyE+kFFwyjH0+SaFPWAfXxx1Ry0aLM/2wNglYkDXtPZeYZrcbEz5G5lz/
	I/nBZ5aOpbni6dWBbRSxgbxaRLGz0TPJe2IM/oMeXUVrs89uKliHmXS43yX+qmBvaDwEHU9njmK
	pqwBGkYls+Op943Gkdr1PxXq1SQJn5zZ2GJAZjHovxKmKMw7Ll5pfBhr1hzwYolRqrcgwscMCVM
	HW4KT/D4AZ+l2RmWvoU5R4ZGHBqHUhp1PsUyLnDa5LJ2wAU7odnSXxMh2K8OCdwpyfBrJHTvk8u
	0bEA4AHRRfZD/XtRAPoU4DOLL6Ma5g7wJay51+eliyFjl4T6RhVk1TUs9+0zVfAtMaF4wOFHY9Q
	eo1pqde062vFQvZF3B/TTBU4WAId57vH62ibL8=
X-Received: by 2002:a17:902:f54d:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d3178cc3bdmr2446725ad.12.1786416343941;
        Mon, 10 Aug 2026 19:45:43 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31623091dsm470185ad.77.2026.08.10.19.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:45:43 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v4 0/2] iio: adc: Add support for Texas Instruments
 ADS112C04
Date: Tue, 11 Aug 2026 10:48:36 +0800
Message-Id: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAISNemoC/23OSwqDMBCA4atI1k3JSxO76j1KFzGOOlC1JBJax
 Ls3CqUPXP4D883MJIBHCOSUzcRDxIDjkEIdMuI6O7RAsU5NBBMF00LRCamtA+fCMUVrjxE8rUC
 DKZnSRiqSNu8eGnxs6uWausMwjf65HYl8nb49s+tFThlVOocGFIhKm3PbW7wd3diT1Yviy5B83
 xDJsLZivDBOOsb/DfkxDMv3Dbn+UTZKFkaU8Gssy/IC7UCtTD4BAAA=
X-Change-ID: 20260724-ti-ads112c04-driver-be7e89047834
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5802;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=qEgnNcLKJmWlemOeo7Gu/L7XvUWNb3FhcVm44FpVdUI=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqeo2HD9Q944NI6Gzhzxe7eO1mgI0goNCgv+Ncr
 uPZ4GCTvbuJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCanqNhwAKCRClg0K3CVbE
 gU0AB/9a9NAnVZOC1ElR6tycjvYbByV9v1BLfydQ2As8jIbz/1YfMcF6ehzUQ3pU+PSa6qIoXuA
 HBohRLlUWB6MSigCDAINuR20H8AjBmGhzGyiLyBI4YENa+j1oMjc0U5nJge6kq70Huo2jLxmt3J
 ghjev0hjBUDN1T1y9lCc3Oay8C14oqrujUYPX7FgezJh5vyCYItPJMupA6J/jcLuBPoHEESSTkm
 2hgPfAg5gYiNMpBJco7sba+tq6jg/iP7/yuGf9XYlUiz3EvBnF/fZoakw/ggmJr3lWULV7iMH4z
 SMLf90XJbq1wrhoxuv84bGbRQyikoA7boTRiE58erVedrdFN
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

This patch series introduces support for the Texas Instruments ADS112C04
Analog-to-Digital Converters.

The ADS112C04 (16-bit) is precision, low-power, delta-sigma ADCs with
an I2C interface. They feature a flexible input multiplexer supporting
single-ended and differential measurements, a programmable gain amplifier,
and an internal voltage reference.

Note: While this chip shares similarities with the ADS112C14 (currently 
being upstreamed by David Lechner), the register maps and feature sets 
are sufficiently different to warrant a separate driver. However, the
DT bindings and channel parsing logic have been aligned with the
ADS112C14 conventions.

This initial submission provides a minimal feature set (single-shot 
conversions and basic DRDY interrupt) covering current use cases.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v4:
- dt-bindings: iio: adc: ti,ads112c04:
  - Fixed excitation-current-nanoamp to use single-entry list syntax
    (items: - enum: [...]) instead of combining maxItems: 1 with a
    mapping-style items, which failed dt_binding_check.
  - Widened excitation-channels to maximum: 5 to account for IDAC1/
    IDAC2 also being routable to REFP0/REFN0, and documented the
    mapping, per David Lechner.
  - Reduced excitation-current-nanoamp to a single entry, since the
    two IDAC outputs share one current setting, per David Lechner.
  - Changed burn-out-current-nanoamp to use `const: 10000`, per David
    Lechner.
  - Renamed reference-sources' internal enum value to "internal"
    (dropped voltage suffix, since there is only one internal
    reference), per David Lechner.

- iio: adc: ti-ads112c04:
  - Fixed word-read byte ordering by switching to
    i2c_smbus_read_word_swapped(), addressing a big-endian data
    corruption issue flagged by Sashiko AI review.
  - Masked the DRDY interrupt in the hardirq handler
    (disable_irq_nosync()) and re-enabled it once the conversion data
    is read, to avoid an interrupt storm on level-triggered DRDY
    configurations, without hardcoding the trigger type.
  - Reworked reference-sources handling in parse_channels(): it is now
    validated against the actually-selected refp-supply instead of
    being unconditionally rejected, per David Lechner.
  - Simplified regulator handling in probe() using
    devm_regulator_get_enable_read_voltage(), dropping the now-unused
    vref_reg field, per David Lechner.
  - Corrected the commit message to no longer claim refn-supply
    support, since it remains explicitly unsupported in probe().
- Added a MAINTAINERS entry for the new binding and driver.
- Link to v3: https://lore.kernel.org/r/20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com

Changes in v3:
- dt-bindings: iio: adc: ti,ads112c04:
  - Resolved dt_binding_check errors by removing redundant $ref for
    standard unit suffixes and fixing YAML array syntax.
  - Added full hardware capability descriptions (excitation-channels,
    excitation-current-nanoamp, burn-out-current-nanoamp,
    reference-sources) as suggested by David Lechner.
  - Restricted the reg maximum to 11 and updated the regex to
    ^channel@[0-9a-b]$ to accurately reflect the 12 possible MUX
    combinations.

- iio: adc: ti-ads112c04:
  - Transitioned all I2C read/write wrappers to use SMBus APIs
    (i2c_smbus_read_byte_data, i2c_smbus_read_word_data, etc.) to
    gracefully handle I2C errors, NACKs, and Repeated Starts, addressing
    feedback from Joshua Crofts and Jonathan Cameron.
  - Added forward compatibility checks in probe() and parse_channels()
    using dev_err_probe() to return -EOPNOTSUPP for unimplemented DT
    properties.
  - Reverted devm_request_irq() flags to 0 to let the driver inherit the
    trigger type strictly from the DT, per Jonathan Cameron's advice.
  - Reduced the data wait timeout to 100ms, reflecting the chip's slowest
    data rate of 20 SPS.
  - Fixed #include alphabetical sorting, grouped <linux/iio/*> headers,
    and added missing headers.
  - Fixed variable declaration ordering (reverse xmas tree) and updated
    variable naming to vref_mV (SI unit exception).
  - Optimized GPIO reset logic using GPIOD_OUT_HIGH.
- Link to v2: https://lore.kernel.org/r/20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com

Changes in v2:
- Replaced `vref-supply` with `refp-supply` and `refn-supply` to accurately reflect hardware.
- Refactored the driver to dynamically parse channel configurations and routing from DT child nodes.
- Modernized the driver using kernel macros.
- Handled endianness elegantly.
- Added hardware reset fallback logic.
- Inherited IRQ trigger type from device tree instead of hardcoding.
- Fixed a bug where the MUX software cache could desync from hardware if the I2C write failed.
- Added strict return value checking for all I2C writes during probe.
- Updated the `i2c_device_id` array to use C99 named initializers.
- Link to v1: https://lore.kernel.org/r/20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04
      iio: adc: ti-ads112c04: Add support for TI ADS112C04

 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 148 +++++++
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ti-ads112c04.c                     | 425 +++++++++++++++++++++
 5 files changed, 591 insertions(+)
---
base-commit: 350d1fb9204b13c5f95e511e98b8bcb47574d425
change-id: 20260724-ti-ads112c04-driver-be7e89047834

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

