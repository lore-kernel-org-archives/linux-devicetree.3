Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A52F8EAB
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 04:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721887; cv=none; b=Nq8NsMrBN39by89jktD7zKvFtO/m+GLk5tIRCRJNeRKSG4mboBx1Mqj467ECJvDZTvcWttcS9Q9nHbYoU2mBjbyisg47jNusUhGmpV1167aQmWx7w10x05mTv5uUd7RxCUaTAdprO42Smyz1xJEdnPhJZRGJIYzv3ZQpDo0UTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721887; c=relaxed/simple;
	bh=sChSctaNk/iJ7rMo4OneEoqRj9NRpGu5gBeih5JX6Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lb+rzEFTjVBAAnWhTTeosiFfHGoERTHvJSebIKoZbKcLfiUojL+XaDq8WDn0GJlnxnuNsvJePU11Ewx7SLRYsbxkfOFXnCES//V4nVeQIME/KQqngQpcRnAGSWgtqkl7YA/4JiwTcUi5QRsb8k4myEYVltiDDHTvarY8k99TI08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSfs//8t; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSfs//8t"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so5108952a12.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 21:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721884; x=1781326684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijiDIJoRq4DW5gmq2cKgL9VuesBVH2zWjg+vtHwI5sw=;
        b=sSfs//8t7+hi4vevAcVnNjxy1AQom4JuITz2efSHK9eMjRSjnhpigeGBbwFOXFrODK
         Z/GiP+EFP3SMYvbl4RrWp2DnpUEOX0iMA5Q/A2irlBbF9bhlwDPTzhgHtcuqUHU8s+82
         mkv1VTrkmYfkGhYaxh9vnrs4JLVn/LsLDpnUd7r/6F4PIaRIyKXQfh2mkrPhtDJnAKAk
         nTbRKpBufwY78nqOkIVVvt2hNHNMKNJBXqN0r7tKtMRW5LIRcH+8ojfBz7eKgb/OP7X8
         ODt15qnp7y9J9fLIctqWHekiPiqRPH2rcCdxN7sd4EFopcLlVydJPXxJ42T5rVSnDS72
         IrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721884; x=1781326684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijiDIJoRq4DW5gmq2cKgL9VuesBVH2zWjg+vtHwI5sw=;
        b=Z3ASAyqYroLOrHDgJv7VNB05QTF6P6m3PAH+K2HxAkMUmswnyeb9A4k0orKXfv6+Ft
         jx1HBl/HhdoiCX97ab1F6o0kUJhITNSeltgPxC5ai+vVBaVdVlP0rq8N6DvCqnkUDa3f
         Ff+SZlgtDA0ehoxtbG98R2OyZqHI+CmQwR2BLfptAkibDZ3xhdzeJp/F29yv+LVexGvD
         jzEH8hjGsz+Hiq1KLV069cImCxpNs6Tu4Ydl4HP4GuGxhClP1mw1N5/51Vpq632sLwei
         ljn8pNe0sdB/2t773wUdTug0wF9LjkSm75rUm3TYOALmTq9lcqFhR4NvoW9/ow2KcSgn
         H8Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9UZqGAt9vcP6Casg1q/y8N9fPNa0kibaE3jFuHRlkwYSvbrwsX+Vx5tL062B7fzGVTqqNSOW3XmC96@vger.kernel.org
X-Gm-Message-State: AOJu0YwaruIA6NJD3aYxNwTu1UZ8JVCf6WT2DAjlw3+6g+FWg2duxJAa
	cqmZSVglP4EzSu4TPY0H2hXZtVABf5277skQ0K20OQr8lhXtzrrow7R7
X-Gm-Gg: Acq92OGQ+LMWHUwSqv13WTWcBfja4tboVrJXCAHEEQJgE5I2wSP6KrzD7Lh2WSEBjyH
	/PIO5gzKMYBtExRF8tZHElL8yG1ufapwgRtcgtX6MVmYgRnzgMCCZsiLNhUheNasgNvVny3yBRO
	67NupHcRYaLalPCXz9XI53lIfQL9YhIi0xjx6fFoGKPc0dBWusBoUOS5AlRezS2VI9gb34g1LLR
	P7VWFgIjSHSE7tQPJP/e+ewqm7uvKD/iRbu9iMHcoUYTDCYdk1X/qeo64wXtwHmFk9EQSU4d+Zl
	Zm20RiE5y69q0ezHePOwjOj6FrT1FlRBshZYjIDLVxWRGz6miEWnOGUXezh/9DFvW8f5tSTyA2s
	zhP4Gf2OWz0EftDGRqaNWE/AKvGC7kDmH3r9fYJebfpZr9fWkAwSimC9FWee4YjYkbQJG49UlEI
	THxxf/qhShNaGjEXKbvQ8lZYO2syQPaqROXQ==
X-Received: by 2002:a17:906:8a79:b0:bee:bcf6:6a23 with SMTP id a640c23a62f3a-bf3749d7f03mr231807166b.43.1780721883699;
        Fri, 05 Jun 2026 21:58:03 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:01 -0700 (PDT)
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
Subject: [PATCH v4 00/14] mfd: lm3533: convert to OF bindings, improve support
Date: Sat,  6 Jun 2026 07:57:24 +0300
Message-ID: <20260606045738.21050-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (14):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  mfd: lm3533: Remove extern from shared functions in the header
  mfd: lm3533: Pass only regmap and light sensor presence to child
    devices
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Switch sysfs_create_group() to device_add_group()
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
 drivers/iio/light/lm3533-als.c                | 179 ++++-----
 drivers/leds/leds-lm3533.c                    | 181 ++++++---
 drivers/mfd/lm3533-core.c                     | 365 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  27 +-
 drivers/video/backlight/lm3533_bl.c           | 223 ++++++-----
 include/linux/mfd/lm3533.h                    |  75 +---
 9 files changed, 806 insertions(+), 549 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.53.0

