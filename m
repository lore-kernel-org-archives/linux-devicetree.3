Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227011;
	b=lMAI3s9Q58oizYC2v6b1hFrQcyxMhU3nR0xQaGwwhtSg4l61dV3wah9Vw0NQ0wNoOg7t
	 Ce9tojNxSnNny7+2KGwx7bY2/NClYtyTEBMGOhB05J0gN04+A2Mvm08YKTyJr4ZURh1Iz
	 D5k4ul6L7OkcHgejx2guy5D8/f6wuFqyNW1tDI3w0jYVmq3ETVPMXhzMWEjWMCVjp/xvy
	 oJbgY2jFPWG0q4wB2T8bMA6byPYtCKOqbtk91m16Sv16O4l6WPtxsBNDLfxf1rARzfB8o
	 3IrGdmEMXAytP9LCKVe9nbXGbnm2gW1r2d++fLoT5ov8K0/X5/LGRmIAWIeBlTYK4XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
	b=m5sA5K1Zm6eUqEcqf/nGylSv8JzjrwDHeV3fy6hdy7SvnkYIO0adl4jEDGQxqarnyEm2
	 piW/EVuQPA/od4LITRz68pcWunWa/vJijgoy+swC8IAsybp8YDj4zy475PCyLFSUiNmTf
	 Az1D5sy7a9un9VQVUn1NkUBDIWJgNrVEtXEUikiOESA0sQSnOJ2DU+i9hDdFmURPJ1qg1
	 /HmEDWwWWMrdQeew5jYCdF83nU83pIYHqiuINrtxObyoC/t86dMbhlnz/+9h7zDvlTZFH
	 HeSnRSuc7ft/sDQNk+sdG4D+nqVO6BANN9UIaDSTxaRfF4+7bUaE8kVls4eRASYpyBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IQPPiYe4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2693606A334
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2693606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IQPPiYe4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso5267685e9.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227007; x=1794831807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=IQPPiYe4Vvg4tPUs4hQLCNmBmxCormCUnErojoV8mIYdMz7Fh40q0YB/vRKoQWuaiW
         z2y60I15oNhZcye7JSwwK4ocm5HQGJmv9JNfpUPSQ4P+ZjHpA9kXNq8Y7pprjWrhB1uG
         jV912PaVz6ar7FLDI8Tnf/xD7RPSqbeuVVThryh9QSrS+1V03EHW7v1kyuC8dR6P2/gk
         ecKcNXERH0lCGrnJoATM3QuGT/EpXm5BYr4JEjPlYI5mDMfDfvqyh+Lki3X4nSnux67X
         U+QvyVkSbSaQatPmmoWBzwlEfIbhP5gjnacR6rOhLgaeCqu87jAKZXd1hhFnCI1iQGuy
         wAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227007; x=1794831807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=wMyDbL7DaBReX0RLadQdNchovXDXAezAztqX27SEmfRCR8s3w2yzkZy7rPoecsD9CI
         7RbF96Ybm6rHiQxBehIrg6JqjdYv1wS0uRulbFM10Z0wWwgMzNNYj8F4hu/a4Gkq4ITY
         rpKms/+fdyUp3JDB452m1FImDbKcxFNTdRGNK1gwC0X52VCP2u/GYIRV9I20tf0ibpuS
         uoXf50yDvnAKrVr8+LDio65y5iE3rvJE7S2NLuupSm1c07jER3p/1n3hXUIpbL8tuAQe
         SiccGI7BdhZHFZ/VUcKBAqm44a46paB6lz2oE37lBDZoXl/NAW85hrmMv/ILIGQ/2A0p
         1+qA==
X-Forwarded-Encrypted: i=1; AL+hErFGyxnEr2ocY5OGbTKC36694/eo0aZ7LYgsUydhp8C3i7Mjkz1IaG60rGgl1n3lb/MdkiMD1WbRNB1c@vger.kernel.org
X-Gm-Message-State: APuU4Z/MXbusJF5iXGUcXIwbz8PNG/cvtsdKfyUmzQL1tSur8egDcnmv
	V46h+cS8FnQqsba2n92hM/+UWjmUlgmKsVRuq3UtC/Vv0bwVuYlcYUvayWIQqYUwhJo=
X-Gm-Gg: AYBFou2wZEw9xTPNH7M/Cc6GYPu1g9rhULmFlXvqvt9OXSvmzogHhFkvV7t3DJQ6OrI
	julqFsJUJouBczJkwI8SD7U6sbX7NiGUq1HLsTp4zR5AOvy1PBZXFPuiAm36N8iGK7B/nNHMov9
	qUIzB31SEn1zHY1TtGVai+71eujWLCLQGZ2PnblTprUmGxQBiXR9F23696IlYe+3bmJAnt/3TZ9
	2WA2Tnd1UrGrUR8ueK+ECFGfqojSah7i42Znt3B6VTvWEVDX6HKJ3SKwxaGajKVvJVWxSZYfYBg
	3EdyrRcwj7kB2PrQD4ZpuFIyuidI+M1uQi1r2Ag0RE2HlxpQgsPnT41P/hEg1Xwkj2e+w5yBI3n
	XoAeV+qUpfyacAdU6lgv/x07FsK218UC+61oqmyIkZXW6mMugMv0Lr3mDpEfyUD0o5KBksUF/J6
	NpNhYifmkbJOgb2gLOMEKdN/rqZt+gat1drhba1C+AuTRMyddQZct30FC0hwHHcWmZG58JLkeII
	YfzmoS25komX/wanahLRjgi3CNl646BxgyBSLNMdljEFM+UAAK65T2T+KmEg2uUvAY2PF2YXzvw
	4WkCRuCqqGuWqQY3UiGmRm6utgpR6u4rpVTweoWy+8b4cRUXpasZk21Pjy4poHyE6K8gSJ0s+yQ
	XMRDCHGPKqw==
X-Received: by 2002:a05:600c:1d05:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4b963c7585cmr73754505e9.26.1794227006810;
        Mon, 09 Nov 2026 04:23:26 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:25 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Mon,  9 Nov 2026 13:22:45 +0100
Message-ID: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier boards byteDEVKIT v1.0 and v2.0[cite: 59, 60].
It also adds display support for the integrated Youritech ILI9806E
MIPI-DSI panel by extending the existing ILI9806E panel driver[cite: 56, 57].

Overview of the series:
- Patch 1: Documents the vendor prefix for Youritech and adds the compatible
  string to the Ilitek ILI9806E panel binding[cite: 56].
- Patch 2: Extends the ILI9806E core and DSI driver with init sequence,
  display timings, burst mode, and supplies for the Youritech panel[cite: 57].
- Patch 3: Adds the MIPI-DSI controller node and the bidirectional OF-graph
  link to the LCDIF in imx93.dtsi[cite: 58].
- Patch 4: Documents the bytesatwork vendor prefix and DT bindings in fsl.yaml
  for the byteENGINE and byteDEVKIT platforms[cite: 59].
- Patch 5: Adds the Devicetrees for the byteENGINE SoM and byteDEVKIT v1.0/v2.0
  carrier boards[cite: 60].

Subsystem / Merging notes:
Patches 1 and 2 target the DRM subsystem (dri-devel / drm-misc)[cite: 56, 57].
Patches 3, 4, and 5 target the Freescale/ARM SoC tree (Shawn Guo)[cite: 58, 59, 60].
They are submitted together to provide full context for the hardware support.

Testing:
- Validated on physical hardware (bytesatwork byteDEVKIT v1.0 and v2.0).
- Passed `make dt_binding_check` without warnings[cite: 56, 59].
- Passed `make CHECK_DTBS=y` for both target DTBs[cite: 60].
- Passed `./scripts/checkpatch.pl` on all patches[cite: 56, 57, 58, 59, 60].

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
  drm/panel: ilitek-ili9806e: Add support for Youritech ILI9806E panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |  12 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   2 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts       | 459 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts       | 441 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 11 files changed, 1321 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
