Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89173806D5
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296485; cv=none; b=Lcy8kt1g3MtD/TY1dw971pHnt8Um7qhkAT614fOqvOkAUv15N3taulxjInscl8dLHKeJhbsndtjj0UkBiySuXT+Z2cyTZLEWu7jmM4C+isN2nTBi7+2TbzsVaHsCQmWEH+D9JyKGPP9BX+2OzUwRJMcTYCEZB6HCGM+Ey2vXbrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296485; c=relaxed/simple;
	bh=I2SS1VKaZwcexgFjKvIrpcNx34oWzfb8bBh+aCkByME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2+uJUGpKjH3ZcoWzYwTnqPGPWtUq+BbWiLZhCkb1k75sAuRLv1g0OH0zH0idU4hur/oiXiEFnGuTVhYSWVbcRxL0ikG5BzcofWQFqNRM++rW8mtaPSwfBgQpWXDgnMuz3LGveyVp74mIvNgyMZddHhye7UBWHujeKwGA/PFKdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swwfeQ6T; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swwfeQ6T"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso767724e87.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789296482; x=1789901282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1SHbQp1AuRp6XMEOgRuT/MsuA52KJwIUZr5MmjAZl4=;
        b=swwfeQ6TuWLgqcF2m54tghCYrbG4tAkU99m1/vrzmfgCwm5kxkf8JgW8qT6Eiwfqy0
         bXceU1dJcuIz9aqaM7J4wn9CbEIjXdljZ6KasBkzK8VR4Z5v2kQNjhVaX2PofcpSgqK9
         61trF4NHOzRJCWp3I7WHYcwke6XhVMTmRcZ+P8Rdk0o9N0KdO4V0ZRbfArNwUFrBxroF
         Eo+IIZBQax2Loo4SKpRJ8SU3hJ2/BIpqkqoykonrfOCEdK+w2HYB3jn0DJyubRHuyEGX
         41s2GKia8t5FDJu7VZnHxB0BNnqAjHOXpzgxuwJ/9Cv2xZl0D/kJQe0BxoOLI5KICBeV
         LQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789296482; x=1789901282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1SHbQp1AuRp6XMEOgRuT/MsuA52KJwIUZr5MmjAZl4=;
        b=lf6/vfqSpAY168Je3GX5iqvvbJd+gThlsAwDSLo33tl6gpDUAWbfUX07EaLec5ohh1
         H8dC6EySLIjDJHWjlUxIe7cyxSNlECbNeO4rVpZWmP1SsmKvNA9MRCV6T/X8k590Xtu6
         A4eSeeLcAJcryvQVub9P1UwrP9A7UOQKQXSJj3q51MF1+Ny1JUD6wDAe45EK4HfLeRAj
         4E2EK5Hi23CvigqaKVB4Ug7wBIsypnU7Og/1+PAlzbaC2TN7u1BArV16+0CSKjiGmUHB
         qytmTrW8rk/SDveq2U0u6Uv1YdsqxoVnwZrIBhILIlbv/HKknOZUlSYWGYpUB35Wg47/
         h1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOlxeBxBqJLT3to2aXCDqBBs5qU2bVGr8nsyAReBTLFbqSnkX9JaF1VL+pc47iQBKhStseFBQth6yl@vger.kernel.org
X-Gm-Message-State: AFuF++mUT1dP6WxBBW7S9n2sI42KqcbsdUctwa20bj5sQExAVQrMlBsH
	kEdMNx/MbTFFUHhWe6OtTlHCcx+hVB1ArfIsVYmtkGMGE/MYKo1q7Ne1
X-Gm-Gg: AYBFou3qq2eVGMLVmH6DnR9CnPU2blOVDzuKj9BdgepXlbwzPkjd1RTz6HLTeRh/24K
	e8ixID26AaP7zTAjSsl72knB8PsZYKqAXpGyt5/Bbxum6gc+DtFZeYJ4bU+IP9PqPPd7anq+ciX
	TXZCdoQOMhDa5MLmM/ZevAybbiKO92xy8JhGDrqvERFfxg3jduyvqKAAG1wvew/oodMak9ORfOg
	fYe6inZoNPt/OFy9qwRjbUWuHE+w8szmZ1QK9kvK8meWLEbdSgLB2T5dgf0MLhlRjW8SidhRoXV
	hASxaJHfR7xGRAC2yaYtnnSzehOHtP50YCv/Rs3sNiQCpaQD2CEYnMKNBBcprb0xWuJ7KI55gTj
	uxsZMPGOFDVqwQwV+Hglf+VtUB3ITYNpVI3qhLkezQrOPbqIO/gzbm8yiZpdPoK7FsDAZREVgbO
	OP/VhHghqPJ/5jHGbNXUypl/iBfHLJLpIGuTS2vGteDkXT81EULKXQJUEEqNUmWbRj2O6t/9sr2
	Djt7f5nmcq3oh5erNb9pmyb0Fi0M6A1mOnxVa4UitwNmNJmmq6qgXVXeFZuEZOOi1yPcKbEOnp5
	sCqJfu6XolDs4EJDg9k=
X-Received: by 2002:a05:6512:32c8:b0:5b4:5f6b:d43e with SMTP id 2adb3069b0e04-5b8a8ebe59bmr1156620e87.14.1789296481137;
        Sun, 13 Sep 2026 03:48:01 -0700 (PDT)
Received: from Shofiq.home (87-92-212-6.rev.dnainternet.fi. [87.92.212.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04600a2sm1689154e87.36.2026.09.13.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:48:00 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@intel.com,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v11 0/2] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Sun, 13 Sep 2026 13:46:54 +0300
Message-ID: <20260913104658.230422-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IIO support for the Analog Devices MAX86150 combined ECG and PPG
biosensor: a devicetree binding and a driver that registers a kfifo
buffer directly off the device's hardware FIFO (matching max30102.c
in this directory), draining it from a threaded IRQ handler.

Tested against i2c-stub with the expected PART_ID and FIFO bytes
pre-seeded, covering probe (both a matching and a mismatched part
ID), the chip_init() register programming, raw-channel decode of a
simulated FIFO burst, and buffer enable/disable. Not yet tested
against real MAX86150 hardware.

A kernel test robot build error reported against an intermediate,
unsent tree state (incompatible .validate_trigger pointer type on
iio_trigger_validate_own_device()) does not apply here: the trigger
framework that error was in is gone in this version, replaced by the
kfifo buffer described below.

Full history of this series (v1-v10): https://lore.kernel.org/linux-iio/?q=MAX86150

Changes since v10 (2026-07-17):
- Redesigned onto a kfifo buffer instead of the hardware-trigger +
  triggered-buffer framework, matching max30102.c in this directory
  (Jonathan Cameron -- this was the big one: a trigger + triggered
  buffer doesn't fit a device that just has one hardware FIFO and no
  concept of a triggered "scan").
- get_unaligned_be24() for the three 24-bit FIFO fields instead of
  manual shift/or (Andy Shevchenko).
- regmap cache added (volatile_reg() + REGCACHE_RBTREE); FIFO_DATA,
  FIFO_WR_PTR, FIFO_RD_PTR, OVF_COUNTER and INT_STATUS1/2 stay
  volatile (Andy Shevchenko).
- devm_regulator_bulk_get_enable() for the four supplies instead of
  four separate calls (Jonathan Cameron).
- sample_period_ns expressed as NSEC_PER_SEC / 100 instead of a bare
  10000000 (Jonathan Cameron).
- Added a comment explaining why a part-ID mismatch is fatal here
  instead of a warn-and-continue (Jonathan Cameron).
- _nA / _Hz suffixes on the ADC-range and sample-rate defines; moved
  the LED pulse amplitude comment next to the define it documents;
  dropped two comments that just repeated what the diff/code already
  showed (Andy Shevchenko).
- FIELD_PREP_CONST() in place of FIELD_PREP() everywhere the operands
  are compile-time constants (Andy Shevchenko).
- USEC_PER_MSEC-based constants in the PPG_RDY poll timeout instead of
  raw 1000/25000 (Andy Shevchenko).
- max86150_do_read_raw() split into two functions (the shutdown-wrap
  outer function and a max86150_read_raw_locked() inner one) instead
  of a label + goto (Andy Shevchenko).
- All three switch cases in read_raw() now `return IIO_VAL_INT;`
  directly instead of `break;` + one shared return (Andy Shevchenko).
- C99 initialiser for the i2c_device_id table entry (Andy Shevchenko).
- devm_regmap_init_i2c() now runs before the regulators are enabled,
  so the pure-software setup happens before any HW interaction (Andy
  Shevchenko).
- Kconfig now selects IIO_KFIFO_BUF instead of the now-unused
  IIO_TRIGGERED_BUFFER, matching the buffer redesign above.
- Shortened this commit message -- the implementation-detail bullet
  list duplicated what's now in this cover letter and in the code
  comments themselves (Andy Shevchenko).

Changes since v9 (2026-07-07):
- Rewrote the buffer implementation around devm_iio_trigger_alloc() +
  devm_iio_triggered_buffer_setup() instead of the kfifo buffer and
  manual postenable/predisable pair. The hard-irq handler only read
  and cleared INT_STATUS1 before calling iio_trigger_poll(); the
  threaded trigger handler did the FIFO drain. This relied on the
  trigger core's own attach/detach synchronization instead of an
  explicit iio_buffer_enabled() guard or synchronize_irq(), which the
  old design needed to avoid a NULL active_scan_mask race on teardown
  (Sashiko, both HIGH severity findings).
  [NOTE: v11 above reverts this back onto a kfifo buffer per Jonathan
  Cameron's v10 review -- a triggered buffer was the wrong tool here.]

Earlier versions (v1-v8) are in the full history link above. The
notable structural changes along the way:
- v1->v2: split the original single combined patch into three (dt-
  bindings, driver, MAINTAINERS entry).
- v4->v5: renamed the devicetree compatible string from
  "maxim,max86150" to "adi,max86150", matching the vendor prefix
  Analog Devices actually uses upstream (Maxim was acquired by ADI).
- v8->v9: folded the standalone MAINTAINERS patch back into the
  driver patch, dropping the series from three patches to two.

Md Shofiqul Islam (2):
  dt-bindings: iio: health: add adi,max86150
  iio: health: add MAX86150 ECG and PPG biosensor driver

 .../bindings/iio/health/adi,max86150.yaml     |  77 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/health/Kconfig                    |  13 +
 drivers/iio/health/Makefile                   |   1 +
 drivers/iio/health/max86150.c                 | 658 ++++++++++++++++++
 5 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
 create mode 100644 drivers/iio/health/max86150.c

--
2.55.0

