Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67342D768
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142567; cv=none; b=fO0ZTyOF4/1/b0nWnJJ3jv0gow7KKRq98TDYkihUjGXr8hHU5rpB3tHPLRy8S05qryy7awsFe4QcErHMxlzbkXReT0DN8YRziQ74tXsMK2/8Dhi2DtJ8jkj3C53aN0yzt5FE8ddsDvLWGdi/iKDThx/yplBUGlCUrIMColbc498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142567; c=relaxed/simple;
	bh=AKvUmloDNtBO9wH3Im5q723OgIiJ5619HSc1Z9IPeAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSiTi9q9M7s1yntePrGr/DvEjX2iwj/8s60ILVPO1vw3E25NP1QzSIMzU2qOqd/amDBCndA4zk4h1JSv3NzbQX1sQP4OzZHib1cyLeI5T3kemrSHnd41Y2Hmuhss15zS0b+NWJyDLf6iTTAuZFzTx4X9yeUVJxX3lko46sxC/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqHMOYa1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqHMOYa1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so31528275e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142553; x=1784747353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=;
        b=RqHMOYa1dIJcMY++xTky8t3cjkmcnVhRKM+0DfUVNcidIjrZhwfcIkI7kmK50p969B
         B9DkYsWL4N/Ws4tlisIF7eu7hCOfA8VQICkFGAtGlNJZfXfBtZrY5vnHWV5r1ChTLQvZ
         3KOpxefcFxvTR6tLX/No4ncY//dNleuzqPPYCG5mR90b73i5O0wMr9NkSTjLcnCstGq3
         lW9QhGX09XDnyfZOP86IMxYZDzsP1f4bXyMLZZ/ZF9JgkfDR3K/WoQXM7PqyWxMjZf/U
         ePcvonM7enWNdZEbRP4JIRZFcFamV127UQ65kniYL61r26ZHtkRjfKa570ASv1FOfC79
         0n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142553; x=1784747353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=;
        b=GOaDj4FhWzVx42Dde4NRHxNMmPBprwJEKNtRnGGo+Eq2kA5frtFXfHjAKYwLSbYx6A
         /XL8ThH3uWsbAS8j71NVBwRMzd74Y66pgrxbObFWad5iqQk6ehfmQj78j2rMTQFoa0A5
         p/HZknURm3GCn8E8WseEZnVO7riOSW5UVqLZDulo3AhinCg3OXyxngL9f5PWbKZZKbzu
         3CQgZnc08dkJiybBL2ynYVwYSeCOEHmTN3MU1mNDHLH1qfoduvPRWg1E8yvf3wiVcpzP
         qj9o3w+87QsSt/3Rqhyq+ma2W21n6lDQ3xu6OTgBiWY9qAEG5uJoX6563puZ3x+y01Lb
         ORAg==
X-Forwarded-Encrypted: i=1; AHgh+RroQVy3mBABbxhSkq/npVCIz0rxp5EqzNpn49SrMTg760GQFnSbog0ndDcNG171PGzxZd0TDrHJpG4E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LVlKJW+MoMWwqr4KdjpE2d/XwYKv0jyi7LUPahwhmeyzsaQW
	+b5UteyTBx9edWlD7inqdKKyp0+7qSm2ujN2DuDUjuWc+Df+HOEoKEYLfNxnAA==
X-Gm-Gg: AfdE7ckz6Fgy+sCoDyuN/w8QHrGdPPrauFt8HP5koongLUnGiT9VsQBByKSC6pMCBf7
	eX1jp/G7X3tR+IZBkvMx1Aa5t2uGoKd6aqdiRF1RkSB2jAT9hudW5/GuifYcpPw1ToJe/Pq7/CA
	z5b5H36BSdRRg5RKzmxLrXeaLIGHpBJR59NzOqLS/135jWK84E5tBhYCYVxiz/u6uwEjtQS/WzM
	eJkFAGFZ3s4g71p6oqvCb1e7GD1igefjSEswVabTDVPwNb16Vfga90kpEBAfyBeGvJf5oZiCF+o
	QDCZTExIkmEwipwQoncwzBAT4PtSXa6KERDD+w7FlNWp7/Fr71LnBL5PmEMvG0HhGxgI4Z3w0pX
	Levwju4/UtSbdbFuvDGhj7VARTUVkKC0QwCliwqQfqXMuP19zcRF2ING92JSGIxK3/0VQmT9XdN
	oQ/ybVuS9yuaJPH/aBMcncGz+Eg8qhZrHBGwU45tGl/OCPkjMWbZR0O/KzYNoI0nVVsF1h7MSou
	iK7xaoLii6l4I8bw5kowPBmPOL7D7xEiTj5
X-Received: by 2002:a05:600c:19cb:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-4953c15d121mr46243825e9.11.1784142553147;
        Wed, 15 Jul 2026 12:09:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 21:09:06 +0200
Message-ID: <cover.1784142385.git.stefano.r@variscite.com>
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

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

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
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
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

