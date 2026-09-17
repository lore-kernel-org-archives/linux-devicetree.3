Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B7400E1A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683965; cv=none; b=QckUVsVeYPq9jge9BeP6ebUbsPT6X0jTWQuvTXoAIkNtyG0IfQWoXczSEhuWifZ5wVPtm7ObuOQuMLsHUD9QwB+Ndhe8mLfe645+wgvI4htpkpWtLNcmGfAEsB58FvkdPFlQPGsAg++7TWJrVkPWJVZXnqqbJRUP5psbfZ0mN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683965; c=relaxed/simple;
	bh=PPUQzK5TqVbrrNTNE0CnhEJ8m/zbeT/JzkU4m//5RaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxzefUaCi/nRun3J7/DrLVYOQuRU3d6c6ixYIX8HMBVsaUmQO5jNataWtPv/6mH5o4z1oB2vtYShGpuP4qIsePIMcXBr2AXwDjmNlcRm9SSLkWTX9plav49qW69Hy6GubWewFPwvLlsvEkoMoCY8950MB5eKq+rEDN8alOcmlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKzmNN1m; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKzmNN1m"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1080755e9.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683961; x=1790288761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=PKzmNN1mk2HTpdwx9gCEfp085fXixXBaj1g3pDxfFWiyu/EwD/8ut4pwh3872edRpw
         pG47wafN98dmPxkssvZhgHswER0hIqR7cFVMvG4a2abRxsVOLrkKX1KK5zyWeu4P/mf2
         ZjWjMHEkogc3urTZTfKlg4zAfBT6yqxQAvCooG8zNaQJxGLyXN/1xGUeLogsDCFMV3B9
         qX/6+Bxyzb2Jx7qqCSrefLpCJQuhhHMJnO9HtPnict0yOXrT7b7ycIH2HOAZOtga+7V/
         YMtEn+uLUijiQDVi/HA6z1NZqoGDCPutobOVwSNjna+amZ1Hyz83mr2qeMO+tRMfxn6O
         eLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683961; x=1790288761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=S7K/UT0sVTfX0K4R94d2Cy3d8cAmfaVvqmQOHzkHFhUpP37W0rcPLwcWh1oD8oUTdz
         BkCdoMi0Y+B2IbnyP11lxtvuTG0l/oyT5ALrgBMgFA01xae24Lrf/gGzU/xMDfnnHIpQ
         fgKZjpr3wiP9p8MUQa2Jq9g0mAv7oJUO3lmrz/V+Mcn6Y4IqN5gmZmMROdd7Xq6u9swb
         c5HUWz9GCZRWIyZ3m8ZUHe/Rniu0weRjW9pmVd6sjT29x5XxK1FJ0Gxp9G2yb+mbI9jR
         gC4RSNXHKxrTMkLtO3aKT8W+xxbHd1+AVI25cXQ409xmjG+c1hxqv4Vz/StTEiLoB6P+
         c72Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqpu71uFZbWcSUcQSrk9wRyFkQxkhKy5DzBRUwiPeeSYJmX/D+dBlymn3DFVRi8Y6juDL5fD5MiJVD@vger.kernel.org
X-Gm-Message-State: AFuF++nMWlUYZxGum8HEQqOL9oNHrhWNKFJ+pWPZZwafVv9WagDsD4hL
	A4e2L2QZXjW7aTVMW+6hr8oDotkwy9JJpXBIIGtR7t34dg0TIwSc1rWl
X-Gm-Gg: AYBFou2UUSQh9Eje0kb1nhFU0pjHu+ybP2RpfktlEsfP2iS+N4y4vmIH0HU3LFixcFZ
	eYu4bHV90XfJMkKTrz1h8zND+RRQeD6v/8dyPbv8nlFdiRoeMomc4gkcC2cXQL6rZcjhikoPIhw
	Z9GCazFq1BGGOhIou5YX5CA68qJ3KAgaXpRAX1uDUqf05fIYmlmwR3yO0KEAF4/t2YX5xghJ7hR
	PExxl6wfUkUA84ak6CjUKQHSJX/ZO2xnkhlCRi3KopfD8jlYIVDUmujDIfjSFBnYolNooWK3iB5
	CZbO2B3wdBc7lnoaaYVyexJl1SIORBs8p8hrBhRYhrXNYP23ODISVq6kEMgxlukjom82Dg8AIhn
	HRPZHhF9gzSn3W4Fw6M5B3FfF7E3XeaKZUe9Rnh6lmMy+hbPWWFUNKlJLR9kT1AeNBhaVDzUP7D
	6KpEZaCHdfqHy9XrR7HJGgXN7fukl5ptmW9Iq1Pv5C1dTIcovOl96g1bemlXLYVwQ9hx/foqokB
	TdaZdtBOXTCuqu0Xl/O3Xsf7gHQfmNrbjrACRYPSxJ4Wqez0PJhi5wvnjWbkqd1xSul94889anI
	fpENzi11Kku7rDUV5koqhA==
X-Received: by 2002:a05:600c:4e53:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fc5757378mr3630865e9.30.1789683961158;
        Thu, 17 Sep 2026 15:26:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
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
Subject: [PATCH v3 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Fri, 18 Sep 2026 00:25:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
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
v2->v3:
 - 

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

