Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719CB3655D9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632908; cv=none; b=cK8kzR2LxdCLwDeJqyHV6QhNaYPFE/ZKng7FQI0fip/HQQ6WbMCPZUh5xU/jO1t3W+mcs7rVOegDZ5F/hlXGKQhsxBYOHmao00T5cXK5dNOkWGBrl0mfhtiRGdhtHR2D6EEgWsRdU4pQTkffIa7zI56d8KrGNJ7NobJfbbVqN/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632908; c=relaxed/simple;
	bh=LjMm0PBKh/Bx+amzkvhuyIeZuvgi3gtmnabaArRttWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWwnOHrh7hPdrGtmRNb2sP4P/rZXATSMRF64i2KO9GHg419lJF5T28cbim5oOGPfjSBh1FmmPGisJHca5p6ZPuJkHaRqNg8ggEtemeekXFXPk+lUKNQmh/ZAA0Ihb9XU+mVsPebvM0tjQvHhqPz8FKllaHoQbXmwOu7QsKASeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuiw0QoH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuiw0QoH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so26160555e9.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784632905; x=1785237705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2+LKseJXzKxktbUWoc1WNBTZXl1F3xYy2w48c5tdQY=;
        b=kuiw0QoHi8Zx+wZjfBeqtNiwArvcCHxpM/BijsuDWkLzdkpqLsQxbrsG8rGlqhKTmK
         qkxxN4PXkd6GLz23JPBxmsmaDoFIUHsmndpfnTvgY/wTS+FA8XAWz3q6GylsEVvS75hc
         pvw7VpJ0Jz7rTwX05aU8SpA+pVLackhWi81/I69irt/rglgkeBYzSjsAtLwDa20lIZib
         48RvdYeZX4Cw2ZJNR5h9qQLHLAwt8ryixzfmO259CNHXF3XD5F1EgHQcQ4V5GT2cDso9
         IdGBiTNP0xavNjIRfV/uTBPz7k1lpXMe35NbjL3wSw9ODGLSHSHivyNa9AmZ5b67e4IF
         ShEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632905; x=1785237705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2+LKseJXzKxktbUWoc1WNBTZXl1F3xYy2w48c5tdQY=;
        b=FCEpYRqvF44BFdOOtNIWy1TrzOwogfV5qlAAKyefrKIbP8X2hEinGGAJD0RxD6NJH0
         rR1pUF1JOFitGFKaMSEEqkACIcW4w9oQU3J2Cb9H01lV6Wq9iAYs8MtWIXCAXvOQb90R
         nSAbeqw//mrcIZe1xtbGXkDvNSmuVGrL71jX/LBHKFC9ITGh6Ly8m21R+VyG0A00upvs
         lWWiYmQnbmYBCvS2HC3g3HMZdb1lteuus/YIplRjtvJ/HPRuh3fK4g6ReD+qMBnp1Xe0
         sq5eVthoYRjXtO+Ey2j4dAkQ67lkAJICAcTeeQQ8TaMIf6YrWNJ7ymw/SkIXWqvOZ5o1
         h6TQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYVMEgVG0E8DlpxuMQ30qKqcYhc0ro6UCqYmKUR1E1ndQ1cZ9m3lEkEAyyas8F2ZhMGuKM75MklP7o@vger.kernel.org
X-Gm-Message-State: AOJu0YxLz7Ac525wD7J2xVedO0yp7bpwFrE3lk+an5vVpW8wZdZWN2Ef
	xCjo1wzN6aDfOyR5KD/Y1VW3dwk1SBreHHjEvguXpNgkJ86ktJwXLGn/
X-Gm-Gg: AfdE7cm3pHElWS+a3wbWsfBu9u2xI4M1N2+wq9Ulqgwaw8pICtq4hnHx5mM8mgjf1Uj
	+9JzCE69WTe32qR/VnBfn26vLWd5wPEEMwmeCiMKqHsFPlToPLZo7vAHQ3Ih1Eqs2+AkorajqfT
	cNzq3UN+SzocypUlStf1yTjliRqbRdeZFKK747ieBjxQsiNGSClYkre42tTDx67OcVBzmFHmzXf
	SkCupA4WQ0IiGLlGyCCWvpF08IylxmJKewMZ65ijuMW09/sgqjpKAOWn7nmMOQuxD4kBVkJbhaJ
	7+jJLTmXAediz51n2v/ftUfDGUxjm8BHx/wgm6f0KVH3Iihy9f+wAPYm0ECKFkMpDM25wBmda+u
	qlhitFMdUjyDe0faAfOTn3gmltLmXV+LMMX3uKuy48BL5NgSYck+1tj30BFPABE7EaPLhqWaakG
	eIEEs4h4qmaIRlzwU0DU0ehRcjP8AGzbiV93yHnK0WXJpB
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-4954a3d09c8mr194922355e9.3.1784632904451;
        Tue, 21 Jul 2026 04:21:44 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm40232416f8f.5.2026.07.21.04.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:21:43 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Mark Jackson <mpfj@newflow.co.uk>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v3 0/4] dt-bindings: Convert TI TPS65217 to DT schema
Date: Tue, 21 Jul 2026 11:21:24 +0000
Message-ID: <20260721112133.70382-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Texas Instruments TPS65217 PMIC bindings to DT
schema.

Changes in v3:
- Added 'unevaluatedProperties' to the 'charger' and 'pwrbutton' nodes.
- Renamed the example node to 'pmic@24' and added the rest of the
  properties and nodes to it.
- Dropped 'regulator-compatible' from the schema. The property is
  deprecated, so the regulator nodes are now named after the strings the
  driver matches on and the DTS is updated accordingly.

Link to v2:
https://lore.kernel.org/all/20260718215632.3295049-1-egbostina@gmail.com/

Eduard Bostina (4):
  ARM: dts: ti: am335x-guardian: Drop unused isink-en property
  ARM: dts: Rename the TPS65217 regulator nodes
  dt-bindings: input: Convert TI TPS65217 power button to DT schema
  dt-bindings: leds: backlight: Convert TPS65217 to DT schema

 .../bindings/input/ti,tps65217-pwrbutton.yaml |  42 +++++
 .../bindings/input/tps65218-pwrbutton.txt     |  30 ----
 .../bindings/leds/backlight/ti,tps65217.yaml  | 170 ++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     |  27 ---
 .../boot/dts/ti/omap/am335x-bone-common.dtsi  |  14 +-
 .../arm/boot/dts/ti/omap/am335x-chilisom.dtsi |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts |  17 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  14 +-
 .../dts/ti/omap/am335x-osd335x-common.dtsi    |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts   |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts      |  31 +---
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts     |  14 +-
 arch/arm/boot/dts/tps65217.dtsi               |  31 +---
 13 files changed, 275 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt

-- 
2.43.0

