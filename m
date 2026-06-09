Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A53101BC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995885; cv=none; b=AK+aLJ1Qyt8xWliBOzjmFhAFSpPBUiG04Pu2udYsApaAZ78GoMSeTWZ6enWdbuxBqzskXYJasKmkFSiSoBii9bF1zRxEJSMAyf1I36yflHcjOL4/keXZZPyIsUu8ljaumcJuhakpGWE9CFImREtbjCdFy/xJ6MvFRsf6nUkIkK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995885; c=relaxed/simple;
	bh=d1cjHfpAeYd6BC9II5qFWZZxeG8uLiJgrbWkl1vQv+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdAN/dXw3kaWH00EDHaQWfzzHRURUh+T/YHW/Zcf5nM39N+kyhIeKH6WvCClofD8QvQkLrq8tU/q2YuvKBsNA6gP7tZuLUpOlp4wPRJoQ0MPzP6Br5RgvkTMgyYSARqnph7dt8Mzunq2SJFAyIcWdxpJROGkYJ5IwwLX18YsNQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYgqafOM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYgqafOM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4602e2a0372so3770441f8f.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995882; x=1781600682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=;
        b=nYgqafOMr9Hptp0kitnGIne55fYAJpz40HnZY7/yFJAa7YKaEIKOfdOIwrSrQb1DdC
         XjpiL3jUUtRTGodffooyknBcYn2ePmvEKMergOSot9dK1ct+nN3YpsNwuS63BLshQQEB
         XJcNZfT4fQsj0Q3Z1WNyipmbblz5EJG51BlzRsi7jx+AvW6xcAYkFGq1Zbpx7CAkyjXF
         zADUn2anbys97r4aQ2bh63WZzkHsphWY7V2P28epploYqXDSdyzSwPE+GwYhQyzB9GsZ
         Bx/csqFcM7rbmS49Fw5BUMtW5sVvn3FX12QEwnTJ57fLv7KNWiN3yb8LoeSIYu4fqLTm
         ro6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995882; x=1781600682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=;
        b=lTvJqReqdQCxC0Q7+4Ko9vIwBVer919DoHS3kA4QYMr6dr0O6XxDXdwvyvV9ImeMZx
         zSijbCXl2WZuE50f0Tt4rzNjz8t64y7vJwLCZhOda1t3s18VzRj27ZHob4PqBcHRNjl/
         a1iBtukbck7cUu+LL0VeQLaBdsAByHcE38OP/5SMJu9A1QTwxVX/1rP3oDX5A+JhuGbG
         x08tJExXQkrGiMHVmNd1nSaYSZuBJuiGKbFvTm7Tra13tIptCBf8TaXjadgW7aTDAvDe
         b65msLj6P7lScTf/IPHQUP1xAwp5NKT8lhOHgPJmrdI+NKXBbTtaFTMoixecAUZ1tfcG
         kOQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ELp4OVyg8aUhKSRaAHz+QtCO7ieoNf6YrNdY7KrwkNR0t7iIH2xbHXx8f5IvWuN1s2HUPrT0M1GyX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bF7SAHHSWELzb+IWc/FxNaGisbGxfMn+1f58WjJqlNK+MLPh
	wmGXerd+M5DP+nf2ULo16AmgYS0Atk8yxUidG0rbCVY9SUyb+U3p0eXy
X-Gm-Gg: Acq92OETjlCYfXa89D/pCUSb60q0DxGy2d9W2K3iru8f4kgbMXy3Br1TunbM7JeUXyK
	RgvKGbqhhVOWst+zHTDvFZhAs2BpzdfHUXeF/ZUSxZ9IzMm1bQv3wKRk2/deLiAUsn6j9z22ATu
	3QT6rsDTcYWFEfFvLlX/b0SB5n941rAJN/ybNKSouQ0hriKa5kHX7FzbCuP/HYm8jmP6q/SzOAM
	d3JeEe4pIPmxlawTADUjeGHC3iVuIuWxOY3DBn9Mc4hmoUUzQ2WXIDPTtlbIEgAg8G3W57u5wkO
	r5XmHAjxZOknWryx2GOJ/5dq0r4dtoVDmzc3zKjN+/CizdsSU6/jnJ/Qo6r/3TNQLoG2zl6xY/L
	YNwP+RzYLXfQ+6qz88XBpQiqzAdzURBWxQ2ChhU8TtAphWSXmoTl31XNBp8enFzNQ0+uppkhgjI
	U61ikVnYRxqyk3uaK2pv+oHwk5D+n7Kscc86EEN8hYzR/tvO1RLlJB0Ko4+bhGRm2dscTSfNVqb
	tRlh7axvwt+2DNYn3au3H265DDuACxHdEjq3MZu+6flG1PV
X-Received: by 2002:a05:6000:504:b0:456:d5bf:e24d with SMTP id ffacd0b85a97d-460304eb5d4mr22923693f8f.2.1780995882262;
        Tue, 09 Jun 2026 02:04:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:41 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 11:04:35 +0200
Message-ID: <cover.1780995737.git.stefano.r@variscite.com>
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

v3->v4:
 - Add snvs nodes

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
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 731 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

