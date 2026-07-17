Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245D207A20
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319104; cv=none; b=At1s3+tu1z+2j7zZENUM7L7cvhXIfASCO6qnHCIYXc0oCddceWDUqwfdeaGqYlYos4+onSCcB9aYwR/92xe0dxpzQvh2f82HbJmepedULHIWa50jkpt3oVmX0YTI2ivI6BWJRnuLKZboXKUpMw+Jf8xis0KuQV91IeFa1K6hzSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319104; c=relaxed/simple;
	bh=rOYOgDHUoaT5zBpQ43IbV/4o/f1K6F9EjiiDV2lKH6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqjihC/2lg7gWcuvKDaxxNtFUolEZ0gbSA3FYEo6uyk85plT70WF23QE1Rla5ZshVQZEC6qNViqyg3/61LhVS3SYOhF2qNFgs32EkJ6iP/odz148e+De6cwkTNF96JeMmO8hFi+r+cPk9V1Kjt9rvdFUyLhLqsLH68JMOJ/wYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URxEQcGu; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URxEQcGu"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b28ce91111so2260544e87.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319101; x=1784923901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjvzhg1EX0MdL+V8itOgqIATlwzr6rOfeYLeZEPBbMo=;
        b=URxEQcGu3sAFhDH1lLCZXBt+ZNjsoBJiq4R+0oZo104BglVqVcF0suNt9HZUcx9Gfq
         VTAsF8OCLEIkt57dGqq4L1Hs5Uwul5ZZDbA/El0IIjQJzfjS2Glqj3YIq1Y1cMOnGrbz
         3lModR5gZUj017u1dmppM10H/DKJn4BNu8QFh0FPUrcw5JQiujPd4UGqmF782fScsd7c
         +3KOEKftyggzkJDBcZ5brObtfIh9fPJ0IZ8EMQFbuBHN2+JaWRTqP5uI8MXWFeHID+Ek
         /Jqn2lqtw5sVnoHL1H8r7tXzdc380M0Cm8tAVZEpJhnU2JEBt5c5glr5pgG1eTaDtc7K
         mX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319101; x=1784923901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjvzhg1EX0MdL+V8itOgqIATlwzr6rOfeYLeZEPBbMo=;
        b=ilWL5zGZnXS4vDWjrXyZbNcXjBX643zt9HnqhRjIbDSRBp2Trcfx88YtsgcPjnRqz+
         VwyRrDffJdVvTuXAf0jdLmDK6kBlhd/vaeJzXM/E911HP+xpWhCAxgbyOgUApoQZEjr7
         kxMODDvH3XVEYNUc4NorVo7j8UVcLF0K6JqeBA8bv1awALeoEdRb9ebJYKZeXB+Uy6H9
         Gu4vEsjii2qP3ey/F8QmG2Pb+yUj1N5NXHf/jdZM0hng5XPDy5oSACQrdObTClPJ4FFX
         DcG19fz66nWu8QtEuRQ4NYtY8lkOGpraEuaOOjNm3U+U1ca7COKl3YVb0VTdTDYdmTPT
         aiJg==
X-Forwarded-Encrypted: i=1; AHgh+RreFXZ7uujPfCef0Sv8J1aWqH+rtlVMAD/lkr91io15oCUR/f0jyCnRTGQ2KqjxQy83Roymhnh13ofo@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdB99y1R2hYSiRFEuF4xPa0w8fM6yFkfJBwu4+3Ygj1Z9dkRi
	sw8NmBxPKwzA/U9yG+nQYK7qnXGGDta0+xfy8pAmXOIJ/ikVPuZqK5RY
X-Gm-Gg: AfdE7clUVV1ZBVIjYRBno9x/A6HlFkwfZwS8n/lX8dRbsU8+c2sMkKd/coXXQHalxCU
	uhqleEqhHuoeLh/l8Lr2DD2BCNwqRjLFDqrpWDJvD3TJkQTahvRgYGs1LcNN/lnMZT+8gbxI/5M
	ejJwK3eQnhq1FH8stuxKPeexwIojtcDXzFvm1R+y6yOQdyBjwGZz81NbGF7pykpJhYUCCKXp5MG
	mUw+lQtLNZWR+qjLEh2St1ZvDJwgkFZ6qL2T4tUxNXK7nNrScKARcHq+qJmgASkeOP7fJK4VPZ5
	49JqMpBmYGNsHdxmQXFGTgMwLbh0Ly8V6MT+3hOozRbtN1JPA4bJCvpmPLQGcJOUaJkz+TDHkEy
	lMwDDpqMSPn15mg0eofU7oUk48HHP8FTd7aOdVSSpKultz34TKXgG4sPocK8ZSX309BV74Nn0oo
	I7CfTEVlRfSn48dUsZxlDcFZMBosLu3lI=
X-Received: by 2002:a05:6512:a345:b0:5b1:589b:3579 with SMTP id 2adb3069b0e04-5b28f861edcmr734076e87.4.1784319100428;
        Fri, 17 Jul 2026 13:11:40 -0700 (PDT)
Received: from Shofiq.home (87-92-108-63.bb.dnainternet.fi. [87.92.108.63])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291da7bafsm571257e87.33.2026.07.17.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:11:39 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Md Shofiqul Islam <shofiqtest@gmail.com>,
	jic23@kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/2] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Fri, 17 Jul 2026 23:11:35 +0300
Message-ID: <20260717201138.1078019-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the long gap since v9. Between then and now the driver's
buffer implementation was rewritten from the kfifo-based design onto
the standard IIO hardware-trigger and triggered-buffer framework, and
I read through every open comment from every reviewer before sending
this rather than sending again too quickly.

I used AI assistance (Claude, Sonnet 5) while working through this, for
understanding kernel conventions and cross-checking against subsystem
patterns; that's disclosed via Assisted-by: Claude:claude-sonnet-5 tags
on both patches per Documentation/process/coding-assistants.rst, and
the design decisions and responsibility for what's here are mine.

Both patches now build and link cleanly (make M=drivers/iio/health),
checkpatch.pl reports 0 errors/0 warnings, and pahole confirms the
driver's private struct is 56 bytes/1 cacheline with only the expected
padding for timestamp alignment.

Testing: booted a kernel with this driver under virtme-ng/QEMU against
an i2c-stub device. Confirmed: probe correctly aborts with -ENODEV on
a part-ID mismatch (stub registers default to 0) and correctly binds
once the stub's PART_ID register is preset to 0x1E; the resulting
IIO device exposes the expected in_intensity_red_raw/in_intensity_ir_raw/
in_voltage_raw channels; direct reads on those channels time out
cleanly through the IIO_DEV_ACQUIRE_DIRECT_MODE()/regmap_read_poll_timeout()
path (i2c-stub never asserts PPG_RDY, so a ~25ms ETIMEDOUT is expected,
not a hang or crash); and module removal runs devm cleanup correctly
(SYS_CTRL read back with SHDN set after unbind, clean rmmod).

Not tested: i2c-stub has no interrupt line, so the actual
interrupt-driven path (max86150_trigger_enable(), the threaded
max86150_trigger_handler() FIFO drain, and buffer enable/disable) was
not exercised. That's the part of this series with the most new logic
and I don't have real hardware on hand to test it against; flagging
this explicitly rather than implying full coverage.

Changes since v9:
- Rewrote the buffer implementation around devm_iio_trigger_alloc() +
  devm_iio_triggered_buffer_setup() instead of the kfifo buffer and
  manual postenable/predisable pair. The hard-irq handler now only
  reads and clears INT_STATUS1 before calling iio_trigger_poll();
  the threaded trigger handler does the FIFO drain. This relies on
  the trigger core's own attach/detach synchronization instead of an
  explicit iio_buffer_enabled() guard or synchronize_irq(), which the
  old design needed to avoid a NULL active_scan_mask race on teardown
  (Sashiko, both HIGH severity findings)
- Clear the stale A_FULL status bit before arming INT_ENABLE1, and
  clear stale PPG_RDY before polling in the direct-read path; both
  prevent a previously-latched flag from firing against garbage state
  (Sashiko HIGH; Joshua)
- Use iio_get_time_ns(indio_dev) instead of ktime_get_ns() so
  timestamps respect the configured IIO clock source (Sashiko MEDIUM)
- Zero the scan buffer before each push so disabled channels don't
  leak stale data (Sashiko LOW)
- Added array_size.h, err.h, types.h; added a blank line before the
  iio/ include group (Andy Shevchenko, Joshua)
- Dropped the free-standing FIFO_A_FULL_VAL/PPG_SR_100HZ/ADC_RGE_16384
  single-value defines; inlined the FIFO threshold at its point of use
  with an explanatory comment, and listed the full set of PPG_SR
  (naming the single-/double-pulse variants) and PPG_ADC_RGE register
  values instead of just the one in use (Jonathan Cameron)
- Removed the unneeded __aligned(IIO_DMA_MINALIGN) on the plain I2C
  FIFO read buffer -- that alignment is for the IIO DMA buffer path,
  not a bounce-buffer requirement I2C opts into (Jonathan Cameron)
- Switched read_raw() to IIO_DEV_ACQUIRE_DIRECT_MODE()/
  IIO_DEV_ACQUIRE_FAILED(), with the read logic pulled into a
  max86150_do_read_raw() helper (Jonathan Cameron)
- Dropped irq_get_trigger_type(): the device has no register to
  reconfigure interrupt polarity or type, so IRQF_ONESHOT alone is
  sufficient (Jonathan Cameron)
- Checked max86150_powerdown()'s regmap calls and log failures with
  dev_warn(); fixed it to use regmap_set_bits() instead of a plain
  regmap_write() for the shutdown bit so it no longer clobbers the
  rest of SYS_CTRL (Joshua)
- Added blank lines between each regmap write + error-check block for
  readability (Joshua)
- Declared the FIFO-drain loop variable at point of use (Joshua)
- Added a datasheet-referenced comment and blank line around the
  SYS_RESET self-clear delay (Joshua)
- Moved the sample_period_ns assignment next to the PPG_CONFIG1 write
  it's derived from, instead of sitting among unrelated LED_PA writes
  (Jonathan Cameron)
- Trimmed the redundant "get/" from regulator failure messages, since
  devm_regulator_get_enable() is a single combined call (Joshua)
- Fixed the MAINTAINERS entry to sort alphabetically among the other
  MAX-prefixed entries (Sashiko LOW)
- Removed the Kconfig paragraph describing the driver's channels
  instead of the hardware (Joshua)
- Added the avdd-supply and vref-supply properties and renamed
  vled-supply to leds-supply, to cover all four independent supply
  rails in the datasheet power tree (found while re-verifying the
  binding against the driver)
- Fixed the DT binding example's interrupt flag from
  IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW to match the driver's
  actual level-triggered interrupt handling
- Fixed .validate_trigger in iio_info to iio_validate_own_trigger();
  the previous iio_trigger_validate_own_device() has its arguments in
  the opposite order and belongs on iio_trigger_ops.validate_device,
  where it's used correctly. Caught by actually building the module,
  not just reading the diff.
- Threaded this series properly with git send-email --thread this
  time (Andy Shevchenko, Krzysztof Kozlowski)
- Added Nuno Sá, Michael Hennerich and David Lechner to Cc, per
  scripts/get_maintainer.pl -- this is an Analog Devices part and I'd
  missed CCing ADI's own IIO maintainers on every version so far
- Part-ID mismatch now aborts probe with dev_err_probe(dev, -ENODEV,
  ...) instead of logging and continuing. This goes beyond the
  dev_info() vs dev_warn() log-level question raised in review: a
  mismatched part ID means we're either talking to the wrong device or
  something on the bus is wrong, and running chip_init() writes
  against an unverified chip seemed like the riskier default (Joshua)

Md Shofiqul Islam (2):
  dt-bindings: iio: health: add adi,max86150
  iio: health: add MAX86150 ECG and PPG biosensor driver

 .../bindings/iio/health/adi,max86150.yaml     |  78 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/health/Kconfig                    |  13 +
 drivers/iio/health/Makefile                   |   1 +
 drivers/iio/health/max86150.c                 | 691 ++++++++++++++++++
 5 files changed, 790 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
 create mode 100644 drivers/iio/health/max86150.c

--
2.51.1
