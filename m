Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD0351C3E
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555162; cv=none; b=Y2zoDrccC3Cl/wdgI1YoVqtrCae+fPiObSRjJRGMo5kh+hOwXT9qjNbFna0ltnIJ5DtRIXCP/q4HdRBYm+2Pqg2YBnkWd12VoAAN7tuxeSCs0t9n0N00wH311FMxaSijFSzDMX3DfIdoHyyZ/p7Y7qKOTURJPcHFAyPFPssnizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555162; c=relaxed/simple;
	bh=8dEreTq+ClyahaXJ6jaZkn9ylJrISDINPNdiqWkJrGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M5DFs6QELNQiZ/wAotxPjILfTGktXbCXPb8u3cetIcwtrqEX0XYyHf0SS2X9V9jqBAxJNu7YwHlx0oXMWVrzB9i4tO1PVdkniolXzo9HtY7Pd4mxqQs72auOr5HtOTFm4e8DDCoivc2/1CCv882Wu7C53c4bDHBqaxO2DqJicME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=r6kr1aM6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="r6kr1aM6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso1026378f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774555159; x=1775159959; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyiyouDNO/j0IqzSw//lozm1XupWUO2SGUR/Oq71IO4=;
        b=r6kr1aM6uQ04qD71X+Fm7bBMK5bDExJnWnc702+hUGiRxq//5+A73rdNHRd0BJsg13
         j4hnAJkw+zTs6pWgdXuSiQCNO7zP73RxkbVFImJKAypITsoq51V9DOP7Non8GpBSoWe3
         Yg5fXSpd7bXNAzTHn0Dav9BmS2SjyDZdQHlANHb+KyyehbR84eW5QfWrf/YmH8vVVcRV
         zvw/SUGTdjKDiDVX3zyudzNBH8ZRJ11n7/3RSGx2l6ftVh5kveaBvm8snx0IOdniT3ed
         V5PBxWw2dnAF0lqTurf+f+CTnbLw8t5fi/VGNI90yU9DLkUVqDHCYhR53KC2k2oQld8w
         QAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555159; x=1775159959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyiyouDNO/j0IqzSw//lozm1XupWUO2SGUR/Oq71IO4=;
        b=EFc0RXrEzESPLP04IykXecXcbm5FN+oUbt94HaPBDEFfWg3j8fk+QmbnglY43Ek1MT
         TYIlieCetiYDtv0fM1cBzBUuQHtAv7YvyLkKdNkCRlds3x++hCvJZhZ9+f/fsxnuMowF
         WlhbJMXw9wWhPNaCGnh4MM9i+UXc3dlp+25GlSUvcQxfwd34ZZAtoInubaXO4PACNqhd
         iQXB1ogPyYLNGZFGXNMIbbp/xRc3JxIT5iAqxhVqMlyLMswVRDkoRzHhuDq62n3Y1+Uy
         GxF1Af53OTwC3QIZgxyGSnaj1JRGJ7W3mvJK7ASdzYLXrQ95pHP0D4IQ6WHc03qwSNnI
         6Y9A==
X-Forwarded-Encrypted: i=1; AJvYcCXDoIeLgl5hhx9unVdyQSU7cAnOO8tS/Eg8apGypBRKE0IteXnbB+3SUR+3dsXsRIdn8EfCQA5HBZqm@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCCqvwrsWHA6NW8Iad51OAzHqqARTfg9B4S5fLlAtNh7cmAl1
	9LzXlN5t/fkoNV8Wft3FIPBeK1FvobVxcx95WzrjdvlTQBMavhBhJ7IRDsGPtFuOJxM=
X-Gm-Gg: ATEYQzwje6x1n3Vr2HtpUGcYUZDHb+bU0B1G4bWQOPgS4xeQNOLUNPDggMm+Gl9saz+
	ZCQTd2vGd+zgUj+ssOV1GlfczEwlCOCh6Ms5gEba7RvPQv4QNlcBUx0VF4NtExslARKKrS4xPVT
	bCnk19nkIGZnNPMV9mKzXF2jjEaFreO0i42KI8twa4Bu43zB6yZO4MhRXcHQokNyoIzbrOknsS3
	Mb8fiyn6hmWIx8u5FXnQ5KoEB6+8TsGUYC8d+g7edz+CPI4gxnrKBr5MVxuDmJRmsOd9R9RBaQk
	jvYvjkZEbnmLR+3lnb7wDHN+vC6AnM2zplNNyO1D6CDV8NWWE0V7l1kzoGunWJBxce+vXUcsVgG
	i+PBfprEE2Bg98pSFblGkoS4+2XF+a+bJSSxk4vRREtSnTbwXi1B5b2P5PEb42Gy5N2ozys6QIo
	8OLuBaiN2iSnLsP5lAk5x2Z1LvJXb///+LhPWQbyAjxKMU+A47asmBKvZZTEmUvxdhx+5KjGL1b
	iWJ8w==
X-Received: by 2002:a5d:5d0e:0:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-43b889a4a1bmr13790147f8f.17.1774555158127;
        Thu, 26 Mar 2026 12:59:18 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm11339012f8f.27.2026.03.26.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 12:59:17 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v4 0/2] Add support for Texas Instruments INA4230 power
 monitor
Date: Thu, 26 Mar 2026 23:58:59 +0400
Message-Id: <20260326-ina4230-v4-0-c1e312c09de7@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOQxWkC/2XM0QrCIBTG8VcZXmccjzqzq94jutDpmhBr6JBi7
 N1zI1rR5Xc4v/9Eko/BJ3KsJhJ9Dinc+zLEriJNZ/qrp8GVTRCwBmSaht4I5ECVMIACNJPckfI
 9RN+Gx1o6X8ruQhrv8bmGM1uu7wbKTyMzClSjZc7rA3OiPrW3MAw+7ns/kqWScZMccJNYpJRWa
 Me0Q2P/Jf+SDDbJi4TaWG6UaqSCXznP8wv/o7edFAEAAA==
X-Change-ID: 20260219-ina4230-74a02409153d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5538; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8dEreTq+ClyahaXJ6jaZkn9ylJrISDINPNdiqWkJrGo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQencAj6xXUey9psUKGesU3ln+XT5yIXrPaZfkuD96Hy
 9blVn5h6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqOXYz/I9j1DFPb9IO+SfjXhG4ruzyxoivp8+/OWKvv2ix8CeW07cYGe7JXPx
 3IGU645fA1EijU/bnt/Ovt+550GCo3KPIkr9jCTcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI INA4230 is a 4-channel power monitor with I2C interface, similar in
operation to INA3221 (3-channel) and INA219 (single-channel) but with
a different register layout, different alerting mechanism and slightly
different support for directly reading calculated current/power/energy
values (pre-multiplied by the device itself and needing only to be scaled
by the driver depending on its selected LSB unit values).

In this initial implementation, the driver supports reading voltage,
current, power and energy values, but does not yet support alerts, which
can be added separately if needed. Also the overflows during hardware
calculations are not yet handled, nor is the support for the device's
internal 32-bit energy counter reset.

An example device tree using this binding and driver is available at [1]
(not currently upstreamed, as the device in question is in engineering
phase and not yet publicly available)

[1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v4:
- Aligned the maximum value of ti,maximum-expected-current-microamp property
  in the binding with the one expected by the driver (Guenter Roeck)
  "2147A ought to be enough for anybody (c)"
- Actually requested the optional vs-supply regulator in the driver (Guenter Roeck)
- Program the ALERT_POL bit according to the value of ti,alert-polarity-active-high
  even though the alerts themselves are not yet implemented (Guenter Roeck)
- Added a check for manually disabled channels in the is_enabled() function to
  avoid reading invalid data from them (Guenter Roeck)
- Dropped support for the single-shot mode as its operation is not clearly
  documented in the datasheet and there is no pressing need to support it (Guenter Roeck)
- NB: AI feedback regarding regmap_noinc_read() producing incorrect byte order on LE
  hosts is incorrect, as its implementation does a byte-wise read and doesn't care
  about the regmap value width or endianness flags, so it produces a 4-byte output
  buffer in the same byte order as the device returns, which is BE in this case
- NB: AI feedback regarding fail-path pm_runtime_put_noidle() potentially being
  unbalanced if the probe loop failed early is technically correct but practically
  irrelevant, as the driver will simply fail to load, and the usage count won't
  decrease beyond zero anyway. The alternatives are cumbersome for no real benefit
- Link to v3: https://lore.kernel.org/r/20260310-ina4230-v3-0-06ab3a77c570@flipper.net

Changes in v3:
- Updated the description of the ti,maximum-expected-current-microamp property
  in the binding to clarify how it is used, and drop the irrelevant mention of
  the PMbus (Guenter Roeck)
- Use div64_u64() instead of do_div() for the final division in the calibration value
  calculation to avoid overflows in the denominator (Guenter Roeck)
- Avoid overflow while scaling the voltage values on 32-bit platforms (Guenter Roeck)
- Use regmap_noinc_read() instead of regmap_raw_read() for reading the energy values
  to ensure that the regmap / bus driver don't wander off to adjacent registers
  during the read operation (on INA4230 the whole 32 bits should be read from
  the same register offset) (Guenter Roeck)
- Remove redundant call to ina4230_set_calibration() in the current read path,
  as the calibration value is already set when enabling the channel and restored
  across PM changes via regcache_sync() (Guenter Roeck)
- Add missing write_enable() function to make hwmon_in_enable writes work as
  advertised in is_visible() (Guenter Roeck)
- Add a check for disabled channels before calling pm_runtime_put_noidle() on them
  to avoid refcount underflow due to imbalanced get_sync/put_noidle calls (Guenter Roeck)
- Dropped unused include of linux/debugfs.h
- Add missing return checks on regmap_write() calls
- uO -> uOhm in the error message to avoid confusion
- Move probe-time calibration after enabling runtime PM to avoid it being reverted
  by the PM sync
- Link to v2: https://lore.kernel.org/r/20260302-ina4230-v2-0-55b49d19d2ab@flipper.net

Changes in v2:
- Replace u64/u64 division with do_div() (kernel test robot)
- Add an example with ti,maximum-expected-current-microamp property in
  bindings (Krzysztof Kozlowski)
- Include the newly added binding in MAINTAINERS file (Krzysztof Kozlowski)
- Use dev_err_probe() where appropriate in the driver (Krzysztof Kozlowski)
- Switch to devm_regmap_field_bulk_alloc() instead of an open-coded loop
- Add a bounds check for the calculated calibration value,
  and a corresponding error message
- Link to v1: https://lore.kernel.org/r/20260225-ina4230-v1-0-92b1de981d46@flipper.net

---
Alexey Charkov (2):
      dt-bindings: hwmon: Add TI INA4230 4-channel I2C power monitor
      hwmon: Add support for TI INA4230 power monitor

 .../devicetree/bindings/hwmon/ti,ina4230.yaml      |  134 +++
 MAINTAINERS                                        |    7 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ina4230.c                            | 1032 ++++++++++++++++++++
 5 files changed, 1185 insertions(+)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260219-ina4230-74a02409153d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

