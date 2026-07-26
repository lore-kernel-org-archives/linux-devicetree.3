Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F217928642B
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097018; cv=none; b=quw6/2k4JcO7SBumFwRLv61FmezMi5foU9S560bcGrGYbU2xNMUj4UiOGtyNSSEaJUX8Kvlpar5tsOEoxBYXxgLJeBIebjfUUuBxxhAlfldVftMYinCmqQALhFq072FBp/T0vENXJogAGCUMIBBAuOABoKOpIWKYnuFpvy1MKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097018; c=relaxed/simple;
	bh=QYEU3+jzo7+Ik7U0bUUsoabjOfSHWOD0/27GtMiJV3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKgf2PWJsENNZoQ1qgPMqR1kEa/uGLwagm67+x6bohLWVN4eP3lkhpy8je9rdRXAIlbma2cytOOz2joiaWeQHb0VvPXDQsZquM17V+VMSXevvOTcw5H21qwLy0r4dKsmbTcQWRJjC6myDgmvUIPvhyKDp9fMOpVZ0r2btYPi4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD4Fb1NR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD4Fb1NR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1349243f8f.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097013; x=1785701813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=;
        b=HD4Fb1NR+LdPlJ9T4/s0RUBE3SiVn12RmSq5dXtPfVqGydQX/C6zNJ2ecHxcvsvhPj
         ZVibvoIo/fVpIVMeeFha9O+EJNY1JR9fZIY+hDErhq1WrqyX3G/DR+AxxzswLlEqFM/u
         Dgp0MXUh5M1GEKJGdLsfyepGByyFX21Gx/7Pl/ro9SbVPun5rU23Xi2wg4ONgqDX432l
         J4yIOfNyLmxWJGxTFuM2jFQj1NUk5npoZNqm5aQgvw0QxkoNsGFR+mY7YRvG8DBe2nex
         TmFmO6SvppTvHDyeR7uWW5WPSSSM/8bOWNHu6qSO3M4ac0j1MJGhTtgn7P7EZ7HDxm11
         l3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097013; x=1785701813;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=;
        b=ErRAlaEyCZiuZX9g4DColUbdb4bW2Bl1SCUqQYft2WsgsgDu//Mlql/ActGAtNbHRB
         a4UlomA9b7CklLrrWX2vfrLXT5Dd7F1So6DSgcIjFyx5wt6p3TL8aSZPtXLcL+qFj+EQ
         GQYobVrTdezlIAcamtkGveuN69f4b8prq1mCEGtyZV68Pfnf78XInDsLXorpzpY6uyA2
         5uIYvMkyFQcRdU1QSEiFrbg+xMWa0+PemBFShqt3UHLOVVHX/0TQhZ+9cLvP0LthwuhV
         r0rxl02bw/bybcJ5NlNzKFTjAMLUvGI2PUqysy1l6qCR1b0j9iRky4vh8xPClyCgm31g
         w1Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6CZlBSdknhnKF4tEF+wh5Ym5nQnGaQHE7gpKP9OaLCZMdBI0oC8B+W4UT72wkshpMDQL3nkulufwJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1Z6lzYFNhTdHGhd3+7A+eILI93vIUouAPg7ba3N7IfhYVabm
	hAGSn7dN+15qLuIuaSjj4JkuQvP2MJmyEgkscx18oe2AvQLHn0SNcuVa
X-Gm-Gg: AR+sD12Eur0PjKZkaDc7WvkgreqnYGGelPAimUKa7/aE/0jRLjXW48oDIPY8BKnDUTQ
	Xt3tZv1WBeyLiEeSOs1bBFfflrb1+MtJe14O2dOqfl/IT0CI/Pe31TQV8QZoTgQuG3GP8vHUM+J
	mVN3HhxvNmEUCcnz7dJS/bOaiO//NDk6dOLpYK969c83r3P00oDYkZZJVxihtjw5mcpizWZ1Gg7
	DHis/Tf1Y1A7iP7RSE8DIeNZSesuKTVipZvNAmRAkHw0NqDdL98XXfdjkQr4S/wi4gvppGcUa7r
	9YROfVtJL31LIeeqhQe49/jDdj43fKG1Ffq1+0IhzC2NZMxhqHmQT3PUzQWnL7pWKZ9viHBFdcD
	852JCbRJ2UVrwYqZrwl/ZKvv2FjcLeKPF3WF27zpM+4KZd4lSyn6ywa3cM8N9bLUW6a7+zFClMq
	GZ4uQNCxtjgqz0uW73juLOfgvcs9Sux+W9EKxoGA==
X-Received: by 2002:a05:6000:1ac9:b0:47f:8f5d:182 with SMTP id ffacd0b85a97d-47f9feba3c7mr8328950f8f.61.1785097013209;
        Sun, 26 Jul 2026 13:16:53 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:52 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 22:16:44 +0200
Message-ID: <20260726201647.264108-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0
