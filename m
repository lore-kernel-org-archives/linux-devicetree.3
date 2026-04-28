Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7B39B96B
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376385; cv=none; b=sufYX3W/ujnR2Y9bpGM3a7JETB3OjRwY8WNxEaIvdR8oOjtA8RvjATC6Dj2qlufq/8XdbBkFvYRzU+9YRDqCiRct0Yicv+HWnhW6jYdjcvAlgIPxse9GCXkRKGoK1N8hLBfZCsOo9v9aznq2d51+9z4bx8BLsIhHi8bp7tJ0hHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376385; c=relaxed/simple;
	bh=ChWMw65YeqyD9gfaeuIOb4XlYPRZm/Y8ECdjzkRmwoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dXkd8ESd3R89+NLlB2wbDFpQt2xydTSTuZjG3JNuZgSEFULTkvsrcMdbARWQOjRN5hafW73BXyRE01mlakWnqtM4hhaK7EFtsIkjN4Ax0DDSTmV8Fzpa4Iv1VUSLBApPOGlRWw+tOCHpDDhIIXxyj7tE3E9Zki7CYZphCnQBqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG4v3/aU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG4v3/aU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso156723795e9.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376381; x=1777981181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4Fqk/R7geVowzIprCM3rErGlNesJ0AlVjHBY7TpeaE=;
        b=rG4v3/aUIXvGwPYBlUYjxlU5o4Dns+P1LGRe33Y+ufEftu3TjqbsaGig9hy1dDvn68
         XgsvZWoTpP+g7HUyDRSnNee7063RNlZpqo1CyZEFOTkSnlTI4qFAutQftKCgRhGOXYXq
         aSBeqw6HNz2dA4HM48dEhdfx0QZTOy/D+1bkRXsqYtG3ED+iPJiiZW4rOMBNHuORs/0Q
         XfVo6jKfhE8XlnM/vcgoU3BaER77NeRBO0FZa14ipPaXt/nJzjHxxXpq6mgJ7FCsSNLZ
         RCv/OB9tRhaZulMBiN3LnfNfB3U7SgKgu9TRf/hnyyMcG1T5YwiOudB4DtGdzbbCZUXg
         XdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376381; x=1777981181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4Fqk/R7geVowzIprCM3rErGlNesJ0AlVjHBY7TpeaE=;
        b=BBbdKk6XAmoZxXfYWsquEvkLXnhx0Fu5/tJCpxXiYx8F3LRrYW//1LI/OPI0BnNqRT
         zZLcvffR93COlr4XTdBiP+KE+Mo6uedC0p35AGCGasWT31jGLlTsyoAFAGBjrnuWDXTl
         K8W+w/iNSpjGQaoLCtebaTr5kWp+Gt3nG3c6oGhLMRdt45SaCcFUKHd+Ppzpd176f7Pv
         0GexIcnyEhnVvooOjX88E8JPbcs9uSM+T/t690mG58LO4PYhW+m8kQceNCsim038oreR
         mCEuvwo/Ut1iO/6ClcSraU+t5d1goOUuhYGBWKRwIuP4rQrBjxbidL6fDdHtBlnRVTml
         0KCw==
X-Forwarded-Encrypted: i=1; AFNElJ/tH1JyBRfewiGkqmhOwRTT/GAaqlfaal4dxP1vfYs1phWJopE0XGmAa+01H0pYb/bB8U9M4Vec6c+X@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrEuR9f7FyGpLN+bj9lenHFD+piMWVbfcm7fH9bpf/7Uig0u2
	nxvTSjnvt4J2S2GHhFAHXBqcbVR9YRkDCSykcwbsMdvqkxAik4crmLHBiMCNkPzU
X-Gm-Gg: AeBDies1eQKll5Bp3CKevNNzoEkayB57FuvuzF/ITBiIyoGgkb1FO5nKSFV4HJZcUZb
	Q8swq8s2V9Ta3or7qES6sOpESKhu7KRQ9kKevauA6yRxj840deaQ58EZOXz6fqGUyv44l38jRyd
	DE0+5iLSTAJpQoFnvYMEpkHmCXVI5Cd7UfTx06h1vP8jDXsXRMxZwh4Qk4XWNmcmNeTStXzWZPB
	hOMw9i4yvyOuOvwn3DHgofIX4OCFiQYAZI/LYdL0ACgCZeQIMKjZd2sO0lFXh759RoQEhsHUc8L
	//O48hKCtBURqevRX6IoSeLQvZYwLmHDBSfLN/wlGelphNwD+499mXLOuIa4LMsDecZaVtLBfiT
	tquceJe+w7nae8rrvkAOYud/FEL/rZ9R5eMLaE8uq7CxW43RnsbshILas+vXgfGSHdB/9i72nDB
	Y1XGq4MwgEmPlY13DW8Ywz1c8=
X-Received: by 2002:a05:600c:3b15:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48a77ae5412mr47540115e9.4.1777376380816;
        Tue, 28 Apr 2026 04:39:40 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/5] media: lm3560: convert to use OF bindings
Date: Tue, 28 Apr 2026 14:39:17 +0300
Message-ID: <20260428113923.112920-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v4:
- fixed current being off by 10 in schema
- label property from schema replaced with modern equivalents
- lm3560_init_device moved before subdev registration
- v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
- added subdevice cleanup if second led registration fails
- added check if "reg" property exists for LED nodes
- added missing fwnode_handle_put if device loop fails
- added bitmap to monitor configured LED id
- added pm_ptr() macro for PM operations pointer

Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (5):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 133 +++++++++
 drivers/media/i2c/lm3560.c                    | 273 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 -
 3 files changed, 354 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0

