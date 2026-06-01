Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2EB3DB961
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327145; cv=none; b=i3xSbYc3fVQBaDm+mwZa5ZyJrwTkDL/ekRQiYd5sWWR0Vvoqiq4KMcCGIpO7hH8KyH8sPX5Kr0PhJ4nm+Gjq1il49ewQP8j44u967IZ1vLtxfz7mwlQjZfJyKl21+kRyRReS9iffQ2Zn1XvoaCaC779ZXcpIYkgdx9qDdL/5qHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327145; c=relaxed/simple;
	bh=PXFHvGio0optY61LEkjNkEzijVZnDLT+o2ExZZLbhKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fq1DEAgWxBODOvxOSbj2dWirKorLxWH6qz90s+3xTr8PRnQYjmbdaltsG4jg8VzzU4ZCr/cClaAxNo6owq71Kxr09S6HFlgemABYvV2MEegFgmQ3emWcEBmGYgR6H6ztQNIKR1GWCpdsBSkZjGBMCyZoG+hd2ZxceAHYpFJT6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOdIHSAB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOdIHSAB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef4223be7so1758751f8f.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327138; x=1780931938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzN96GbcZUpB13Q9YtY/dmYRB6hgHD9CiDUD5v/xjEA=;
        b=HOdIHSABzfgWx6LFlNNUcprEOfEGGWvwEf4bQdcaQigLgiL4AE1dDrvfzsMI1ed0IB
         G29wE7pR7JSzZCLREquNbb3y1+aH8mZcNT8LO89DUCsAPONz644LJALPjjNZAipEtPwM
         p5q30ifdTIOrR7SBnleaEsxQeivIgezhMbvK7LDJTZONnwx8oHMICipOlpZb6KvX+GDb
         mHhWJ7aY1l5MfaetMcUxviJZSrxIE59a6numTNH18UaaOee5MDeDaYYq3B8H71xyc3gh
         nOITYDLRSi1hYlYQqHsikJ+Q2pk/CIeReTXpCOmehQO33F4XLcZ0ZrnhQ0La0lZfTnqp
         kL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327138; x=1780931938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzN96GbcZUpB13Q9YtY/dmYRB6hgHD9CiDUD5v/xjEA=;
        b=Zzh+ikx+4Zspp/zVSgYk2mZaPhwFmdU3HBhrknD5KoRq51lcHmNIZ8uDQFSkgwyg+Q
         bZE/GEeoBoAd6oGA+GCyr3VyyczyJVC+uU+PhL/H3dt4Wa9veTZaHni5ObIA37G5A2ej
         7vUXnBXwe77X98DVypBvNCyiQPqBIjnC2VQ4hzWZLhmGhBs3FSpWqS9dzrQ2Z1XWfTVT
         ssqJkjXEEzlhulm+jj00NO60HFKhAAxttw4JrK/W/hHbM1FlXgegQJHP03fkGVJBIx3e
         XaCrkmGIkBumdHvZDuQLt4zU8S7wI7ih2ZX+shyZjKiZiT9k0jZsBmg5ndTcpZY8JN3o
         5jZA==
X-Forwarded-Encrypted: i=1; AFNElJ+YL1AnpasPZJ0SLTrxbh6ksNJ+6apsl2vsW/SjRdQXOtsp9miQTCPflCOzR3nKJaBofr4cIeadASxx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Fx4dg/85ohf/VrQ7cGHK1+xf+nb3kaM5e9AfLhAKoihXe+Ye
	GbVJ+DukIaxX1iI4iIbaiFs1y0sU3eIr5/d8eht99BfIYwmMprcO56bo
X-Gm-Gg: Acq92OGwDx/clFKby9ZgO3lfVyZRhm4RZ4j1uvjbcCfHS6ULtpqeb8HSlJz9yFqjk4D
	bUkwaN8d0xmj1IVGb+ax6vvEJWhz3tkg4zHbKCJ5IXDPKfryH6hRuwo3ANBzmJmS7VXwtAJtAJC
	vuLrwgnYxMThlg0LBBlC3qM1tdvhzPpmq8qZMiYLdFJNFg/uh+F1Mc3NCschxkd2SbcBHfcuzbS
	C6Gh4A4x2trrQitAMo+FdqKXrohz0k7MZdhlQ7ecaBS1EQVNNJHNmwuNJm5znonP4M8NUEYqqtf
	8O+KJNvniMsQEQvNpmqmsZ7mva6tsZOpwUmbeO/M1ARXpRcmdmnhHSuEDTbCVVoZwRxL2sq0445
	XX0C9lkwQ52oLGenG/fwcyoB9TOKFNRmCRv1vPV31ck045f1OimgVGKfbXPPACUB87qHz7K3y3X
	Y5mYsKQ/eoCy5fHZKlES1j3bo=
X-Received: by 2002:a5d:59ca:0:b0:45e:f46d:fa95 with SMTP id ffacd0b85a97d-45ef6a8c8f7mr19705747f8f.0.1780327137736;
        Mon, 01 Jun 2026 08:18:57 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:18:57 -0700 (PDT)
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
Subject: [PATCH v3 00/11] mfd: lm3533: convert to OF bindings, improve support
Date: Mon,  1 Jun 2026 18:18:20 +0300
Message-ID: <20260601151831.76350-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
---

Svyatoslav Ryhel (11):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: Set DMA mask
  video: backlight: lm3533_bl: Improve linear sysfs logic
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: backlight: lm3533_bl: Implement backlight_scale property
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  69 ++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  67 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 169 ++++++++
 drivers/iio/light/lm3533-als.c                | 159 ++++----
 drivers/leds/leds-lm3533.c                    | 142 +++++--
 drivers/mfd/lm3533-core.c                     | 361 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  27 +-
 drivers/video/backlight/lm3533_bl.c           | 153 ++++++--
 include/linux/mfd/lm3533.h                    |  62 +--
 9 files changed, 758 insertions(+), 451 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.51.0

