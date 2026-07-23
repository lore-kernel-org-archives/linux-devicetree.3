Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5F4437463
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801179; cv=none; b=UiDDW+UMBj5ozzyfLjI9Rgm6dLKSE+4o2tEwV+AAC8Ibsbldo26oGvjrBYlkAqgPKsRll9eFzdXyRF9DUctkFjYQXTeh5ySvENCGMu85FkxkJoaouxssAy7VaK5wxzalvK7I4uPmvU7kowWZgIKmiuABJuvJLyMJtghMz8v+l+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801179; c=relaxed/simple;
	bh=+Wyfo2vtIbswyXq9efM7rosBVsTJwzmKdaBzzC/aYRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncPiMh8HjDDpAnL2RTtwPngT7/HoxBo68AXGhg8PEIzrRMGDqRv0Dq/mghCAxMoh0/j/Jld1yPkzuENh4iulPOsk465ggY4dcYmV4fW0YFDo17SY/ANiaIyzmzmd5q0xBbv9TmqXGLKr6p8nTKTQ6sfu+WnJlHN2jIw3OjYNh5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXwYL5Cp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXwYL5Cp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso5205485e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801176; x=1785405976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcGqlv2rED4NMS/3uzjzLmpezgSMOIuZyea8FmG7iIE=;
        b=FXwYL5CpobBGYaEXcsi7sfU/6zrVN+9MWYNCWa0tCT18D4dDmbXrVK5NqH0gOsWfCe
         TrFl0WWlwGXcPvIK8yWyaUTM6alsB06ngOdyMJJYnhiybARvXq1MyS7QIXhveZPHIPCH
         SfPLk2lk2XWkzMq806Cru7wBi8yLywO+i+Crk5TwdRwRUPJ3jDTOKfUCe1tqEuCmIPcQ
         u53zSiyYtRvDPkwxUQ64OV6pjw2IedJVh5EZHucUAULDCYp0AKU94k0bq0xF1TYn5b14
         7r7wd+CMhTXXhJiXQV/KP0JFKzwRwg4eTflMaxb6p3WO6oTwu9kka5mdNgtqPURVXmV9
         6F1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801176; x=1785405976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcGqlv2rED4NMS/3uzjzLmpezgSMOIuZyea8FmG7iIE=;
        b=oCy6M88OII0tUT3fb0SXq/7WpYNSEQAqiGHmdxQsl4oLeNwz5QxVuHF9E1q9xdXxxT
         tI1erYHwWDXthsgFizbz3I/hydagpEk76pP4nEpEo+MMLr0fXZvPPoWx/ItpV3S3s1Wh
         j0te67+1gPZ3GaKBMj80btFZAmwpRLgv3dl8EdBrUGI2kK8yr2AMo6+ojyubyaRc0zk4
         8z0g+6tHkM0w8REduN08KuNqohpnvzJ1ZS8XkPYCjnvLLQ96/LjO3HWMjcwzM0MCtUk0
         nHQ+Lpwj7OgOqQ1vJBlg8kg80RXMalq7kiNwreWXPJF1NFSkbIUKkFasP/PEiUH+4RKe
         lnGw==
X-Forwarded-Encrypted: i=1; AHgh+RrQLEiweh1uHIS9vZKf8LcJX9a3/eVRNMwQ4orlOqwnl7A/6mBUO94OVg6OPOSSvm7XB/XJjRON9QCk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnsqkkupbhyb3LTPWEA1o9SV7IJBpaZIpbEnv4+PgdP32h9gcb
	GNn9VckVNowNFEcwbXXwGTn/ThI3ePjQjOBvfra4zqJPjrVjP193cM0s
X-Gm-Gg: AR+sD11TAb0h1+woF7xnmRlEhqcdNS+ZW5lNoBvQ3VZVWJEgs6HwhldW2Rb+o1yQdcv
	VFIT4MPmmrSn3kZJyypxBZdgr73wu2+56awxhSJwFfoRt5yt0tNVlWikF08HaMQzRPThgEZoEFC
	pKkHFPf3HCxF2/644zgsfHfzGuMUKIfuMuSCwIhKHPi8xRBZYFPKRI/dXzJxNLet6rlLW3PbtI1
	u39Yj7Hd7v6SexOzA1jBIXxCbRq5tahA1C8oQiuh/mI/W2bgyvv6JfFcP2f+8D/3z6/mao0njIh
	7gzTMeAbED8ETzs8XKg2/7mz+lHaHqSKdPbnqD9ryQbn69Eku4DFToMFZHuMmS9uh/Fd8RHR/uN
	IJpbnme8cnaOAsKoE/7MQXDrnsykzkI95v9wSy09EEVWR75MhdM0iyrsgS+l15nkHGRGyjRpD9p
	L/NXFBxi9RlNNkTmZWPMB5IqDJDqKFwX5/dKvGs70betGG
X-Received: by 2002:a05:600c:1914:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-49573ccb598mr27399575e9.12.1784801175908;
        Thu, 23 Jul 2026 03:06:15 -0700 (PDT)
Received: from localhost.localdomain ([86.126.27.145])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm14212163f8f.3.2026.07.23.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:06:15 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Mark Jackson <mpfj@newflow.co.uk>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v4 0/4] dt-bindings: Convert TI TPS65217 to DT schema
Date: Thu, 23 Jul 2026 10:05:58 +0000
Message-ID: <20260723100605.628882-1-egbostina@gmail.com>
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

Changes in v4:
- Removed the regulator/tps65217.txt binding. It documented the same
  'ti,tps65217' compatible and is now fully covered by the new schema.

Link to v3:
https://lore.kernel.org/all/20260721112133.70382-1-egbostina@gmail.com/

The binding covers the whole PMIC, so leds/backlight/ may not be the best
location. I can move it to mfd/ or regulator/ if preferred.

Eduard Bostina (4):
  ARM: dts: ti: am335x-guardian: Drop unused isink-en property
  ARM: dts: Rename the TPS65217 regulator nodes
  dt-bindings: input: Convert TI TPS65217 power button to DT schema
  dt-bindings: leds: backlight: Convert TPS65217 to DT schema

 .../bindings/input/ti,tps65217-pwrbutton.yaml |  42 +++++
 .../bindings/input/tps65218-pwrbutton.txt     |  30 ----
 .../bindings/leds/backlight/ti,tps65217.yaml  | 170 ++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     |  27 ---
 .../bindings/regulator/tps65217.txt           |  78 --------
 .../boot/dts/ti/omap/am335x-bone-common.dtsi  |  14 +-
 .../arm/boot/dts/ti/omap/am335x-chilisom.dtsi |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts |  17 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  14 +-
 .../dts/ti/omap/am335x-osd335x-common.dtsi    |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts   |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts      |  31 +---
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts     |  14 +-
 arch/arm/boot/dts/tps65217.dtsi               |  31 +---
 14 files changed, 275 insertions(+), 235 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/tps65217.txt

-- 
2.43.0

