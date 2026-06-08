Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793DC3D3CEF
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929692; cv=none; b=ETllWgUmLveaRAtTdGDVvpCgJ7lQzua2Bu2YeJQFajfxDQaGolSP1dp6e8wTFMHklLVidXHKK+6H42rQc7si6kcuKvZ04Qlulc6M1Y3lwJMSuDgGnKiip2VgeDVb0B4fSHtTGZd0Ul5PkaQ7p6KhGJTk0GI3XDDusHu+HX3StDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929692; c=relaxed/simple;
	bh=wrgqTfxN1F3zY1MtlVaY5Ac6wpqX6/a4+r0hTloIR3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTuCSuboxx8qL1AW396sHJ91Kvx4y5uD6YqIUvx4WCTkW1IwkA/49B9ifL638MJBdQjDfPwGGZ+mFsV1ZSpMKBywbskVIFO7TwX333FfBQqFDxPsUPe8FEEWeXQHKMpUKxsxtw0ycMb0icNcaaMKg5BV4t19qlnYwyEpHrCMWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJmgyNZB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJmgyNZB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eec22fab7so2232379f8f.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929689; x=1781534489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=;
        b=ZJmgyNZBw/zhmGtLI42qBBSS+bpCSD/AtAPC9kA9YQU7riuDs7OGTDkquD5fytZRfr
         jvpKFZIj3YTX92h10kv5AUG+5sBIXEMIA/S7nlTHjDdzPWgiYvVnwOJv6Vm6umoWfQIj
         vtYOFS2k2SjMKCXC9Q+FV4e+QP1yEEnbhXKjYc5EsE1U6M657Hl2pEuKiNr/MqW/H9yZ
         t5iuyABcMFzrRQtfR5pPtqFgpy4WbzLD/OI5ITx65FYOw5NfLvI0szdCP1Tuoz5r/G/M
         VlFG6k1f4l2YduLAx+ts0pnSgLP/DN+u6wXIJZKKwdPOQFm3SOh/pr00SLNuEzxXuEHH
         6dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929689; x=1781534489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=;
        b=slX8CoomDVCWc1t+LJxllmdRFmf3DhgyE/wTcbm8De29IWW2MOt4UVA0oKnKNYoxjD
         PNSz20H/8r8OIxZ7nak8Gtq4QtM2jUWmf/M/52+bQ8ueW8Ed1cwTXqq4HYXZwYOLz4lD
         Bfa7xPo0jzLQ8E2hSqWW2u7R8VT/h+gbBgkEzor9LE9wfNFp6iBfl6vnJTKy3CM4h4hw
         //sGt6K24u4vXrvgcVTuFXyTeHLe5vnthwdCorE/xCFo5/4jFf4z/TnlLNGtl+fC11h3
         kC6Kihodd9szNLi6Ex4dsmLBZTGPI2KaDpeHX493RjD4lT5TbxHvD1RrHSrTydBV5+MR
         rf/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+tttb5ejqDJr5tthAptGkqvdoCunGsG5HFAoUXi0jwyvYr5yc30U4wOkzs+mUFsiYVXx7qlEJhKgAR@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWFEXrcgbn65lJqEGNQG2xnrc7beAKnkUinRzSsgF0ga2P9wt
	whGfM5f3y8B8bt5m6heyeBjFqhYN/BehgWktMmnxn1gHKBFoj2ddcmGt
X-Gm-Gg: Acq92OHbAGagetohYI2MWwu1gktdxnymIeXL5qBhwwhpsPqq6WlqDy9OcZmxlUyDPC6
	KCU9Bpfh3mzhpfON6LlVQ9hQ876QGKkHFoAfFxxkl470TV0RJdr81QhE54kjWHedvakrDe7CEtZ
	5vL6m1bOu7dDvLh5fY/hF7yUtJXPY90SHFn8wS3Zg8acurwQd3M24+nNrVDVG5QO+M7673CtQeQ
	N8yx+A6QVn4KGte8FQILBLacbc2WTbAJPKYaffAKnPJaM5wuMnF+2oL0iJf0T+v863689wntXts
	wHVI0UMl3yqO5mElIjevG5q7aiKj1Xg27qpBPEuCDXMvXaw0jp2Q2lEq1b5mORCxbXe7RupB1ik
	hRrqDarsjSd6PA1pMKot8TrLY0EDX1zR43RZ85dc+hGZ9F7csaw6pLzxSx4ZjMnlvxG8aWR4HK2
	IrbNxHDai26hGloLIDHuQUYcb6hejNLlzVcwttjaR96sdy7QIXRn7VDINAWlZSKoqJ8a37tKvZx
	CXFzXWv+nY9KeDNoIRRQxx8umcESjlFad1SE5eebA2W8u05
X-Received: by 2002:a05:6000:4810:b0:460:31d1:74de with SMTP id ffacd0b85a97d-46031d17543mr22898424f8f.10.1780929688812;
        Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
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
Subject: [PATCH v5 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Mon,  8 Jun 2026 16:41:06 +0200
Message-ID: <9999286d70381eb6637b3d1779197b6be0c8c6ab.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index cb3348aafa07..fdac4ceb4c19 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3

