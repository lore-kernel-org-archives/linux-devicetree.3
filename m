Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A14E73B4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659714; cv=none; b=BeKDfQaQXC2pDgABNUtYdXRAOFrZbzahudpkqhdX4pa2Px5l/A1yrgVPNKEO+AlNSwU7hYQ1etonCYkWgwT9HS3DoF0/1l9CtLTF6NS8KLse8v4/I+n1gOB0cR9i9hZQ+nnK3/nTLqcP2EH52MYGveA64lkzByYVQkjTqrzekco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659714; c=relaxed/simple;
	bh=VGQ7i0rsWlHK10W0mC5TJ9kvAaDRj77XeWPsthYR2k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOx5sgZOQz2EqqpXyP3Skat4Yqb00SxBAELMu74+0Xc9X8WYjAOEZ/SGL6t3ZLqHSv127NVqs+Zos/pF5nz7CWskDr/mtc2u9jup1b9coWOwJ96xsgBh1+LLARjNE9ovOiJomy+QZdpoXFroqEcXuagoTYGKvBDbfw1VUy/hzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVL/gwOm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVL/gwOm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so7404335e9.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659702; x=1790264502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=JVL/gwOmbN7dbw2jyPCsk5zA0J0lVl66D0eLyToe6JI4R6UhMHXGBnu0JjW1MjwlXk
         uCuh+CKmj2R3T0uIRWhwx7HlyQXpjp2/nDhMHdnumf448I2gzirW6E8aTCZOCvYl2xFn
         9Tg+AZZ5xcVVZ53LFNedpwySdsLSnaAHaweVeSghIIoZBjTyoT+zDJuMEGyjQ6HLr4/e
         FJLT8EcI8kXnEuw1Vd21diRCs9Wid0PJTtzDOIGbvAF0D4Kar2FZ987me6jkCI5yEP58
         NF4FXvkGhsaQvMK/c3HrxQobHchkaP+72uUPcTXhhGRx4g4aqZZ13n0SgZPSL2nkHrEG
         56OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659702; x=1790264502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=ODc1tREugXqlxPwhGzUoFufy8oiCAAbFtVyPErd5RRz0auhdOa3zxJeemIBBx36V8c
         qDhghDG5zlUkxiLd7IYROtSPW8t140lLkO2NYAtC6d8ddPmccE7SEnuofpdkcz4w3Jz+
         JrZ0Hrrabd10Vg28q39o6r5SgUghRarJebdLedKJJE9cFjNytHANDs95ZjBZfao+gqgs
         3M1ZZgSIkdES/aDMqWN+Lv2OTV+KzVa7mzvprLs+V38kCxhs6pHwj0ypSpDgB4DwVWQN
         ikIvjm7GSabsthaaRLg6JpATHznkT+c4FUj5/1lY7b0lddhWxcJ55yuuKzP6wEtRnIfI
         ue3w==
X-Forwarded-Encrypted: i=1; AKwUvByYYjipCqPLtMS1anD0bxzaUhU5ffcHA6HJG+jBk3YzfIM164eUvbJBTNMbZbLA+KV4V3VZRMIILmKc@vger.kernel.org
X-Gm-Message-State: AFuF++muuRXAAzwjMsHIrXz87m/F/8bWddyv25rOkd/neRX9cRyjzG8g
	WuUKSPimPT5EUTBTx401hXhZbfpDxL6Zox+cDzt4FBTaBCabwBZvLelbqJqi4RGr
X-Gm-Gg: AYBFou0Xe1ZxluNxrCbEwj/iZFS7zwid33GjPZpJjEUJ+zzALrcafzE9Fxq1RLcuuv3
	A99/vVLEz0k4vbbtB1iTZQIRH10IEHqZM/rbMPhyyGA/SMe6xsCMQaC73rzrSCwEvjatDD0+EsI
	W0lSpoHkxHNjC60waXFZvmWeue7sOl7xsjrsF75ScVFNB04IT1ozJLINH2WLMM9B9nfNEiioG4C
	C5sKx8wwDhQ+hJZMvlaqO8c7Iy2RujLztZSSBd7NT9lJ6cFZZc2l1yn2QK7vyleZ7re5Ga2XRgB
	7fBx3D8miTnW58750ZGKBZBfyZYux/YEIhd7cppiDJLxmWFtIqac03M8AL7p1QgvOezn0DEU4Yi
	w8l0VKHe0dy/eImCxekspD0yNtfA661IoiQqHKJwGJFRnm8nh6IdIxcgXWxLeCU2BGwM/64WRIb
	/9xXUAZz67LXiigdaVrqVWgMzhVoQD+NR3je7F0UCtOGYA8PN6ULMv77DbTYSeplFBAJN0+Qax2
	Aiycya/x32EsxxEA5/aAq9+ZQG+wyoUxYqR0k77u4LTAifSsgpjXtO8MhiF1f53taazobQAxpaw
	Syuw/34dXJkpSznj4CAw8/MtKoK8TxA6
X-Received: by 2002:a05:600c:3b20:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49eb733ba12mr88495725e9.33.1789659701524;
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v2 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:41:28 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3

