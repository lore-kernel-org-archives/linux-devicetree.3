Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622393537C9
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470020; cv=none; b=FuC7KLCFdV1tWX+1C6lbpBLmL5F6oAAgCDyLcgGA6Supmqe62CrsH1B6UYff6HoFWdRSlWcVWsUkVaUk4k2ITcslCmcZS+eiLAN2xZ2Z8UjUgr/I9abZzPy1bkSy8dQC5i+58BZS/9qvgjKbx4+oq3M0Z3Fm2V/2+tEd3MGpink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470020; c=relaxed/simple;
	bh=z1JYn4rE7AYrb6NmLNiWw4rIbQDERLX2qvGVjYk6STU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b09yt/KlXgbYu5pGaRvBYEvBsl5WMKELdF7UFr6+fGzEK9PAQs2wGzeDd8jeGYaFcV8LWjhhWZBRK27a9dKVnubfTkoFrz+fCMRtMp2L4YKitBY2r4J8hyzHSaIPxD1TeoufuW39bcGQSAnpGOP8wJk6P8aVzT6OsOk9v+E+K5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c742b9b7727so61112a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774470019; x=1775074819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJex+szdF7lw8I7ZZGPN8FOxko5AnlvZUYCgZFC2b5w=;
        b=hf+MYLqtqhKJAADkDRPFRk4bhpgoRA8ZPa58HenpfQdZ7larDJ7F791kNBSZaTibCw
         dvmNmi0pE72JWWW7nKrAdfl/Gx3GFGWqWIQj6vEQr4nVI9WVxDapf0wLt8bj6qTP9c7U
         cotMkYtHjnbnNIWabJrzrn2EAxx7EMTI53qmwR5iC1j6+Ja5fJqVR+x0zIZXkSq/Axm5
         JQi3J9WW/6yhvOrm1UzutXGa4Dbxnr68SykvSlbkkFKpYisGT1yYEyWab94F7/O0Tbo4
         +EwxLg7fREb4dEncO1njj9K5swy2+Gd07W2OfkqDCFSU5rg6dSugBqK59MPyi7lFGSHu
         Jzsg==
X-Forwarded-Encrypted: i=1; AJvYcCW1BO8eME4OaiuuEMaxxBjwcixVAF0gp2XrMa1K47Hmz9TnVNZ0UMciM/s6oAe7ieLoiIlTyUHi4P42@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuqvfivrJV6UZbC2/XdZojkvMUmzbT/pe66z7NO4a2puIFu1Y
	zZZIbf5b96EUxuD7/n2lIT7HfigAagdyKJm+V1dHC0RpGMJMycGLKecl
X-Gm-Gg: ATEYQzy0DpbQg62NVEqr93oEw1gAZzL2LhPNKXb0gma/Jreo73GHaeGIXbustdqfxGP
	igiXiXThEp5lBfOrkkMs4mv/Tw9aoiGRyH066d1L/JGFyyiZekZ3SekEDmDVpvq/6L7XgbLlMFP
	/Ta9RAar23jB4RhEYkJzIqQY3Xpy6xq9y9gt/lRF4Wpc+EwEblp22lPqlFXAjXdtTSj6WTYHdI1
	oSPpMskWpTRkznHPpR0hwRZBzLS+oUDeZ4COVlG2h7ywYZnw243CFBCd3c2V/wdb/eg3rPr4vi+
	DmTCl7N5gsw4DTo0WVowVaiYEIeRUBoVGRex7rRhZ1Btj+XlorxLfucvSgebjUobpjYzrA3tFYg
	KFcZ5vLd7zv64hHhz6wf1tfLmOckclVidahJGOudi0DspS18eAaX7Ai3wcBRahBwp/1tvXmKLzZ
	aJRr4Sj1+VHol4A5LWHMocR0/ZobqEGDn+dpUOO4ijjfiDtPnFw2OxRD28uFliYayRdE6ciHHHm
	NPHtBc5ZRoNqdYEoODFnPfh
X-Received: by 2002:a05:6a20:a11c:b0:398:a7b6:6b45 with SMTP id adf61e73a8af0-39c4a7a3180mr5308872637.0.1774470018511;
        Wed, 25 Mar 2026 13:20:18 -0700 (PDT)
Received: from archlinux.www.tp-link.com ([103.135.252.24])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7673933816sm280511a12.21.2026.03.25.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:20:18 -0700 (PDT)
From: Siratul Islam <email@sirat.me>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Siratul Islam <email@sirat.me>
Subject: [PATCH v8 0/2] iio: proximity: add driver for ST VL53L1X ToF sensor
Date: Thu, 26 Mar 2026 02:19:40 +0600
Message-ID: <20260325202005.29822-1-email@sirat.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the STMicroelectronics VL53L1X
Time-of-Flight ranging sensor.

The VL53L1X is a ToF laser-ranging sensor with I2C interface,
capable of measuring distances up to 4 meters. The driver
supports both interrupt-driven and polled operation.

Why a separate driver is needed (instead of extending vl53l0x-i2c.c):
The VL53L1X is fundamentally different from the VL53L0X despite the
similar naming. Extending the existing driver would require rewriting
the majority of it.

Key differences include:
- A different register map (16-bit addresses vs. 8-bit addresses).
- Requires a 91-byte firmware configuration blob to be loaded at boot.
- Requires a VHV calibration cycle.
- Has distance mode and timing budget configurations.
- Uses the regmap API rather than raw i2c_smbus calls.

I also reviewed other drivers in drivers/iio/proximity/ and can
confirm this IP block does not appear to be shared by any other
existing driver.

Tested on Raspberry Pi 5 with a VL53L1X breakout board.

Note on vdd-supply:
vdd-supply is required for st,vl53l1x. It is not globally required
for backwards compatibility with existing st,vl53l0x devicetrees
that omit it.

---
Changes in v8:
- Use devm_regulator_get_enable() and devm_reset_control_get_optional_exclusive_deasserted().
- Drop i2c_check_functionality().
- Remove power_on/power_off helpers.
- Require vdd-supply only for st,vl53l1x.


Changes in v7:
- Add VL53L1X_REG_ prefix for register defines.
- Use iio_push_to_buffers_with_ts().
- Use continuous ranging and drop postenable/predisable.
- Add comments for XSHUT reset, default config values.
- Drop vdd-supply description in binding and comment in driver.
- Add ABI rationale for vdd-supply to commit message (per Krzysztof, Jonathan).


Changes in v6:
- Make vdd-supply required. Add descriptions to vdd-supply and reset-gpios (per Jonathan).
- Check reset_control_deassert() return value (per Andy).
- Use volatile table for result registers and caching for the rest. Also mark write-only registers.
- Drop tag from Krzysztof Kozlowski for vdd-supply requirement change.

Changes in v5:
- Patch 1: No changes. Collected Reviewed-by tag from Krzysztof Kozlowski.
- Switch XSHUT pin handling from the GPIO consumer API to the Reset controller API.
- Drop <linux/gpio/consumer.h> and include <linux/reset.h>.


Changes in v4:
- Move i2c_check_functionality() to the top of probe before allocations.
- Use struct u32_fract for oscillator correction math.
- Explicitly set .cache_type = REGCACHE_NONE.
- Document intentional predisable drain
- Use dev_err_probe() for firmware boot timeout and remove duplicate IRQ request error message.
- Use sizeof() in regmap bulk read/writes instead of hardcoded lengths.
- Add missing headers (<linux/math.h>, <linux/time.h>, <asm/byteorder.h>).
- Various formatting cleanups per Andy's review.


Changes in v3:
- Merge DT binding into existing st,vl53l0x.yaml (per Krzysztof).
- Use "reset-gpios" in the binding but xshut_gpio in the driver since that's the actual pin name.
- Replace manual polling loops in chip_init and read_proximity with regmap_read_poll_timeout().
- Remove irq_get_trigger_type() and pass IRQF_NO_THREAD directly (per Andy).
- Drop struct i2c_client from private data and store irq as int instead. Derive struct device from regmap where needed.
- Add dev_err_probe() to first devm_request_irq() error path.
- Replace linux/device.h with linux/dev_printk.h, add linux/array_size.h, linux/err.h, linux/types.h (per Andy).
- Use USEC_PER_MSEC for poll timeouts.
- Remove unnecessary casts.
- Divide long config blob to 8 values per line.
- Rename goto label to notify_and_clear_irq and drop unused dev_dbg.
- Add datasheet section reference for boot delay comment.
- vdd-supply no longer required in shared binding to avoid breaking existing st,vl53l0x devicetrees.


Changes in v2:
- Skip software reset in chip_init when xshut GPIO is available, since the device was already hardware-reset during power-on.
- Rename "reset" GPIO to "xshut" to match the datasheet pin name and updated DT binding accordingly.
- Make vdd-supply required in DT binding.
- Use reg_sequence arrays and regmap_multi_reg_write() for distance mode configuration.
- Switch to a hardirq handler with iio_trigger_poll() and IRQF_NO_THREAD instead of a threaded handler.
- Drop IRQF_TRIGGER_FALLING fallback. Leave trigger type to firmware/DT.
- Use iio_validate_own_trigger() instead of a custom validate_trigger, drop trig pointer from driver data.
- Switch usleep_range() to fsleep() throughout and add comments for sleep values.
- Don't fail probe on unknown model ID, just log with dev_info().
- Split stop_ranging cleanup into its own devm action, separate from power_off.
- Add missing includes: device.h, bitfield.h, completion.h, mod_devicetable.h.
- Use FIELD_GET() for range status checks.
- Move configure_irq() closer to probe(), use dev_err_probe() for its error paths.
- Fix buffer ops symmetry: postdisable -> predisable.
- Drop reg_format_endian from regmap config.
- Various alignment and formatting fixes.

Link to v7: https://lore.kernel.org/linux-iio/20260325063254.18062-1-email@sirat.me
Link to v6: https://lore.kernel.org/linux-iio/20260319190738.151614-1-email@sirat.me
Link to v5: https://lore.kernel.org/linux-iio/20260313113737.151881-1-email@sirat.me
Link to v4: https://lore.kernel.org/linux-iio/20260312183721.40482-1-email@sirat.me
Link to v3: https://lore.kernel.org/linux-iio/20260311224044.21480-1-email@sirat.me
Link to v2: https://lore.kernel.org/linux-iio/20260308113728.40860-1-email@sirat.me
Link to v1: https://lore.kernel.org/linux-iio/20260303090253.42076-1-email@sirat.me

Siratul Islam (2):
  dt-bindings: iio: proximity: add ST VL53L1X ToF sensor
  iio: proximity: add driver for ST VL53L1X ToF sensor

 .../bindings/iio/proximity/st,vl53l0x.yaml    |  24 +-
 MAINTAINERS                                   |   7 +
 drivers/iio/proximity/Kconfig                 |  15 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/vl53l1x-i2c.c           | 756 ++++++++++++++++++
 5 files changed, 800 insertions(+), 3 deletions(-)
 create mode 100644 drivers/iio/proximity/vl53l1x-i2c.c

--
2.53.0

