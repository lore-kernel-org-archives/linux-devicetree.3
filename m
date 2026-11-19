Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104069;
	b=D+lMalsPJLkziFeAV471kBxrcvJOurhUgBth/Mqtw4ATMWkmgXKfKSh0eZ7exff94mPy
	 xPMNFPesQYidm37brcQYobbXFWBty1WDEXBh/RpuzdFFy7lDNc74wOAbCbQlIwIB1vlLj
	 OSxbqboubscqeOAK9GcF6E4+AgAC+/SJ4a2xiomhEhZoKqKBe0vMb3sZ85GSL2CpeVIGH
	 659bQsB72OEIo243wT1CWDuFMm2gZT0Mtvj270vDwbwif9OfMxk8AFw7SGbwOLtNyTZRk
	 dgXTvHVVHQlpQUXAGPKEbsd0xUrB24JHBBqRG+dLjYkyMWKUoFhvoOM28YOp5FZN+8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
	b=Mi5vFTwJw0Ui1HI9XCQk+/B8DPx4qhq6RojyrXcpGYY5vhJT7+XoGZMvLXH4cmRzkf11
	 09Y5Rus7m9QNX8K/4WCGMGTH2RtjRBi83hFFZr20v4jQRx5e2KEWwIJzKYSo1zylFSmzE
	 /HpFY3NAswWWr9hue6gXRILFceozFB9aF92i1Z6BX1sKSArtgLqjFTKA9Ml0q+V8drRcg
	 uN66G4xWZYtOmZjrUOkiUP8zUojCaA0/tgo4LYG2vIxjS9W2CuVPOx8dr/aHjX30+ivcL
	 tjVUbn8KuSnBTdUOOTaJNnwPa8F8krfTZC37ejux91F9+fUMJwIe7MQwu2Yu736D9ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YThfrSju;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876A606A32F
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C876A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YThfrSju
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so25924675e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104067; x=1795708867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=YThfrSjuF4Oqzwz429Vo7nEBdNy5jkNcZasRgRo2lLdRG32SZXGYkjZFeUTaudiiOi
         6wTUvDI4IrrfG/wqA+1dOy3CAe3cnmLuSAwxwN/9zpFn/O/ttCXlNL6iaXatz/abv8Nd
         JXaxc63I67G4CdqVrdIx2G+ao9HKPuMK+tR2fsxOO8oyRlRy75T5/x4eZ61ULDx50QEZ
         LEdZpalllJ42pPbfQq463QbpX/37C9fDcZpHDFa5v1xp52m5WYcdE2X61cWClZIhGVKv
         nbEc9VhwijBaR1SoTXAW9TIEI8Za7WhEcBOphG8h+nLTM4n4u9EspT+YqT553kF9Cmqq
         Yyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104067; x=1795708867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=m/Nl9FhA9x2nJ3wS8YYPJbs65FLT5aURZWHGc4fAahQkvhRLXOw+zlmvr1zS9PiFPJ
         ET7zJB6neNTph5inQNegGLCYBOvlR8nf6HgaoPQsdj68zRWhkKaCYqtPh50E0NzVLXxG
         yUZrvJlJ6odkdVeFzzFGSKFLOUyUOhoM2MvlTp69Y7rvWb1V4TdsKY8TvDZStxjCYO8Z
         t4vSW2tMv7gQVtaLURBAzSe1LJVpKXsA78hegE4kAdKYkzHA32J9iB4D9QW2L3MiDmlA
         jjPBdJFbAG8ZmkzHlVjFoBAnL1V0gpQg1dbyTuB+lCWar0j22J+4YA2iO6JzMB9SAeMT
         ei0Q==
X-Forwarded-Encrypted: i=1; AL+hErEbtBdB6i2C8Zw+xZnViRkFYVw3srMbTHl+gT/fJLbRnUKX0Tbf+W4oB3fiCY0mKh94rWclJgFNQLjb@vger.kernel.org
X-Gm-Message-State: APuU4Z9hSRF9I6aZ1ta1727Fq4/nqshSmzrULsniBKqtV5hlam1OUatI
	Ni2Utwr+6R5m3fPamNUIbJsvGbB4eoVaBulV5zKPpdiCfpsNAROFG3u7
X-Gm-Gg: AYBFou3BWU134sNJ/LKpZ33KRlPA19Iuw/GUCZY8qKG91d+eep7aZpNC8TeLHwEu+5k
	c6cvBqSeAIrEUORggEXYLhsYcYNkbbv1dtdcv9HasWDIIjcSoraC4XQquT1ZZAykvhtL9O3mgSs
	qzs8jSLJSLv/EfZ2NMdr0w/VgbIVJjoksKQ7MOkG4YoC7GSseUc8Oxiu9+wRygkglkmuW5I+9Uv
	zwPBqWs508G3RYqdRm06qZgNyAwTjw3dH+YiOxYhohy9HSBk0i937h2lPzmd5UrfbYVvhlr/Yey
	rq2M2xu1TH4V22kklAoYTDR6R0sp158+ojXUeLZbYg5/IVBensXQxJjJFdeuEOJa8iQ2bgIJ3FS
	h+02dree0GzOoIAhAw5FiKnKvZIqRF2o1afr6D61bNIpVvFlbEQtM14jBbsrwBxgb+63e+L8siW
	TljhMUUAeSo+innxV9INDPry4/NXHYJb9c1wh7RrvjsTlDvnq/VYf/Q5Rsz8FsHdC1JnEXTu2I9
	5LSPiMpEXc9v6+Mg6d1XTQJfixAzFrn64MOXRkTxM7FbaRMh6edZnwTj22xydHDsKHnLEFQ7e21
	2HyuMlfc6D5+aPcqaUxNJUtGQVtu7cBaOUACfIHISDuC/fBMOjdcei9ZlbHp8d/Ozh70GofbkTi
	idKkC41+y5mIs28WOuZODtI5UFFQ1pGWCLCk1zeKOJ7S/K05EVceN00E=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb7da2ba1bmr145169935e9.24.1795104066898;
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:52 +0100
Message-ID: <cover.1795103362.git.stefano.r@variscite.com>
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

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch extracts the existing DART-MX93 remoteproc configuration
into a common include without changing the resulting DTB. The second adds
the M33 variants, reserving the peripherals used by the firmware and
keeping dependent devices disabled. Remoteproc and MU1 are then enabled
only through the M33 overlays.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Validation used the remoteproc binding update and cebd1c0961d8
("dt-bindings: gpio: vf610: fix clock requirements per SoC"), which fixes
pre-existing GPIO schema errors. The base and M33 DTBs build and pass
schema validation.
No hardware testing was performed.

Stefano Radaelli (2):
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3

