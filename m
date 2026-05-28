Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91795282F31
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976311; cv=none; b=ZLzuV4elg+Gthi6pZc0Ft02bkW562sL4U1yhlsC0xuwkCJcB0u0ufwZgnqjkMv4z39qKS1Tlb6n/3O0TsgriWprzq7y3txV8D8zl7UI9Ki7Vv795v/WBpkYvLPqng5l8tcU4dGNQYSh7agXjNcGNc0i9dGFs5p2z59OEwZuZ+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976311; c=relaxed/simple;
	bh=nPvrywprKqXAHSVzS2cZuwfCIpnN+xuVhyNHb3N1fMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TrgL7SEHJSvgioIKk2a1KUNh4QqvRdGkzKgiP4iUIfHxzv+Vjf/yqCDfDjtKvYQj0tHCVNFPaNw2/oAgKA3PuaVHLpi3hEyOBx8YXKsmJU6BSud/JXZb4A9JPO8IRV/DdLqqOveLICwOnaOzdZ4rPsdXqD7c3m9sbLzKuiC80BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOGhyKpH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOGhyKpH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso15838759a12.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976308; x=1780581108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSg6ryVfD5S41bWs4eS7vIgEWozL5e55NM5iPpo1Yvg=;
        b=iOGhyKpHC28LAcS2hK0z0cg+fqFV7cQWqqCDG9ZjfCZbksbp5zEtWwVuEFsNw/jXZP
         m+xbPLF33xKbSL2qQQhJ7XLHIaChXSOAZUjMXP4Iq0cu/samZ0hqy+SwreZal87pMIXl
         gvCd3h6vFiNeh47NByA0Qp2bhq00rnb78EWj7N7ITvWgtwLmvCTN9d6VLY/uLh5vLCPT
         bVLSKOdK4TnoU9c4HgR30+n0AyRV8BwM18fLA7ITovJ7YQDe8kw9Os2KdMYuJZI44NXb
         ddb7wRCvVX/O8FvCsQnUpvhbPwe8XwyM+7hSiNAhJYQGhl3369WUC9i+HLsf/i0lJNcq
         zYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976308; x=1780581108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSg6ryVfD5S41bWs4eS7vIgEWozL5e55NM5iPpo1Yvg=;
        b=BwMnaDHgtyRMbWIxjxf1VHxAnsTdaxXqGB2NiM2eb5amR1giQCyKWs/w8Mx4vO21Ug
         U1UhE4c2Y0S9sM0CFDhqEijpfgKRon1xiQgQW9xs2Yw9xrXw6cOQm+l22DtmJCht6H0R
         ICQFzre5N8teufZNmtD1LXjzn8Ht69zGS0fgE0IhTAcLfmCXoje+xqjsCxwZ2MerdZ8q
         crAnZFCDUtmvxnNgPJ3fUyTkrmnb1zTxpEN62ijrToY8/DxLHFqGTJe+A3xqi1SJP2Th
         hP9mZEhQweEFbdgoyIQNiFhxH4LfyMbwS/L720rwE7aFdft+bODPZPk9tPkV2E7SmukY
         XNEg==
X-Forwarded-Encrypted: i=1; AFNElJ9cDOqsl/t7CAgRq3ySSOC0DyWw+gapOJFxuyuZ2TRsMdsySku1OebX2/sW5cRbTO9kDzmd7oDWDC7t@vger.kernel.org
X-Gm-Message-State: AOJu0YxYiWy55b8Q7SxLghjqrnjvEHRF0kM7xy5DGuRBxOBtgrnyDoy7
	Y+xiP0WW6kUB+sa2/L+FYtvrvehStYXHeeUir9SmKBIBQAPyTjNGI1hp
X-Gm-Gg: Acq92OGNain8Xa+p6kHBuTZtNKggaMATcx5lU80ZyssXOQa9W76LklN9OWYH7XApHC/
	73+dOLyYSSla6r+VozYHyHaSowZGXvHQXkQr1mFR5fRfCObJPGNeswWUP9XWOMZNCqsl18nrOMr
	ayLdR8hX+D7IUcujnz1hgaiM7U/rbCS2ehZaegrtFAS6DoBoocpAoe5c50MMfIGzr5JyZT2syVo
	QH8eCqEyvHhOC9jfk34EYoZ0AUafghhQdVVlgCsyyIInVIqqx1WdR7rdjHVTompIPLFGeptRx8Y
	GqsYyV8m0ie6BkvXLCOr32qDcLNCyJ1mJqOb6aNGf6DV8YtVUGm2XZH247CJKzp3hl453n3GxeB
	FyGdVrhet/1B6zAI4zg0jzyN7j+G5Ag8MAsXfxEs/80QwfHTcAZ/vY59dzwKGRAU3AGSZwNnD3M
	w2gt+TPw2Xp0enmwuyLGDUr3Hv2aSARO/e6g==
X-Received: by 2002:a17:906:30c5:b0:bdd:90b8:e397 with SMTP id a640c23a62f3a-bdd90b8ec51mr1173734966b.4.1779976307812;
        Thu, 28 May 2026 06:51:47 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65da3bbsm723636566b.52.2026.05.28.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:47 -0700 (PDT)
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
Subject: [PATCH v2 0/6] mfd: lm3533: convert to OF bindings, improve support
Date: Thu, 28 May 2026 16:51:17 +0300
Message-ID: <20260528135123.103745-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: Set DMA mask
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  68 ++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  66 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++
 drivers/iio/light/lm3533-als.c                |  95 +++---
 drivers/leds/leds-lm3533.c                    | 108 +++++--
 drivers/mfd/lm3533-core.c                     | 291 +++++++-----------
 drivers/video/backlight/lm3533_bl.c           | 127 ++++++--
 include/linux/mfd/lm3533.h                    |  53 +---
 8 files changed, 653 insertions(+), 325 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.51.0

