Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58406364058
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420756; cv=none; b=gDkylzD5Wn0xxOOsg0GlURu2SBBjzUpl4/QKtkPkKpCF1WcPm4G6jk0Mg3lLiTPfaDdaF4hMAzsbqp6aChZam1OXUWum2WcatpgrII77pyVehit/uWAD1ge6wEk6uT03F5JhDYW7ctY4URrOpeS0DT2MA1zfISIMzXQM/eKxjvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420756; c=relaxed/simple;
	bh=e//QMkJoyykGgpaU0zfb4V8Q3eQfUEFGdMjhF7u0o1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OoxmZhOPWMdYGzVct3C2rsIk/sPjWDloBIVcM0AWhLk4jIlnl8t9gc955gsTBVOvVwncVr7ZhqnnQdMTIqJT0yts9hvJpsA/G+YJtr5Drd1t6y64jXNOWCc51c/P37RFOSyRregFqRw712hGPdvUqxjESJ/gkByTyizTzGXT87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3eD77uG; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3eD77uG"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso785759f8f.1
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420750; x=1791025550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Thkxw2Q4k6ufQLYJZJEizYu3KZIvTGJwd8VQ40ITN5U=;
        b=S3eD77uGTmbarjDofU04Si4bpLE3V/9driZlWnRx76vX/H6A8Sfr78FSb5NpjfIwcJ
         DHixnyuU35piJFjxmX5RoXTymkaTQgQPi/L5dG8qZvixNAJ3UxwvqsBdtP8842oeSaaG
         9p3oasrX2Bk9uf3jpW1LVAMSia621V/wfdZUt0HhkVE6DvlupEG+T/Gikek4AHnYhGEB
         QaMObEDgVUKSr4Y0Z2RMwB0RQkQ6q3oXS2SPJ99bGmCzEtrpmoVTKZJY+G7PZweVKFwI
         sWsOkgW+KJPufZ47OzATbb3JjrsJ8icIT3MN1/8VmxA57Lylohzs33d3/Xf5gPaHDC+F
         masQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420750; x=1791025550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Thkxw2Q4k6ufQLYJZJEizYu3KZIvTGJwd8VQ40ITN5U=;
        b=OmdAfRrStVzsHP3tYbmq98VC3xuO+ipwBfDGvehV6gPbHQaZfkvCtidh/nKR8FP2U8
         ZhmBlPscVJEi6MGSNFENuaO1oWI4FtwX32capmAVhm11/te/1txF6NXqVM6s4R9CkVM+
         vcmfGl/Xn1XW7LLIltRo+qsfjm10Mp5SeZ9EhU1qbYGZduwqhugjYZSuMK1KhN4NN0Xx
         Sv91lx7Ov+PG0TC2Dh0kdLoAi3GmvJh/G4A5oFQNkcuPi/eC22O3l8zZcmtPdM7ypuO1
         55IgoBmRl7ruTXCRXWy9878gXC1dEJaVQVOqMtUK4tiQLb9ciql49sru+Kr/jNPL43SP
         eTig==
X-Forwarded-Encrypted: i=1; AKwUvBwX39tdR1JXS2j0cV623WE0g6mvCRhqPZJ/7LT42rfHNdmntdJQ1dNiBMb3L6BxAcZJqQtUM7LfOkC7@vger.kernel.org
X-Gm-Message-State: AFq9FYIEzMgkIe0tzpLPVkN6r//XoNvCzItuT7HSbQhYIuJSzo37CYy/
	NidNmDyKHrwH9NLDQUwJagkeZsQwEJuf6J8Ubxsy/woOz8eL5v9eTDXG
X-Gm-Gg: AYBFou0TcYk3bdGLyNi2oEDF0urM4LjHtZoDtADXg/X8y9o2R7oBfmguxR4b+tRsVZZ
	GczWSwVfVKGTGfoBLIY16Dh25i8+fKz7Ypk0xTMksFPhQOqzIInKZwYL4gMhi9kBcXY9ZIxajoH
	M8Ng9DkPS16sqzFwwVEHB2wEw+/E0US/vRvpt3TdtDzbwIGKnUCSswnLhAPon53CIhEixzxt9Yp
	J+7Q/L7ECvCk9S9uM6iv3MDG/CHZ/txN1JDTR2E0fhSFre5/hRnzIjY3klVq48Db+uGkOq2Nxfk
	t88VUP4xR52eZYdHNshi1AIwOe0262E/ZtkJxFafLsQzdYcY8jd++OUKcPb4sxK4DDk8Hw7+zeX
	atxesV8Lcx3BompF6dASZ7e8WySvsj8qrx8BpBEhXaihOR4qIaQpDbtcjgfZoFFE7P8ReL1tCpa
	VsNm8OOc7bitVltECxNe8++xZMZXlBeWshn4qS+BbeUz4d1CzC4Uoe8izbrfZEzrDHs3FPkcCZc
	cjehHHGWoVtwzKmoQRIrNTKC1yFoGsaR9528p6I/ZIAEDR2XUUT2FQkkq9MloDtShSZPf4G1BoT
	ZtR58uitaIgkDvaapYGrvw==
X-Received: by 2002:a05:6000:2504:b0:485:ac3b:4a79 with SMTP id ffacd0b85a97d-488716a1af1mr15925104f8f.43.1790420750301;
        Sat, 26 Sep 2026 04:05:50 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:05:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 00/11] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL and DART-6UL
Date: Sat, 26 Sep 2026 13:05:28 +0200
Message-ID: <cover.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device trees for Variscite VAR-SOM-6UL and DART-6UL modules based on
i.MX6UL, i.MX6ULL and i.MX6ULZ. VAR-SOM-6UL is supported on the
Concerto-Board and Symphony-Board carriers, and DART-6UL on the
VAR-6ULCustomBoard. The 90 new DTBs cover the supported combinations of
storage, wireless and audio options.

The descriptions use shared module, option and carrier DTSI files with
SoC-specific wrappers. In particular, the WM8904 and WM8731 codecs are
selected explicitly instead of keeping a codec in the module base.
The four existing Concerto DTBs are converted to this layout without
changing their DTB names or compatible strings. This also replaces the
non-working legacy LVDS panel description with the LCDIF configuration
for the Variscite display. Wi-Fi and Bluetooth enable/reset sequencing
on these modules is handled by userspace, so the legacy kernel-managed
power-sequence and Bluetooth nodes are not carried forward.

The Micrel binding change in patch 2 is needed by the Ethernet PHY
descriptions in this series. The existing boolean definition of
micrel,rmii-reference-clock-select-25-mhz conflicts with the dt-schema
unit check for properties ending in -mhz. The binding now accepts <1>
for 25 MHz selection and limits the property to the applicable PHYs.
The Micrel driver tests only whether the property is present, so this
does not change its runtime behavior.

Patches 1-2 update the bindings, patches 3-6 add reusable DTSI files,
patch 7 converts the existing Concerto boards, patches 8-10 add the
new i.MX6UL, i.MX6ULL and i.MX6ULZ board DTS files, and patch 11
enables their DTBs in the Makefile.

v1->v2:
 - Share the WM8904 codec description between VAR-SOM-6UL and DART-6UL,
  keeping the DART-specific microphone routing in a small wrapper.
 - Consolidate the identical WM8731 descriptions into one shared DTSI
  and update the board includes.

Stefano Radaelli (11):
  dt-bindings: arm: fsl: Document Variscite i.MX6UL boards
  dt-bindings: net: micrel: Fix RMII clock select property type
  ARM: dts: imx6ul: Add Variscite SoM and DART base files
  ARM: dts: imx6ul: Add Variscite audio codec files
  ARM: dts: imx6ul: Add Variscite storage and wireless files
  ARM: dts: imx6ul: Add Variscite carrier board files
  ARM: dts: imx6ul: Reuse Variscite DTSI files for Concerto
  ARM: dts: imx6ul: Add Variscite i.MX6UL board variants
  ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
  ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants
  ARM: dts: imx6ul: Enable Variscite i.MX6UL board DTBs

 .../devicetree/bindings/arm/fsl.yaml          | 148 +++++++-
 .../devicetree/bindings/net/micrel.yaml       |  27 +-
 arch/arm/boot/dts/nxp/imx/Makefile            |  92 ++++-
 ...x6ull-var-dart-6ulcustomboard-sd-card.dtsi |  31 ++
 ...mx6ul-imx6ull-var-dart-6ulcustomboard.dtsi | 321 ++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi |  32 ++
 .../nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi |  63 ++++
 .../imx6ul-imx6ull-var-dart-wifi-brcm.dtsi    |  42 +++
 .../imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi   |  45 +++
 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   |  17 +
 ...mmon.dtsi => imx6ul-imx6ull-var-dart.dtsi} | 224 +++++------
 ...mx6ull-var-som-concerto-board-sd-card.dtsi |  42 +++
 ...imx6ul-imx6ull-var-som-concerto-board.dtsi | 350 ++++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi  |  32 ++
 .../nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi  |  63 ++++
 ...imx6ul-imx6ull-var-som-symphony-board.dtsi | 317 ++++++++++++++++
 .../imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi |  42 +++
 .../imx6ul-imx6ull-var-som-wifi-iw61x.dtsi    |  45 +++
 .../dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi   | 201 ++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    |  71 ++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    |  85 +++++
 .../imx/imx6ul-var-dart-6ulcustomboard.dtsi   |  18 +
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts |  20 +
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  20 +
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  20 +
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  20 +
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  20 +
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts |  20 +
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  20 +
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  20 +
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  20 +
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  20 +
 .../arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi |  31 ++
 .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     |  30 --
 .../imx/imx6ul-var-som-concerto-board.dtsi    |  38 ++
 .../imx/imx6ul-var-som-concerto-common.dtsi   | 215 -----------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  15 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  14 +-
 ...ul-var-som-emmc-sd-card-concerto-board.dts |  20 +
 ...ul-var-som-emmc-sd-card-symphony-board.dts |  20 +
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  20 +
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  20 +
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  20 +
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  20 +
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  20 +
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  20 +
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  20 +
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  20 +
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  44 ---
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  79 ----
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ------
 ...ul-var-som-nand-sd-card-concerto-board.dts |  20 +
 ...ul-var-som-nand-sd-card-symphony-board.dts |  20 +
 ...som-nand-sd-card-wm8731-concerto-board.dts |  20 +
 ...som-nand-sd-card-wm8731-symphony-board.dts |  20 +
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  20 +
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  20 +
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  20 +
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  20 +
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  20 +
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  20 +
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 --
 .../imx/imx6ul-var-som-symphony-board.dtsi    |  88 +++++
 .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 ----
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi |  31 +-
 .../imx/imx6ull-var-dart-6ulcustomboard.dtsi  |  18 +
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts |  20 +
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  20 +
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  20 +
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  20 +
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  20 +
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts |  20 +
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  20 +
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  20 +
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  20 +
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  20 +
 .../boot/dts/nxp/imx/imx6ull-var-dart.dtsi    |  31 ++
 .../imx/imx6ull-var-som-concerto-board.dtsi   |  38 ++
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  15 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  14 +-
 ...ll-var-som-emmc-sd-card-concerto-board.dts |  20 +
 ...ll-var-som-emmc-sd-card-symphony-board.dts |  20 +
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  20 +
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  20 +
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  20 +
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  20 +
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  20 +
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  20 +
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  20 +
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  20 +
 ...ll-var-som-nand-sd-card-concerto-board.dts |  20 +
 ...ll-var-som-nand-sd-card-symphony-board.dts |  20 +
 ...som-nand-sd-card-wm8731-concerto-board.dts |  20 +
 ...som-nand-sd-card-wm8731-symphony-board.dts |  20 +
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  20 +
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  20 +
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  20 +
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  20 +
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  20 +
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  20 +
 .../imx/imx6ull-var-som-symphony-board.dtsi   |  88 +++++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  31 +-
 .../imx/imx6ulz-var-dart-6ulcustomboard.dtsi  |  24 ++
 ...z-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 ...z-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../boot/dts/nxp/imx/imx6ulz-var-dart.dtsi    |  38 ++
 .../imx/imx6ulz-var-som-concerto-board.dtsi   |  44 +++
 ...lz-var-som-emmc-sd-card-concerto-board.dts |  21 ++
 ...lz-var-som-emmc-sd-card-symphony-board.dts |  21 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  21 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  21 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  21 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  21 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  21 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  21 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  21 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  21 ++
 ...lz-var-som-nand-sd-card-concerto-board.dts |  21 ++
 ...lz-var-som-nand-sd-card-symphony-board.dts |  21 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  21 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  21 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  21 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  21 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  21 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  21 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  21 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  21 ++
 .../imx/imx6ulz-var-som-symphony-board.dtsi   |  24 ++
 .../arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi |  38 ++
 137 files changed, 4574 insertions(+), 766 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 rename arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-common.dtsi => imx6ul-imx6ull-var-dart.dtsi} (50%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-board.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-symphony-board.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi


base-commit: 49dcf40cf1843c615332c7123508f0bef3ee86ba
-- 
2.47.3

