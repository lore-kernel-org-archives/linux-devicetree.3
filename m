Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E733E51C8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995468; cv=none; b=JNkra0u2I7lfzenV5m4mx/lbZ580sHt9LszO/M2xv28osTh8hNrQ/QR0QwKBRSNgQpQVV6B8anfkExGlwqngGCS4jDcQyS7slerKUZgtsxO82FZQbHeFUjmuMT6LhYTyVUEVbgjxDLfA8KJNllUPp0+lkeKaEIjsvtYlKamxg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995468; c=relaxed/simple;
	bh=snYz/D/hcVPZCP1uH4dkxVp3T3bXMnNXrhtHWe1Be3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTZXZSOlW3Ghypn8ZLK7LTFlY/MZKtySU5dWOWeDXDYrd0EsijfMgle3n/+ifhj99xZ+H2XeHNWHDJCZzjnBPAHtBRxjCq17GS6Al9K2IcHmHAZQ572sjcPIAmvCJSloKxI2YWJwB7/EbTpetRGyI6n95WBiu8pGKglgOzCGNto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir/afwOi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir/afwOi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso61057125e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995466; x=1781600266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=;
        b=ir/afwOixR2pf7dxrx4HGEhi2QwMkvRsgKvW+m0vLBYMexTMTuYoXomAl54+MYYdfv
         OquACHKSw0GsF/U207iEZ4WGAwLfgU/6bChcnV8bio4yg9ViKWsh9GWjPoR2qZPDSjSc
         PKn6dFx0NQyBLyYbTR71twgLug1TLfuPqDygPSmnXT4NLQtT5+LAedAO8NPc5E4OyTWl
         iHGEKMQ4xsnGf1SSrT4LQCFbBahTU9pXnXFbmnvi6ZQPbpvyGwwhyWxkyJFlJ+w3QiLZ
         YkbIFHAxT6ExTNluSS7BKjoigM8D78A54uIsOi/GtXzdrnhHIjtMRgZteKSpaswtAta+
         AiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995466; x=1781600266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=;
        b=TCbDWCqKZiJsbFSUl5aYOzQPOh7vufxbvDJOJ+Cg+1uvSX7BPeBxqhNpQLl1kaFgmI
         3H3s/bUIqZmjwpSikZrcIzAXjqBlQk7I5ejsbSpOabiw6HxSM8VO3KT0qUmF8Spi9AIM
         FAJbBM4iRGvS58GOB/Ayk7Xqm4edoY3JCIkztzmMtxpUxKgsdo8lFY0McAxs2Qn8pRX0
         ohVK1pSHRMn1P0LfYA+SOJKeLglkDrmcf0MSyvPLZOZU1aeGevzZjMjmeJu0y25Dtd5t
         nOS4a6OWE9vspIwSFcr4c0I4ikiqrLffXI8yEJeN//zgcdd81pjWwCn8kwaOvoWJwGky
         ySlw==
X-Forwarded-Encrypted: i=1; AFNElJ9hkuOgW9CTdKah8G7/2zYGnM8ZErjkMdejFuKZK70AOqCJSmwgmyVy8SU69cpXkLpXkajMcuCL4M7w@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfR9+8YjxxJG/sdTHixhuSrFDHnRtsdrKSi+G2EMuqMd0fByZ
	tyTVvRFK307k03/8l/YV1n30WUlRQXR9n4HpWkKOpgJpZkNN/6yl8FKC
X-Gm-Gg: Acq92OFSxyOsal+x8OqbjxpdCYr69Jkx3i4Bz39+hGZVhyutwabABTYEHmltC7guHcM
	1CQlgAMWUVMZRIysc5fX8IJZb9Pp04Gow7dZndxOy0duqL1AL77H2yE1XJ+U46VPibweVyRoVto
	5113a+NWld3lUKR6sZaFKZJVBTDZGrVOmODU3fkpQP+khLNvpn0/rBUWqZvy8a9XyDN2IDNVI0K
	NI4c5dudH5TyQJbEQ/UvQZX6j01ZQYKG4w6MvgVqpg5BGxEzJrszO7FYSAcYFSzZUUNmUawfp7Y
	IG5bbKiJn2zlN+HF7DKMhmW/4ZDerofX7ZoFkMFkJFmq3WhltJSlgxsPtGfjD/+bo+xFg2Z27gg
	u0m2FyTG7BA3etqRGUR2ID1H4Vjiv3Bv9CssygWx0z/uxEk/66a5BdfYTuS14v+zclWs4OI8KMU
	b27Bj2TRjxZ7xNk2mWIUxUnPUYu0o+kvhycBkkZAQTi07ZZPbAVXPhsPW1VxAWpX+kMnm3DD/Ft
	fZcim4iYIAxXkzHjTX2sUGHBP5fXYac03TTGzlJclCo20I=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr334881915e9.21.1780995465435;
        Tue, 09 Jun 2026 01:57:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm305234475e9.2.2026.06.09.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:57:44 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 10:57:37 +0200
Message-ID: <cover.1780995368.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 723 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

