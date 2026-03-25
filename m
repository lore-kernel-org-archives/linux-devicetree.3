Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14414352C29
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420400; cv=none; b=KZfDbM9oIA3bRjXdpJhLoV+N7uvKPFP0IIz7FPQwFaqIUIhKBIctiWcLC8kwHE8HCQPp5y0YmZIXzunwehDblnm0c4ZujFtyUP+xXcuh+1OizlEkixfR0OkLvb3RPZmO2uA2Cw/H9Plpp7GHRv0xGr4wF0yYaY64n9AepAWiJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420400; c=relaxed/simple;
	bh=uHir9CYrWEBi781+9y6gAhB+KAavpeSqcW3nrlXIWqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vDd5/TmYtlpQ08muCKLN1pnldidZ5EvvfqwExSxVTMCrz3sjbSdFIiFNYoBX/+A7dGZhwLJt+Oh/70BWPwOU57AhnBaAs6EWSQ3L1qs97ACMBeyo0EIRQnZeMF63H0wS/YY2FcEUfnnwUdjNCzMBowXxuloAAn7/mOycw/kwcbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3591cc98871so2652555a91.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420398; x=1775025198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3T22FtHj7PiVjh8CPSoc3ZFVw7lP3ieK+jLM3FL9ck=;
        b=jHGv2BrMOkGoDX5i5gFnIemBA7HNhD2/ao1JKCnqjPGkblIkF8vYWVFgvwrpZKpthM
         xwW2+6CppuZum3z5cbBGYfZ3VEKj7HumaiZ0oDrEDb5ytjyJfWOeI64yPEjXJs+57Y59
         EgiSq1Pwmy4EM4eikiCab9PRjYMKrvoTp0gGPtrjgXPY6D1P6z1wcgmwwWmyYGxldRiv
         0Qn81rtag/STPiSLjFswFGsA+C/YyuuAUrIWBk0vidgdvXbzgJJ5PLt6dxJuM6cVhr3s
         jdlxGT1ZJHsSrL42Bwi0V2wG6labktHk6v3R8H+o/hVchx9Y+UXqso1/UnG6l07tW7/4
         +M3w==
X-Forwarded-Encrypted: i=1; AJvYcCWHOlVH4gD0RJP/zteahO6W8DdZfAJg5dKecF+ddfEc3MqOEbYQc3TxyIuCPEU/jDhsehGk2x760Hg6@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwEElFfvXaE0JwqSrKtg9IZIiOFWpyocWIzJ3X/MzI89Pw1li
	dJILDf2xvOSeJqx1qy31WxHHnICgLgpbHF4Y+o2g1mFt9t7NVna5FX4u
X-Gm-Gg: ATEYQzztPMfP76q3EwU8ow0WzVACSw9i0ch/GpEwV5fXFBI/kVKYpOx5CNfv7bKvT7z
	HBJjZ9IKG3YJ4g+0o7k1GyUIMIqn+Aye83m9N+OCFigwsLgg0CHBHktWu++4hiUs1/QjRJ8cwih
	GBncvmaBGAIuZPUI8JtNbpDfrk+6NsQ0/EXoYPy5/qYpvjy8i81SMCnnCQ8u2ICDgAZ8LfVqO63
	vV2lmFw7+pv0fe3jIgClJqDJI83wWAqUuBIgzeGbmyv/CNrYHBmcX3Xyo0yf5Y/97FAwarH6+hG
	A+CvFzJp8QK81/KrNDHsHN0LmaeMVKLjwWyeDHo91M22OBpnjySNN2kqtPySRzkqn9Mow3k61XB
	/kZ/pdDdWNdKHXyPmkb7d1R8gBLfKCA7UZhiQERcPBUoJmfs+klr0mgeb4ybFflbLoa6552hcMF
	RluMkQ/totKtSFUCrQEFQq0tRNpq4syNE7bb27MoMAyFrYG+FFpt6gbqMiCt2L0uJpuIyq1mSlD
	fjfSOzQomhIs0ec0w==
X-Received: by 2002:a17:90b:3c08:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35c0dd6b7bfmr2049677a91.17.1774420398092;
        Tue, 24 Mar 2026 23:33:18 -0700 (PDT)
Received: from archlinux ([103.135.252.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0e954ba9sm526854a91.5.2026.03.24.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 23:33:17 -0700 (PDT)
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
Subject: [PATCH v7 0/2] iio: proximity: add driver for ST VL53L1X ToF sensor
Date: Wed, 25 Mar 2026 12:32:21 +0600
Message-ID: <20260325063254.18062-1-email@sirat.me>
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
vdd-supply is now required. The VL53L0X required a physical
regulator, but it did not specify the requirement in the binding.
It should have always been there. The VL53L1X also requires it.
Hence I added the requirement.

---
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

Link to v6: https://lore.kernel.org/linux-iio/20260319190738.151614-1-email@sirat.me
Link to v5: https://lore.kernel.org/linux-iio/20260313113737.151881-1-email@sirat.me
Link to v4: https://lore.kernel.org/linux-iio/20260312183721.40482-1-email@sirat.me
Link to v3: https://lore.kernel.org/linux-iio/20260311224044.21480-1-email@sirat.me
Link to v2: https://lore.kernel.org/linux-iio/20260308113728.40860-1-email@sirat.me
Link to v1: https://lore.kernel.org/linux-iio/20260303090253.42076-1-email@sirat.me

Siratul Islam (2):
  dt-bindings: iio: proximity: add ST VL53L1X ToF sensor
  iio: proximity: add driver for ST VL53L1X ToF sensor

 .../bindings/iio/proximity/st,vl53l0x.yaml    |  13 +-
 MAINTAINERS                                   |   7 +
 drivers/iio/proximity/Kconfig                 |  15 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/vl53l1x-i2c.c           | 795 ++++++++++++++++++
 5 files changed, 828 insertions(+), 3 deletions(-)
 create mode 100644 drivers/iio/proximity/vl53l1x-i2c.c

--
2.53.0

