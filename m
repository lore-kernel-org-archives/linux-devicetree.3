Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FA358D14
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015373; cv=none; b=F6gH/i5ZZ2l3Vx4OsLNJ4PXTbWR5FhRwnMOMwUMLdmpnNdYMsFZlCc/ooRC3UBXH/b9x2sBBoHPPrjCcZ2lGZaFrhibkOJ9/+OdzJTbF7jEPKNVPbCN/DAFrmyf1mG4cqJarmtyV2wMG90pWIj/vh0fRsgfUM0hTTflAzZMTD3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015373; c=relaxed/simple;
	bh=LGgBuPl13OVCqY6MyycN+/CmKgvRl/RP9kAEoA1MlxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALozXva1Qr/wNaNvdiFzIffJHo4IUbk/EyPuBmyGN8k3QOpqvW5kEGhL6yL2Rx7m2xmdyU3Yu/whijGk6KYFASroR4gCReWGm+dmfLi8JXOgc5Ys/g6QeQ/OVdaoB4NXqF7Otmz39RuMrIli3nuW0u8VYOVCLGzzD2lWSWJ7/T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm7tURmI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm7tURmI"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso6569294e87.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015369; x=1777620169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTQRz/Y/73N4N7zfobml6VuwnylLNpcaq2f4fU14Mdk=;
        b=Bm7tURmI9YwYmJIF4TJ+BX+QeVrvXQ7yMqwqeCh7Vhs3SO/AOFpCsGgUWLFLxVk0UM
         br0pJNhlRH3GTyGWjvvsQTTDR4azRgvFosiQJaBCpIWKOlvYL48wZEBfO7K/krR9vwTg
         vajxqXhPEQATW+rxWojHu+F5Ezl5qX1fzJQSLCuzXJTR82QDFdJ/Ks+i8OIWNsyMlsMa
         /dbktNb6rjii4z4yZY7GL6IiJD743HiUu/Fl/zTQZE5qdScUqXVfXn4Moqu8LQI/FCRY
         o1808CqS194iXwkBAXsuclBvL2zf5i6FnwkCYwFBXbqWRhYz/qajEpeIzB+PBJ9IWRe0
         AHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015369; x=1777620169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTQRz/Y/73N4N7zfobml6VuwnylLNpcaq2f4fU14Mdk=;
        b=s3KfDIIluee1IEboPat9v8LWUbirfGzYWGhdUfQRLVMyBbN5A5RTluseh5oWFgVwug
         kiNNn7/rAavZesLcEkVbQUu5ZAHJNFE+z+uVx1zQEYRhvWeYlpRQMdvwA9/BGLRenEoL
         DkCifM3X1l5r6+D9G+iUew7LjW/jqxrjsRnSuTZoh51z+pek/uRtb1pMk8rm9csOM5oV
         Ioy1+kTNU0VtcW6v3Fr1BfqqB7xOTmwX62aQyJ668JHDuV8gDe8jJcw6igQSKODLeC6U
         1QSmQKbeN3QEfXyF3hswfAZmnQZoE1y31/64MPeOHfnb17sLvlVpy4qP6ipIqLajyGPR
         cq4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/XdUsRBFtRM5b02nFe6/OcIfqQph/yd88zD2khjPewUXHjd4sTO9Q+qSRntUDfzOP2B/0/1RZzhQFo@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXB2yE1ZxaXFeVSqNOKzWJHv+YUMJOe8LE6Yo+NweZAb5vbzk
	pCxW90OoYvQDme7yEOmPgd8wKU97yNbk1FXUYQJg/d4L0p/T/LfN5mA9
X-Gm-Gg: AeBDiesQMCk3wQJnhl7VPTSuQaHjT1dRiYsgHGNJ49ak/oYBtDkQwGDUbZcDFwBiYUx
	8PhNDt8FLZEAjBSc/w7VJzuCfP6s3J783ru+ye+iLi4gUMoya/P1DIVC4eo/2CJ0ZrV5WOmaSc6
	VhLlyOQE6Y3qQSShEsnuABTUmY0CKuXVvFDEsE0JjloPhBf5r3ogYZjG3m5BOx+5muk1UvGv7zx
	uQKgBhYSlj+XchcxUdoKBP8G5+9QSxG3/uM7w4+96vzw6k3Dp4LfpcII8zu79c0jbj+g4CZeEde
	L74ZfISN9w3IYyqmlx5asm6zi9owBe+vSEWVvFWwNnjeSq6uKx/vsJDxa82N4++GBNTq3+ehzhD
	36v1Vvq3plxDxTacP5nOBhs54ChQMLqI4Usz1bXgiHJ+2LoTjTc+d8V8/Cadt04qYef1OYAxAlD
	HcVA/nS1YwqxrP4dRQvtuVIMU1cLIg4BzJRQ==
X-Received: by 2002:a05:6512:33d6:b0:5a2:c05c:1141 with SMTP id 2adb3069b0e04-5a4172b749emr10164473e87.4.1777015368566;
        Fri, 24 Apr 2026 00:22:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:48 -0700 (PDT)
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
Subject: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
Date: Fri, 24 Apr 2026 10:22:25 +0300
Message-ID: <20260424072230.90354-1-clamor95@gmail.com>
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

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
 drivers/media/i2c/lm3560.c                    | 250 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 --
 3 files changed, 328 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0

