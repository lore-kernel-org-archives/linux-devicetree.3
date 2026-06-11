Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508093CE49E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184425; cv=none; b=K6or/+mXjXxRQrOiwfm73FlfxdHi6VC9TsXiWQuyiTKsibQfYWBqa6JoFONfPva4ptf6VHxnKdJ9/q/5Cdw6rMLU0Der9V/8b8JRyk+BKuN+GU2mZzhzHyrjjjNzPLYY3SX2uW3LAfkmITrb8vHGLWlMG9P03QGtJVUbmjBPKQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184425; c=relaxed/simple;
	bh=AqbY7DH2kgfWUfPRHlz/O0dHt5a2jTDAnyWI0yoNy+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VV6mj3MaCqRfrhFx4TerqxoXO6JeOvksoBTY5Bt37L1vPGa7RJ76OgFbYoDbNumeGteQlzWENta5VrXioCAY+FATiIE7cdGhlI5hgmtxon9PNUveHEw+F2sEQqFrs0lCTgbWrFUDI93h6vViBekC0DEgri7EXicQ7Zl4MJhYPOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1GHLIUB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1GHLIUB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso1311137866b.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781184423; x=1781789223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hiFK0euPbueRFFIEpqSOevmoidgR/b4o4nT7xg9GQHg=;
        b=a1GHLIUBm9gSQZhje54oOkDjC8KcaQkMPgtTlzpRgh0yyMhQedclfLywFISeybCT0A
         5HYaPPDr3fn7cAqxZS2/ks6bXgY3xHZXWHDS8ml4vdtgkCGOTVfefjxWPE/0xk6h6MpV
         k1LJfaAlSutt+tD+025ikvpURagwqxbqDdBGpdhwhC0n9zvvtW7YxQNDV0oT4RytRyEq
         qldklXDiYhw3I6a1PI5+rm0DxOjSKpjFKjIo1abjDcn0UmIMAKJ8R+0h4apOdzEE6qlW
         ZGRRcHQe7ISLE+BTejKsW4RmETp2XEGAyvCjCO0PHbkXsnpyTgFlxGsftRqcYTWutVjb
         yBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184423; x=1781789223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiFK0euPbueRFFIEpqSOevmoidgR/b4o4nT7xg9GQHg=;
        b=ZUSUyYuktTXOlIAPz+Dgm82f7N+/VZH5QVgxgf76ceXgK3ZVBbT/zFOWh1E7TnL1om
         f0NvSmRHJBzUm3Viqnh/5dgrUsdF21QCjpjMyf2S5XzUMjJ31AngX0Bm2Bsd1oJSP6qM
         zFfYaEiuvIDoQ3wbhiRmNslwKfufdfmABWjiie2j4FKnNT8OtwaKOAhOHE1gvFS/B72O
         wzOybV9IzabLxyRSyvBbxfUsh5Mk+7qBHWkFAjEejzOsi2/iPHRDT3lX8tE1HG4x6rRb
         GC4JOpLxIxRrRrpfN9n9JAVJF4vzYsytIahnBfZw3quRXQyDnf1EehADQIz84Br1uBDR
         ehaw==
X-Forwarded-Encrypted: i=1; AFNElJ8eTgKsALV6hbym5nd/sG+t0z7tcmFq2un1lhcYEAb7H2xPyX3T26RO88y4kxONk0iOQBXe8w4/UmcT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+v9N7QrUL43OYpSokBFiAISDyklvuhgrISfEwbUAoehzXzLQ2
	TPH8VUJRQD9QzJ9TYsTNWInfrPoPz1MtAnzcMAkj54Anzfbzd5fXhcac
X-Gm-Gg: Acq92OHuiB30H/QyLAKSfVk/qqbGhMY+cmv6M8kc6OrWmOromoXphquSGX//kDxYztH
	Moc27Z2t7H4JqKy4U6a1dZ+SsH6ZVS5DDcoWfgKAGqv9e234G6HuPRdVKvwAxQdIchCel3WR3tz
	BvhyZlk7yC/SvH5vmzITTzd1NJg/+tkYWHUP9Qaepf4MJ1/mk7YG9F5Eum2p2RiYKDe/gsTlOuR
	Flf8Y30t1mcfbcvM3YAV1dycLbpnG5hhd7emF4/dFKrnvYeOKbRwwo4wsP3UWSbYDkKFX/cU/sI
	xa8FiA7IH9RrHUyxyGNZuZ5u8k3vIVn6RmBolQnVjnGkzF7N+urMktioeUK4SOZ1JwQHatjyyAn
	dHLEjy7w8NxnLWmtmtleX9+orApVfjtHVGy3o9CdUO6LgIEdLgEEaZvftQtijuVEGhbC6khI9Fw
	FSNVj2K5iltCIDU/fIR8BD6zZkNm99NOfJf9yyOg/T0BajRZBbtbja/Y2TyHT7rKMVLVcR04PFz
	vanj7IBxG5SFG0=
X-Received: by 2002:a17:907:e117:b0:bfd:6d25:ba78 with SMTP id a640c23a62f3a-bfd6d25bb8cmr6330866b.39.1781184422208;
        Thu, 11 Jun 2026 06:27:02 -0700 (PDT)
Received: from fedora.clients.cmblu.de (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1cf077asm65719566b.26.2026.06.11.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:27:01 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v4 0/4] iio: flow: Sensirion SLF3S liquid flow sensor
Date: Thu, 11 Jun 2026 15:26:56 +0200
Message-ID: <20260611132700.671322-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series adds a driver for the Sensirion SLF3S family of I2C liquid
flow sensors (SLF3S-0600F / -1300F / -4000B) and a new IIO_VOLUMEFLOW
channel type.  As in v3 this is posted as a fresh thread.

Dependency
----------
The volume-flow scale is reported in m^3/s as a 64-bit fixed-point value
(IIO_VAL_DECIMAL64_FEMTO), so this series depends on Rodrigo Alencar's
"ADF41513/ADF41510 PLL frequency synthesizers" series, which adds the
IIO_VAL_DECIMAL64_* core formatting (and the kstrtodec64() and
div64_s64_rem() helpers it builds on):

  https://lore.kernel.org/linux-iio/20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com/

Patch 3/4 adds the IIO_VAL_DECIMAL64_FEMTO format type on top of that.

Changes since v3
----------------
  * volumeflow unit switched from l/s to m^3/s (SI), per Jonathan
  * scale now reported as IIO_VAL_DECIMAL64_FEMTO instead of
    IIO_VAL_FRACTIONAL, so the small m^3/s values (~1.7e-12 m^3/s for the
    SLF3S-0600F) keep full precision; this needs the new FEMTO core type
    (3/4) and the dependency above
  * dt-bindings: sensirion,slf3s-1300f now serves as the fallback
    compatible for the other variants (all variants are detectable from
    the product-information register), per Krzysztof; Marcelo's
    Reviewed-by dropped because of this change
  * dt-bindings: add interrupts (maxItems: 1) back
  * dt-bindings: reflow the description to 80 columns
  * dt-bindings: move "F: drivers/iio/flow/slf3s.c" to the driver patch
  * driver: add system PM ops following the scd30/scd4x precedent: stop
    the measurement and disable the supply on suspend; power back up,
    wait out the power-up time and restart with the previously active
    medium on resume
  * driver: if switching the medium fails after the stop command, restart
    with the previous medium instead of leaving the sensor idle
  * driver: a sensor reporting an unknown sub-type now falls back to the
    variant named in the device tree instead of failing probe, matching
    the fallback-compatible semantics
  * driver: serialise the command/response exchanges with a local mutex
    instead of iio_device_claim_direct() / release_direct()
  * driver: issue a stop-measurement at the start of probe(), so a sensor
    left in continuous mode across a warm reboot does not NACK probe
  * driver: read only the 6 bytes actually used (flow + temperature) per
    measurement frame instead of 9
  * driver: trim the per-variant list out of the Kconfig help text
  * ABI: in_volumeflow_medium[_available] documented in
    Documentation/ABI/testing/sysfs-bus-iio-flow; KernelVersion 7.3

The signaling-flags word (air-in-line / high-flow / smoothing status) in
each measurement frame is intentionally not read; exposing it can be a
later follow-up.

Thanks,
Wadim

Wadim Mueller (4):
  iio: types: add IIO_VOLUMEFLOW channel type
  dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
  iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
  iio: flow: add Sensirion SLF3S liquid flow sensor driver

 Documentation/ABI/testing/sysfs-bus-iio       |  11 +
 Documentation/ABI/testing/sysfs-bus-iio-flow  |  21 +
 .../bindings/iio/flow/sensirion,slf3s.yaml    |  58 ++
 MAINTAINERS                                   |   8 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/flow/Kconfig                      |  22 +
 drivers/iio/flow/Makefile                     |   7 +
 drivers/iio/flow/slf3s.c                      | 521 ++++++++++++++++++
 drivers/iio/industrialio-core.c               |   3 +
 include/linux/iio/types.h                     |   1 +
 include/uapi/linux/iio/types.h                |   1 +
 tools/iio/iio_event_monitor.c                 |   2 +
 13 files changed, 657 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-flow
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
 create mode 100644 drivers/iio/flow/Kconfig
 create mode 100644 drivers/iio/flow/Makefile
 create mode 100644 drivers/iio/flow/slf3s.c


base-commit: 3cd8b194bf3428dfa53120fee47e827a7c495815
prerequisite-patch-id: b51a25b69f7b78155e78d1a3aab809bcb57e11ae
prerequisite-patch-id: 1b26fb01ab41218c214fa58657305437565c06f8
prerequisite-patch-id: 7745e957a25b8673c7f838a9ae7a55269cd21798
prerequisite-patch-id: 5f805ccb0be820042ac732d0d8e1b188bfd2b2bc
prerequisite-patch-id: 80967f95ecb0c10fc66b3d073e99906126d5b40b
prerequisite-patch-id: 729fdedcf2055c506693d28a5dab65a6a3791598
-- 
2.52.0

