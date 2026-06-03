Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061F32B115
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488003; cv=none; b=tAD5GQudWSX+n4i7t8QJnmifhGJz+mgT1XeTZM0HXmygoKwJJt9pVbwwqKkhVbQSQVVZm2U2u/TlQTD8zg4Y+B56Ns8BbAtq/JY1g/Nj7SX+2qaXUsyyp5xPpHteCbbgz9PF6zuVNudz79Mym4wJlMazjexqXGv5xkGRT/Fj044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488003; c=relaxed/simple;
	bh=2bztmfxRC35dkpNeUlC+LLm2zp0z6m5Fiy6if2HTKc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WNO9kYFmDvXUNna+j7FPQWzMExGpfE7b2BYU/3xMpc1yIFzNl//4gKXnFwXZwscrO5lDTDgIKVT1hF9BFdv4/aR80S1qzncFTadXcZuuBZKXN3nFiTdZ8AXDvXOurKLluSn9OWWwqSmtRiuQlZ9cF2IpeADQCwLx4ol9mDSYQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkDXdVf+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkDXdVf+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b7866869so7372455e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488000; x=1781092800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=;
        b=RkDXdVf+lGSVyLO7b2ZWq/gaRTMV8dloSMIlWMyo8GZfZzRE2RifWWsOU7stQpDSX5
         Prz9fC70OVCKoMr3Sgca0f9DopAJ7QNxzvvs+/NWqmsammx3RTHnWdjijmLJBdn6Ykq8
         LyboaPJxGIYinNEowHaQTLDPY04SpDmnqJ8z1Xu0qFeOZOHKUB/iTtDlb2idRRDZa3dq
         47+qgeXHuuqSizu6zwK4imS+tRwMVUDYn7iAvNfQCQPDu+CqCXLa0MgmaTaiXjJ2nqyP
         hETM3URg0mrxmAFpJ9N/WOvUx5xn8kr02z33wseq4YQkw+IkFSp7/idDNnHbU9MT0OX4
         s+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488000; x=1781092800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=;
        b=hQJ/718pF/KJbQ1MsNJ5UBZhQH8p35XldrcaemGneJWaBy2Ut+d2i0i1iJOQH7TsPF
         VtcBKKXvvJaP5ILxPbisbw466gats0DxnPXVgpNKl9AX5vP3iJKFLElu0yCm4glbQ6Y3
         3o27jOPX4GKm3iRScxuWdzZQUa7BUzueRz8zc14wQ3KsEja+n0LWM3xtYCM/55vqakGB
         F+wbqoQyWXT4bTRRI6zseM6z5GqivviAqKPJ7i6bEkTw400LlvPSsMLbndBVxZQdmGlS
         tmSvngwy3eE8FTjbcJVhsHCoxWaqXfcIt6PksoCBM3z9jYFPGOs3hITfPfDIW1c+BmSD
         h/8w==
X-Forwarded-Encrypted: i=1; AFNElJ9Eqo3Yvw4YSXbWP+DMaU4O2vQ1cL+uO2Mr0XpCk1GLzywe3z4Af8rxG/wQt1SeIdPPIV49TJKT+ysb@vger.kernel.org
X-Gm-Message-State: AOJu0YxHuwhozg4fbqVkxW5IDtGNDBul6A2kmnMgM8XgNPpVzvqEp/sm
	/YNxkDZklL7suozEk/ti8RPrsHiTcumogJtdZ553/jP4OkbLpaa3V9B2mGASQw==
X-Gm-Gg: Acq92OG0pkLzuwRizkdYB/S20RBMy1R63VjMsjTdRRRu15s6HkHMGoTLQ055NE+4Eox
	k7R0rRt0R4SQ1auG4PgEYA3hJOStsMmMCY9hOJOmXRVbjKiseWYiR2KkVGjwNJdKzYfUKST8hmj
	DZWqjr7T6PXVv0CHcaVCZ21uMr+UQ05e0RAn4Y1ueFM3sgRmm9PtKhOayfJ+ZtcRBBoZa0qg2G+
	SxVSN6prgagGwpc0a4F6XVD8C5lNOqBO0X1t9D3WQXm7jw07klXkPDu4wlSOzhEXdxun+2ltJEq
	qOniJPbQ9QJPzC1l2jYA81hrppjGNx4bp2DahJlTQJMaS7gk1fMKUoYA6hn9T6/CxBac0YDQXJM
	vVOjKDcYfUp+COnuo56g35rM+BrAlI+0ZBQBWsWrGfzZK8VeJG0/AUzDLTNex3msFimIAOEkvhX
	SV1RUHmhKDshoZsQUkL56LGi5zxdAmt1HAWTS0s7pJus0s+re6Zb3iLPkRMP0u4XeEPGa0xpusZ
	vXZqXMeQ7egDeb0P+my3/T6Q+xE+0Jq7MU0rsV9x3X24L2U
X-Received: by 2002:a05:600c:3ba9:b0:490:b072:1be6 with SMTP id 5b1f17b1804b1-490b60f6d03mr55331115e9.25.1780488000209;
        Wed, 03 Jun 2026 05:00:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:59:59 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 00/12] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 13:55:38 +0200
Message-ID: <cover.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

Stefano Radaelli (12):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 307 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 317 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

