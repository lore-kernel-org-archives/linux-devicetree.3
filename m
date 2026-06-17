Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5723CC7CC
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683248; cv=none; b=Xr2ENM7wyx1yxHElJYQaPJOVADesSLXW8gzdfJl7H4gn3hk7Ogle6qhAB2NMXnOBFcI6ysKkZebIwRB7Kv9yZokmcZHnh1V8Ilk3BUZ/Ifmrb4RYFM00A/DVn8g5Z8F6Ay8hdI1e9Vceu8l4qce+0+QBU8YhYsAPeJPLevyQSew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683248; c=relaxed/simple;
	bh=R4AtVbQ6oyC+Ag1oLv+Kj+iSS/rVvY9CmVauAm7kD2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSyjGWzoMEnoOHyoyfC5hgh5J5QPUaHQGIz28bwDfxyYSQlTbLRkKiJwihRP2LEMAJ+EsxSS9ywkKoDt33FfEvCFO13Xn+qgVYDdWSmVmiEDLcPkaaIR8QmQXz1UNgIRzy3dLAfgtobmfzcxdyZITBQV8KlEvfMG1xSTG1Ki/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIfxnH7i; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIfxnH7i"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bebb72b845aso926782066b.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683242; x=1782288042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcUO9XWzTg2IsD2mVUzEQjeXErkVrXuEkYwVMwsj2Z0=;
        b=lIfxnH7iD18zPNxrG8f0e7cOOCn+nSdxcjxtXJYLConi3l752C1QaiAUFdclvH8bnO
         oGzUD3Q6u+5Wqoz1BNc2sq+NSUvtby5TT7bppAxqGYiHVDFaBw5q1ysaWdfYz05NOYEX
         oxo1uo+SjJ9ZORLOVa4POqDIyU+MZ9A8KA86mLR6grGyB96QW7ZdItO4ylKBZl4efvwj
         n17hgw/NTfDUYJ9/CT2HhrfCh3dLv8Q0uPqS6EEePSagyQubcQyQNJ0fPRDYpAIObbv8
         Gg6pMu1hGhuKl9OUDXYhFYnS9N1rHtvGMnQwRIIjqw9zGLi/JbLMJY+pfENZcp3HHFGV
         IJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683242; x=1782288042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcUO9XWzTg2IsD2mVUzEQjeXErkVrXuEkYwVMwsj2Z0=;
        b=BCEEIDU1AQWvJVORgeK5MeeG2OqOQxZWjzMujSI8D8nUg3CRHQ46N4HwUH2GGU5TY3
         dQ6vQIGD5FzLjKSC8FZ6Cc03l8tKkLRIBAbvy2TmUKHfEOVrFzlIl5ZknVjAajy5jmJm
         jRCwMVRO8+b6Rw499FyIVdcvuHVKB8RZyasA1S5iGuvs87d+7NWgdSgw8dYsKY/wcKjf
         bT5LHXJKqYGOD0Rss8MFj5e1ljuoJjS6my64+nixnd7ERaCGem6zLlL8CUnrAsOdqg9G
         Bz7xKuzfD+z0Adzodh2egCfGvsQUzxNgiefbzwIzRBjLhN3FDKJxpydbdAnTdqZleRpU
         5zrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0s37Ub0qSBhDiXCXxzPFS+7z7J38yJz53TsiG4KEw/t4hcJp+bwci+uqvd4eVRUVVwugEYVnCXREK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gVF0/c79fAgPO4vIe2WUK8j/R2LiNd0oCb8LB+aYIgECxRkk
	6CD/Hvz0xss88TJjaTAZIesb+LpgC0TQ9cwh826OHaDfUJtC2B0BqMIr
X-Gm-Gg: Acq92OHcFfGU8+FwE3AspVhX3gS4v+vRC9+JmxKp/LfwfW85dIYrEtZxNItufI3uMX7
	8Gg2l4baqga7hfUV1uGedm6CBsjSBNOn6Amsuk7lgHj+KkCErrGQssbXx2fI3bxlvxWvVmWXq8l
	nfR1F7l39cBzn0CCHSG/K1s0dewZ7vtFJ7dqzGt0ndGravEM1Thwx3GtkR3RupTlBSvGHbw1wkf
	YjEB/TOYWd6d9hFKFPt4bADAJ/QeSvdVP+L4+qRPG6PT8V5Ri9DmhzAXD6NpAAm9Lkx2mk6l0+9
	z784hLnVAx25YOUMVY6AJJPOz3Kn4EhvPKRbdL0BvW7ow237wLIGshZrQECUas7xvpstMshUfOV
	h8QSgYgvJyZ0T5Le6AehOnlMkcj4xwEXZ4rTbqHrp7IgWq83WuGXgy5XIJVp8P9rnjf8H8W6Ko9
	VSXA==
X-Received: by 2002:a17:907:6090:b0:bed:e2e8:d8c3 with SMTP id a640c23a62f3a-c05a2e40c2dmr185800566b.22.1781683241134;
        Wed, 17 Jun 2026 01:00:41 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
Date: Wed, 17 Jun 2026 11:00:17 +0300
Message-ID: <20260617080031.99156-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LM3533 to OF bindings, add missing VIN supply, add support for
setting mapping mode and LED sources based on device tree. 

---
Changes in v2:

schema
- maximum led sources for leds set to 4
- anyOf > oneOf in ALS
- improved ALS descriptions
- adjusted example
drivers
- dropped devm convertion of irq and mfd helpers
- all als configuration moved into lm3533_als_setup
- added regulator/consumer.h
- lm3533_bl_setup set before sysfs_create_group in backlight
- added check if LVLED is valid
- LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLED5

Changes in v3:

- ohm -> ohms
- added default PWM mask to schema
- added commit removing driver regmap wrappers
- added commits which flatten pdata helpers
- adjusted check if als->irq > 0 since als->irq can be negative if error/missing
- added count for children defined in device tree and mfd_cell is allocated
  via devm_kcalloc to be able to contain all of them
- fixed backlight boundary check
- fixed count increased unconditionally
- dev_err returns node name instead of reg value
- LM3533_MAX_CURRENT_* defines moved to common header since they are used to clamp
  current values read from the tree
- mapping mode commit splitted into 2 (sysfs logic improvement > mode from DT)
- backlight mode configuration set before sysfs group is created
- fixed LVLED check on LEDs setup
- added check if HVLED is valid
- fixed wrong err_sysfs_remove goto in lm3533_bl
- added commit implementing backlight_scale property

Changes in v4:

- fixed regmap_update_bits val and mask swap in lm3533_als_set_int_mode
- fixed als->irq check in store_thresh_either_en
- removed clamping of r_select in als driver
- added use_of_reg and of_reg for backlight and leds registration
- added intermediate step in asigning props.brightness
- fixed HVLED/LVLED configuration overwriting
- added bounds check for num_leds in leds and backlight driver
- switched to regmap_clean/set/assign/test_bits helpers where appropriate
- dropped extern from header function declartions
- switched lm3533 pointer in cell structures to regmap
- sysfs_create_group > device_add_group
- changes in backlight sysfs were expanded to all properties

Changes in v5:

- aligned driver helpers to use u32
- child nodes parsing linked with 'else if' to ensure there is one call per node
- removed redundant pwm var init for leds
- fixed regmap_test_bits return check
- fixed leds and backlight counting handling
- iterator variables made scoped
- lm3533_als_setup() set to exit after mode set if m0de is pwm
---

Svyatoslav Ryhel (14):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  mfd: lm3533: Remove extern from shared functions in the header
  mfd: lm3533: Pass only regmap and light sensor presence to child
    devices
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Use dev_groups in struct device_driver
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: Set DMA mask
  video: backlight: lm3533_bl: Improve logic of sysfs functions
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: backlight: lm3533_bl: Implement backlight_scale property
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  69 ++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  67 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 169 ++++++++
 drivers/iio/light/lm3533-als.c                | 180 ++++-----
 drivers/leds/leds-lm3533.c                    | 184 ++++++---
 drivers/mfd/lm3533-core.c                     | 375 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  33 +-
 drivers/video/backlight/lm3533_bl.c           | 232 ++++++-----
 include/linux/mfd/lm3533.h                    |  75 +---
 9 files changed, 821 insertions(+), 563 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.53.0

