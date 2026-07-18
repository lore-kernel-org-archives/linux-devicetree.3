Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147FC379EDF
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411815; cv=none; b=QyzTC1EPD4U4tfDAoPw1oCWYGUz1l81NqBXZ83sJMKCWCpYUsV4RZm0mbO/kZt2dCCVFkVv+1gjUzIq+oRk0lWkVV+H6dXzye6kFtNF+eC3OK4YepL3RC1qZ/aH8sXBex0uKAVM9f67matMzcgxIrQ7UCGLMXvYCH3ORu9e5P4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411815; c=relaxed/simple;
	bh=rzwO6KWzTXHWycRBHAGWS0dbS7KaZgmt4k1yCVLlY8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SO0JWc48ZDRUevr+CBEssO+pzAKMNl5wQGazZ1UpWaA71PbYFSnfr0O8gCrl0lYWmQhdarHybD1Yeosc10vN9acL6+FQ6dFbN2E0KmLsIULOOVvFrWwxI7MBwdtoc6MmQLE76+m9D74q740vTNzu2fXMBjtQlUwSMKDo5fizGy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frgKMBK3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frgKMBK3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c19bad03so66110905e9.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 14:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784411812; x=1785016612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9u5KL9RtfMSzVJ4pDX8HPR4lAEE6w6qofkrh2nVYcFI=;
        b=frgKMBK3F4/h1Xe7+pQ0UdV4lS7KT3WDlcQMBN6ugZkmgXdqpk5wDnKbvPPIPW4G7d
         7SBxDX3vKRtfAOY2/nY4zMPivGZY/gH8KJXXKhbLfS5JvSH9873IyCGUrP6Q9JF63L6e
         CTHpIDgmls57LzMRRlhd5PyU9oyke4PiDBWcoW7+kyqbujLiO5r+UBtynViMdTlTlmgd
         X1QtZCefvnQRKhrZyD8YKCsp7veCHbxlecqC4D4/z6ERxkmT/0gAlzJ3LAWITE3a6lOZ
         k4fVRvY5qspALLAQnGrMSjBnA0Lhk9GBr9ndCqs+3h3EPsJDDf8KfP7Fk4/VPm8zmHyv
         LHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784411812; x=1785016612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9u5KL9RtfMSzVJ4pDX8HPR4lAEE6w6qofkrh2nVYcFI=;
        b=KiUxti+yR4lbIYDDgsAp0AISXl1D5J79YHo/jDzO6AfHMpTEnL3Z2leOguQSAXpnfC
         iXudJjWf6Dtxcu7tM01NjYJutezW2oiVjjoMbqkk0fg8e4/Yid67/MwjUonBVKdbiMbL
         73YIfv7dnoAEOUIPKvJaxaDhWccKxmh6XMCglmEMyQbBnyCHSd936e0UysR4LiUQ24rt
         Pu8KWMNKYsUKYeKFWZ68JNYscseUO9Nx81UERb53uaO8BXH8qfO4iQSw3YAFw8QCI8PF
         rV9gzzIlUiKGaSU0rgMFX+4SvtlwQd3b1+vcNnJu5qxgFoeA+lzC8xWvres9Zv2OwKWm
         77nA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+b2iC4viZho4bQndp8MoKyOHO7nYShj6uz0SV4rd+4N2AFJR77OQM1mXhDHUBijlN9C9rq44DC4fD@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0OWb20yelhqGxikZRubzLC9VozCrFx5BGuTawmlDYoajvSX7
	B8AWrpGEy9fgQq/fhlpGETkBuMvP1ORqqn7A+A+iYQLdlPBw2gexv5F8
X-Gm-Gg: AfdE7cmA61jtNEvU3L9IC8Mqu0AuT0egIo5+rpKGjflYPGKIoiWn0ZyDCiU8aYx6SW1
	pIqIq2gTXI7wmQjaVHgquCw9Sneqs5TssHoG4xhfM6g0KVW/0LMKsDiJC8UtJAn/cwAqP+koLaU
	FeRn05MhaC2xa0HVOOVsTv6yDJYrU9Zp4Q8Qpu+sjWp20+bXWF84xgHpxXmu0Gv5o0E16OEf6Ba
	jsGxN4q90txZ8SPOeVspxFnpTOG5R1qcMfkGciaUv+eMqzTJIFOT5xGl07/yIC9gfbXU/FOntFg
	sUvOQyk5EHtbPN2FeSdunX9z4LPnfnh7Xe94IzFJgSjociswB6XLEgJACFBGoYd0fN/Dt038eiq
	N5FryPFtqhLrZdzzmHf01T/Bx1nHidcqH8zaBTVZbRblK6zyaWFAmbH412tnWrDZKIXRkoOY4+F
	wQGmOjCKkLRMY+1M48pPqqCNNauEI7jDlQsAV+AtTFKuMp
X-Received: by 2002:a05:600c:3b1b:b0:495:443b:1bbb with SMTP id 5b1f17b1804b1-4954a50c473mr78247845e9.25.1784411812179;
        Sat, 18 Jul 2026 14:56:52 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4954c0a81f7sm101199835e9.1.2026.07.18.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 14:56:51 -0700 (PDT)
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
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 0/3] dt-bindings: Convert TI TPS65217 to DT schema
Date: Sat, 18 Jul 2026 21:56:29 +0000
Message-ID: <20260718215632.3295049-1-egbostina@gmail.com>
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

Changes in v2:
- Set 'additionalProperties' to false and documented all child nodes
  ('regulators', 'charger', 'pwrbutton').
- Documented the 'interrupts', 'interrupt-controller', '#interrupt-cells'
  and 'ti,pmic-shutdown-controller' properties.
- Dropped 'isink-en' from the schema. It is not read by any driver, so it
  is now removed from am335x-guardian.dts instead.
- Added the power button conversion and referenced it from
  the leds schema.

Eduard Bostina (3):
  ARM: dts: ti: am335x-guardian: Drop unused isink-en property
  dt-bindings: input: Convert TI TPS65217 power button to DT schema
  dt-bindings: leds: backlight: Convert TPS65217 to DT schema

 .../bindings/input/ti,tps65217-pwrbutton.yaml |  42 ++++++
 .../bindings/input/tps65218-pwrbutton.txt     |  30 -----
 .../bindings/leds/backlight/ti,tps65217.yaml  | 123 ++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     |  27 ----
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts |   3 -
 5 files changed, 165 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt

-- 
2.43.0

