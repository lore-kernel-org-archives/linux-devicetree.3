Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66690377AAC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059540; cv=none; b=OE+e6H/r/6HzAKP2uOi7C2Uy/coJ93yzKB7PoEK8r00jZVwlEk017MGVaKscKGNYhfu0EVe1sVBeJ66ld5dSEf8X5jvuo2KePb38kjQ8anETSPeXqtAlLZ/KAg3PUv3wBQWu0AksnmArYIKzgeweb+Ls1EXlUSzzJfe4hbRrurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059540; c=relaxed/simple;
	bh=nJP75in4P3lswa4oWsjjX2TeYlHn/IYg0sncecBQJ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7E3Q0kUJ5zDUnEsv7DW0JVc6igzm9ojm9OuDOlQUpxqVqd9G/dvPEAqHSj4o5Sg6zbgV7ISVuQ43GDrSoJtUoINH8vEXB6jNgUSdGTB61jFtd8vsduH762YonTcuWBS2wW1uMYJF9ImeZZz+KgiqWl/RLDVxY8kTJeDRQR+Vy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZtAQOeD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZtAQOeD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47640541585so2269248f8f.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059535; x=1784664335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=;
        b=oZtAQOeD/VvTFbU7PItaGFPEGZ/Zzg5SuVJQxNYDZjSDhl/8Samiji5Ynrc/jpPQT6
         gCvE8E0wqL8rOI+i7HRcgup2f3i9fIBuCAkBxBw18vXyEVHUZY8ggFlgt6mWsSjXDyYs
         eO7tBxtOKLuRMAw5UPQKZWF1Sdmirz50mZ2rHYJ3bc1V0q04llIy3XJ5IR/jsZZDTUrE
         MiZmPw8o1s7HWookp+G0e6zxpvFkQlBAbbjajKDAUAkeWBv+lNJnBylCZxzsy4sx+YUE
         9kZ9V+LSJ9A+E9aMNmzYURGWsOR9vEJEd7kEKl3Py0ADeRTgKectMyGwhDbm4bF5sCDf
         ez1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059535; x=1784664335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoWubUhSydBTzOYHJhhAjBoFYVBqYbpc3fDg9gsugJU=;
        b=oVS8oMWBy+HPBk8qZTTiu8zleiM2Bj1VxSlDGL0y0xsPJjxDZKAoJSCZGH/y/46Pw7
         5YpTZhTklWcJtuHqpBf+kNyvKOsGwZtA9EzTYaMR1YjxXTNMxQWTl5DTNIszqcm4dMfX
         uXxlvVQMnw0coIQwFlYHZXnRYCFpT7GPNdxcScbZfF1d+Vp8+U579JUmpOE+P3/8sD5/
         BcPCvBHCSiuN7bDkBUIqZdRkoJImNqsF6SwQ665gJ0VRXooB/6/iU3GY49nKhQ8OLe8D
         DEyUmVmEKcoRP8rM5PtfFtz03cAJpzNkaJL9411aBjyWulT+YMuxDfTIydfcxGfGtcMn
         r4mg==
X-Forwarded-Encrypted: i=1; AHgh+RogU9yxKj7Gz0eUZO29A0aNnU8eJfTLGJATCTOoAedrgi9Teg52fVnt5HtQgV/hcJkWJAYMobVuD6y9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2WGaA/umHttqhQ1N/XHWjeUeqR3+r/MT7Pnlkos0O/IWjGEn
	OCbsEm0HO6gCdWEPXayodj5qg9vfr4nU8zJ9Y8T+TvDBovsergOuRcNP
X-Gm-Gg: AfdE7clhEKOf8X2vUvGOgV9MiIPaA5/VsiJEpYOnNqminDKLsWacU3NG9yF5xIGsKZj
	VGjaJHZuzSWAQy2vuXWd87JhaKcN1GHBDF1snFY9Hva96SUjQIWP7WXE6+6uJ1SbuGG6tq9k5uh
	ZztblQnSTsvlv8EdCsjZcjdsFjlF93bTkhKuysY3U8Jx+YySX03+t/ZV1UCfqznkYac+NRY3czB
	pyFfVp7dmx2jCGVrZ9hwfnXMArmKXjNlT6MOR3ovxMX1cXtuXTp1huX9L+CaHrzhkM7SpoMjS7o
	sNEV9+jS+AdKOSjOVqBpDg6w8N8kP/t65yhwpHIb/dAT5zc7d4ry0fPTQRIe0Hn6oWlr/m18D9v
	fY/bg6NaQM9QN3nKvuwOPcLfzxpV2M5d84pDmAQsHgEy7mKH4FrUnRAvZxMqfIgkZ/ci9tNL4p9
	mK0nL0+bwc2xnyDxfwLc1CIYPABxaDC9Z8q4Q8nO/QNvX2/tuvQ1DwRMzl
X-Received: by 2002:a05:6000:2008:b0:478:9d9a:d515 with SMTP id ffacd0b85a97d-47f2dcf7f47mr15914629f8f.44.1784059534751;
        Tue, 14 Jul 2026 13:05:34 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Tue, 14 Jul 2026 22:05:18 +0200
Message-ID: <cover.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 4 files changed, 1024 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3

