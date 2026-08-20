Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFBE3AEF46
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212132; cv=none; b=Hov976Mu/VHoK/gPH0s8aiT40FWVn8VswdMcQrN3f3VUSpFCx44ejS3VBPhi0EsP5wvvo37yfCbJxjNwKdMljHhuitrfpR5ddgQ1g/Ha4nqG7Dka/DCV7reCAGgZmwGP1BujCH96vbuV5u1ajevWJ/tX7MkiT+lGQtdZYDMsD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212132; c=relaxed/simple;
	bh=h9pKTfnczsD4cZjKAR2QX1Zc8XxKnPvKXhQlAuJMJlU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fKYMoYVwnX4UIDP8/LyYlwJAiHmSM3ya3TRtkkRRsbk5BuwEcX5/Re/kAThy9UX2j6VwlHqwJojU3XIXhNj/HF1JAcE2BlNEJ8WnvOwuWR0mQfIuE3EMXFx694+yDgCGZPo5jqklEaDffSBnIFTsm5WD3Ifk8J8ZVspY0OgV1PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnSRf8ec; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnSRf8ec"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1924077a91.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787212129; x=1787816929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EFmjS2rE3xQzhpMGgomP6wcP30mLCcjV9QqHuEZv2zk=;
        b=ZnSRf8ecqwCw9ioEWw2L93gf4oz5gbn67R0vKAB4CG8iwP2sdcxIrTTJz9kIXsDgSB
         617FZzfvTb79ZhS2q0vUm4tOcmFAflLihzrit5XRpFu2Lw1rVCUGKA7BIR4I/uwkHBuk
         IwutTmIJ6ApnktGbi2VRd7MTDm//0Eh9+2UWOC8weyg65yev+BlvKzItxrhwi+j5Gz0Y
         hnNo8olInMdlh+1Gr+Y3mee4MGt4/5uUmFuPWZEk+/D+pSephSj+TWCkEUu0zWpnu9r/
         0itYRtJCkX/5X2vm3A6WXzsl36SQ28UrjGGe6cZTBkL9MLP4uG+Nauc78MjlNIRxwAKB
         K9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212129; x=1787816929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EFmjS2rE3xQzhpMGgomP6wcP30mLCcjV9QqHuEZv2zk=;
        b=d9B+4Pk7k+P1sCVW8a9kLRzIe+qv1GwJt8+V3jugSQIoBIE3uJw6V9YRE7Oc9KD+6G
         siD5ARkP/OMlvCdr7EPI/t5AdHnA2lnHp4inQAHjGkpkb8S145nQ3TiDnevRJi5TXFSO
         KVwjF1C7l7LhdGDZHWUEjBEYpg3AjG5VpupSft0Oig8ItvuuBDLzF/kfq9cl96FWe/Zb
         f60SaBjYMP8lWdSuB0FlSzTKbfJTRrl2HvOp6MAqHBGFTlX1hOza54NVXBmtqrUKKS+A
         Fl6ohgxrtMsXzC1xcE+HaIAhErhgravJdNwNLOyMkkyIsU4h9a5iM+81TX5x6cOXClq5
         kiiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rre6JTWAQcO/GNKo9wJUMpfjVPJQjt/pZt3S3ApspNOko10jxhKgls+0SfZxMdzedNhx9hXhl/TL5NA@vger.kernel.org
X-Gm-Message-State: AFuF++lPRRgVqZmLvFjdSkQQW6DuyJYSLHdYss2qMNilbAzZWpXnzgoH
	nSxRGDZP1C9mLGGmZmWzDxgoXMOY12ZRvMk2Jxdp6Tar7EkUc/lkQvvQ
X-Gm-Gg: AR+sD10Ow6bb0oX56LMuWp1p6WKTIP/APRhEhcslxFowAhrBgvQF8JQwg5H91i7Rz1Y
	34FDzdFMVzhk+uuzfeeD0tELIQeHNRyHsiWIAcyJ7O75Uun148B/uoe5Tl0KBQ4MQm2ORuwWNPK
	0tLKiliTzvfGcSXacFHDjNv0gETElv6vuurCeQvnjQ5ZIK0txI0pVO157KccggsgTTqG6uAIuht
	BqKlBHvEFS+OykqkPeBsfps40cNJ4Ns9foaw5tlJEiw15WQPVbL9DcffE51BkCwmTVKVxc1JtY3
	oQfofRHWFPPZ81Yhf/sUNr3CWOW1wS3FBOiG9JUgjUwsv6LLVIjrkNqdUk2r/F7+JHilCruTqqE
	oI7JYGxxSaaM1QrA0lFuazjH6CpONl47lUOZ8ySVYGp+7uBiKmyKxjHQ/OIQVNQi/RasOnBGFZF
	Uszq9uz4WdmZIBVxEyJq8JGEx8C0wogrF6y3c2vr/wdFjGQIOCd0DH2EmcKRVVbUyEbqaMxe1aa
	N+IJZwnX4jp31SxmBFdxt25s3En
X-Received: by 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr19813957a91.4.1787212128780;
        Thu, 20 Aug 2026 00:48:48 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm5600419a91.4.2026.08.20.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:48:47 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v6 0/2] iio: adc: Add support for Texas Instruments
 ADS112C04
Date: Thu, 20 Aug 2026 15:51:50 +0800
Message-Id: <20260820-ti-ads112c04-driver-v6-0-0e8f0aacce9b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABayhmoC/3XQ3WoCMRAF4FeRXDclP7ObxCvfo3iRTSY6UF1JJ
 FRk371ZoXTR9fIMzDeHubOCmbCw7ebOMlYqNJ5b6D82LBz9+YCcYstMCdULo4BfiftYpFRBAI+
 ZKmY+oEHrBBirgbXNS8ZEPw/1a9/ykcp1zLfHkSrn6Z9nV70queBgOkwIqAZjd4eTp+/PMJ7Y7
 FW1MLRcN1QzvB+E7G3QQchnQ/8bVnTrhp57uAS6t8rhqwELQ77pAXMPNAJ8kO2BL0a3NPS60TX
 DuJiSQwUuxKUxTdMvlekstMYBAAA=
X-Change-ID: 20260724-ti-ads112c04-driver-be7e89047834
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9470;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=h9pKTfnczsD4cZjKAR2QX1Zc8XxKnPvKXhQlAuJMJlU=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqhrIZc5NnwDxYQKGDmZlszgu9/9DwSwSA8pdzj
 GG8isMgHiKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaoayGQAKCRClg0K3CVbE
 gVyjB/0bWAFR2TlWp8gRNm8217Lb92OYQvw6R2yDGb6EmkfMijGEKCwvBCQGqbtjpjKQS5o/BOK
 ggG5CMpAPgbCornFagap0MEpcaz71MHjMeDWnIjeUS1lvrVxm5JoM/DUVLHBBpa7DvgGjIOzryt
 KL+Rwjyo8tN7s5WUXvk2oKLmeEJp/Z42y5BiDCQZu4xAQfq43YpNg59euQyiknWmIOn3/oxMQMN
 1OSGedEQMrs0NSA+J2NzFjuCF2bECvZuKsdAvyHiqIJyI9sF0Oe2wrwa8jSpXaolk6tvQAbqKOg
 r+pNBGZXg4apRGjac986UG/4jMm7+LMs5fZHUSmKcWCbssiZ
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
Changes in v6:
- dt-bindings: iio: adc: ti,ads112c04:
  - Dropped the redundant 'items' wrapper from
    excitation-current-nanoamp and burn-out-current-nanoamp.
  - Moved reference-sources' default to the property level.
  - Kept David's Reviewed-by and Conor's Acked-by: the changes are schema
    syntax only, with no change to the accepted values or semantics.
    Happy to drop the tags if either would prefer to re-review.

- iio: adc: ti-ads112c04:
  - Split the read_poll_timeout() arguments logically and dropped the
    redundant outer parentheses.
  - Added ADS112C04_RESOLUTION_BITS and used it for both the
    sign_extend32() bit index and the scale exponent.
  - Added the missing <linux/array_size.h> include.
  - Used local variables for the single-channel/diff-channels property
    names so the error messages stay in sync.
  - Added a comment for the post-reset delay.
- Link to v5: https://lore.kernel.org/r/20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com

Changes in v5:
- Addressed several suggestions from v1-v4 that I had missed in earlier
  revisions. Apologies for the churn this caused; I went back through
  all four threads as David asked.

- dt-bindings: iio: adc: ti,ads112c04:
  - No changes. Picked up David's Reviewed-by and Conor's Acked-by.

- iio: adc: ti-ads112c04:
  - Made the reference voltage per-channel, following the ADS112C14
    driver: reference-sources is parsed with
    fwnode_property_match_property_string() and stored per channel, and
    the CONFIG1 VREF field is now updated together with the MUX before
    each conversion. avdd is read with
    devm_regulator_get_enable_read_voltage() when a channel uses it.
  - Organised the register field macros indented under their register,
    and shortened CONFIG to CONF in the field names.
  - Spelled out all CONFIG0/CONFIG1 fields explicitly with FIELD_PREP()
    when initialising, rather than relying on implicit zeros.
  - Moved the internal reference macro to the top of the file with the
    other defines and renamed it to ADS112C04_INT_REF_mV.
  - Dropped disable_irq_nosync(); the handler only calls complete(),
    which is safe in a normal IRQ handler, so a threaded IRQ isn't
    needed. The bare `0` flags argument is now packed with the
    other arguments.
  - Fixed word-read byte ordering by using
    i2c_smbus_read_word_swapped().
  - Dropped the has_refp state member; it is passed as a function
    argument instead.
  - Added a REVISIT comment on spec->type for when
    ti,refp-refn-resistor-ohms is implemented.
  - Reduced the power-on reset delay from 50ms to 500us, per the
    datasheet.
  - Replaced the diff-channels if-else chain with a 4x4 lookup table
    indexed by [AINP][AINN].
  - Used wait_for_completion_timeout() directly in the if condition,
    swapped err/ret in ads112c04_wait_for_data(), made the channel
    index unsigned int with the assignment split out, stopped reusing
    pair[0] for single-channel, and used ARRAY_SIZE(pair).
  - Added ADS112C04_MAX_CHANNELS and used it in the bounds check.
  - Split reference-sources parsing into a helper to keep the call
    within the line length limit.
  - Updated the commit message to describe per-channel reference
    selection; refn-supply remains unsupported.
  - Switched the hardware reset to the reset controller framework
    (devm_reset_control_get_optional_exclusive()), which works with the
    existing reset-gpios property via the reset-gpio driver. The binding
    is unchanged.
- Link to v4: https://lore.kernel.org/r/20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com

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

 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 146 ++++++
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ti-ads112c04.c                     | 527 +++++++++++++++++++++
 5 files changed, 691 insertions(+)
---
base-commit: 350d1fb9204b13c5f95e511e98b8bcb47574d425
change-id: 20260724-ti-ads112c04-driver-be7e89047834

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

