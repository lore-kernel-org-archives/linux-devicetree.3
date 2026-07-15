Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BF43A7E9
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133647; cv=none; b=h6GFOdrlaQxF1Sx1GazAGFT6lozUGM3+N0dDQBhrDhCi2Fj6kb5OTGfLigcvKkbFwXl46cbOo8rv3ymzrc1XkKQYt34IJ/iYDtznUCRDrHB0/ZRdH8eLgmCGlU05DFwRfgTBsRh6S4b2QVN1GHMQpcRd6aa3zdcRnpbUeXvz+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133647; c=relaxed/simple;
	bh=eC1/k7DqW6hIUmJPKXuG+Z7nCfpB5iHXjqobLEUQhw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cm/xeoSOJMQV2uxpHv5kTLAad83/IudncEkVN+8YvD0uWOuuuYxXEUD7LhIgB/REdLNwTFIxTFDf2F61wy+PK44pmEyfVkY32yCU1VSnEhLYbJD3ZMt8wHz8NP0xvLYjdHdrRB8zI6HiwtmAMhFEESaCrP6mHDItS2WJizjt7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uc5j/xyw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uc5j/xyw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so13996515e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133642; x=1784738442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=;
        b=Uc5j/xywJhTByHiLSUYpGY8s9bRAVzinU5JXlBlFmsp1c0BLh5VvlFTu+cCURj69/3
         38HDvneXZCbJwAGnEPM5JReItUkM5M25Ao+C58UcDS4Bto+lSjWJHTodGZEWFPNwy/Aw
         0G8fNXFx4bS6GS2NbnWKTm/A39+tfEjnJQ+SQPFtsEE1iIzx2v44x/2YOOStnwADP8lS
         AxP5bpr4QzOeqQDubZp+AxUWbPhFdWr1yMcqfTy3UvRpbHhm3OQBfdb+Dit5X6LhISMQ
         Mq/sQ+Zt02TUGmp12vpwaMaSEjHOvAzKeAL38Bt5N7fOaBgQlkgMlj73T9wXf3AD3s4d
         38EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133642; x=1784738442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=;
        b=CEAUfYY8ttoLX+qIoxX/QUOPyii1IrL/v1onq8zMbRvVcMaD79F8qa4h0P+sjyjzGW
         kIcLvtZyZkGN1PkV8K86w6pt8TlWxsYNncj7yNfOQ4dT6eUZSwvJ4kNCFIJrD30tib+O
         fJOEyjHIZz/NmtRY7370uM+ywOKtlQUSvPqtG1Frqi7HJsm9b1QPkOZzFPRlYtWZbV/c
         l7p+4O3a5ISzddNn1KokOObwqZFe6hlxFLrYjlBu+7ePfgqk6kEWgZmWOEvmuD2U5BJ8
         K/TyVkvydPRFpwZLMCbpQwPDcJZV+EWUEinhf0cKmC4n7tXlEFfuJCuItnETlONJ8xgT
         JmIw==
X-Forwarded-Encrypted: i=1; AHgh+Rowwx+ga6/g5DU+LK/u/s0J1FEG2OjmZpCAflT1k761pKQkANa0QUdmkU017C1xFXp2g5GyhnYoUn0M@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7BI9t9wij8c6phrj+/ULNNK/Jb2hgIveNc8iaUETwSPZBt7g
	pD0j/mXEd/vtAoe9PsC0l3rMMLX+U9BO/eeSvL2P1EguHSV9BSgJJuIC
X-Gm-Gg: AfdE7ckifg7Jromsconk916fGcaA5cSd0Jh7ZlBFIMRrl7ubfrIOZwYHGpSNT/nL+Lc
	Aa8l33EBKrp7YUCBMGmZ6Hga2V8NIDPLITL2X0jjXN/1zD3fj1s4LbmWWqP8lHuL0f0Nf3ukeii
	FzrOx9iCnL5CeA5++ITn9y2wVmTUFOHTivBBPwTQdf9UVlhipjBgr7v8ZRq6RDA85+/0c0C9/mq
	9okmWGl6Z2/w4V0yWAlriaV0sfC/eX9NeOpehAQ5dyDx63zrsCrTwB3YLvTVgytxiML64QhRDyG
	ZJWJtyKeP3pz42LjIoUrPb0QuCL7jQh3eaKPRebhSOUlidOlmxQsjvkYxgxCfn+TnpNdAmfmUer
	O7W6FiHgbAvSOwt5JAGry2R8G5vfqkorYmo2Gflz2CjAVzwBBuGOxEpP6Pr41qPgHF6byVSlf91
	0AlLhmrz23rGFpi7DivHHnCBg29Kn487ddEbzhJcTpeRcYgwc0FBvJPolPpQ==
X-Received: by 2002:a05:600c:6285:b0:495:3f64:26bf with SMTP id 5b1f17b1804b1-49540cdf249mr1832915e9.4.1784133641846;
        Wed, 15 Jul 2026 09:40:41 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464bbb0esm17836432f8f.28.2026.07.15.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:40:41 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 18:40:34 +0200
Message-ID: <cover.1784133402.git.stefano.r@variscite.com>
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

