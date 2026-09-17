Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BBB5A987C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657756; cv=none; b=N+OkuL+8ifLvBhT3UQEKbP2O7QnR/v4cTaeEiEDR/WJ8IE7EgK1tyl6ykmqz4Nhl6hjmHh1+tVQThtxzuMpsmFZX5Y+2ll7FPuVmc2+IqUVjpOcbBaNKwFdcyIvaqJtfnvLmxFMAzqHzwPDvOqmRWUZ49J/Ti5nd8y+hKLp1Rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657756; c=relaxed/simple;
	bh=TEfy77fQc7gzUcObXL0A2hoFIbOeaaX1tVmcfYmjZFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipl8er6IexN4q2rfFJXN7TjOk2Iw3WJLXkCIeYrMuRHP6rxUzQAoa29K0Yp+6m2agwUNt1obA792hCajpX00SnXT1NSEriJ4yk8GEmwp3WZmRgUMewCJimmrzZa5rh5sMHJFX7T8kHs1516Q8i+1Fs+/CLb0wM3qVVw7xjyE844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm2ZBxra; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm2ZBxra"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so6276895e9.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657739; x=1790262539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=Sm2ZBxraG52650HMKhOWGmrRgClOUJ8MwaMCAOPVzoc+NEXuERuAqdTkcvDirA8NLY
         CiqEQ0scbjSq0A+QBh7muH13ONgDaIMkCdBPqzUVKRrpoArL0kC0Zyalp7M0tMTffJQr
         2iemGVZkDeZ/1AdZO/5na1SHC1P+RZ+tinD1M8QaoCYsjSaKLI9OvRr+clG7dPNBAwwd
         5AJRWoyPgAc/PlbwwHOEeCvHbwWlTdTgnrrq9uSoLxgPmhtE0HMa9MxRLz2OtJKDvPAw
         tNacREIfuxH/c9oILwX2YFPzhRxoC5Do5nulf47uJNZN2JZiXCfQr0ji4Tc1xq9Nu2RD
         1gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657739; x=1790262539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=fFKTGxPh6v6zYlhpH6G6D2X2SrDBPjadEatu/SVWnh8Bn0a+9dDR2Dxw/Qv5YOzCyW
         bOIj3v35lqD9GB+5sugQXuEsqkLuK+QHo8O/TMvkpiqqWyI1+tjC4DagLCbkcr/EZXl8
         OIHrnyJIrxzoYKFRKwHnIerwlyOFWHhX+0gPckXFVr88MOllImKC1G1hI3pDWo9wahb4
         +ru0xGu0OyqWdzQfC0Rl6/Gjju2KF0NqvJc7SLT0mOBYonk9X+QOX1UaUJ2vm1Ohm2bh
         uEH7AFHSEmSFKvGwL5XcfiHzUbsJMg4xMlxvpkZPAX9Zf1dOihoGjCUd32TbZRX/m38P
         vfYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhFw7/Di6zGUUsgQYxU3/1tQgcNECnZvizDSlTEfYHU8ZPVVWZ8iDBHIRC6pJbDML9V8WN7YWKgPMb@vger.kernel.org
X-Gm-Message-State: AFuF++mj2/dRcfTwL8zYM9LrrG5Y1/6mhh3kPelYNcSoreY146W/mMfv
	Uxe/lfYRXjmJmf/jKDdl7rt/IZRUsGzKpxHgN+0Ws6mORSR2W5gJNxO3
X-Gm-Gg: AYBFou1v8SpMMmSWwhXfn1elNC2GpyzvbKz15TZK2Rt/le8rMn82T8qn4dja2zeh/4S
	PcKXr2itPdgaUQJIihFFmTvyftqRPOMr924uFh8+kIeql4rk5vWeWMDQpXfslOoXuVDXXvHUqQu
	J743uBd2MTvd+yVzNfNNWa29q95LgnbMMcVkI/fp6bCVJMSuK/kRA0nTwUjS1uLufq2XTBxHsHF
	BnFiZBZcQ0+EEWcUT7n7/DHc+J0/uwPuUj4Fv058OgDdOvekMjYIztWhl5vGbOS8tcmeNl6o1Px
	+E/a+eFaiHfH4rs3YZQqoHuNnCdigDcH02RRV73k48plPPqErUc/+AjhIXqdaYO9NE6nmeeLJ29
	nQI3u4c6DX8Ri8kp3ENT5X1+V/A/z+86cJS5T370u4ui97gL3M6XXn2PazV2+dTp7mEzjl5ZLR+
	MzEZCgA5ehVtdLRmGQdrwgOvF6wPxXRWd+maZVVQMeX8FdkLbMVDK0ovC95NxRn807AoeMnnojh
	YiXsF2WFJqikgzUmxlb2B5tbUIwrYPzkTJ5bGD71sO3gArfpUssXDQvNmwUBL/zosznAw4IoY12
	9VlI8Ql5ci9dz1d+y8QM0Lk=
X-Received: by 2002:a05:600c:4e91:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49eb72f39d7mr165685185e9.5.1789657739517;
        Thu, 17 Sep 2026 08:08:59 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
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
Subject: [PATCH v1 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:08:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
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

