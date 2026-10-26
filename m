Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006951;
	b=dvRewDTP43J6FWzY0HNEf7aMyPepSTfjglR1GFGd74yhQ2RPJJAh/yn5VVKt9az57Ad5
	 U9iB6A5pBbz4nFgyNwDzWr726ZCL399E6gm26pr6w84Ta56R2G/FDIqej6nVlezt8GMvn
	 AFF6jTRLRIa5Wxbx/QQlNZzXEQ2Q97IuZ0sXrW4IVJjBid9ZEBcN9Qjf7AZVl6Jsq90Ut
	 WLNUKXQyA5PFmPq/RWLEgST72iBuCRMPb7RUuujsN+pnIL5J+GmM6WZYyp5ISCbGj8VhG
	 l8o4o2H5jqUpRw90L1PXCw7psVxPEBEs8rOwIGy//LJLa0vmfR6vbC89IquqbBIFlqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
	b=OWRYgMwvLZlpYu7RA2VUHWJrdDgQ5NGKx4ruRgyjEXkJP9oJWpPBerA5DXfRLJljyXG7
	 uYAd7ExyJBVZTZrFZ96OR9E65IVsegtuz4DpNtEewXWqb2JdzCY5Yt9c1UQ81ygd3z3lD
	 a5YdjPHKquBnLnTxpAic6qDaY2Mh1taCzWWr+d2uamnNcovxSyMwzkKSDSbDv/GQHRP7Y
	 K/vClAQLcl/FNRewCiDWw1TxMjotLStwqnMU6dhrDhmYwJK8qxR4r7NiEK9MewtRWM++l
	 ubkpr8LMS8Fl1/+cZPl3j/QcinIyiIxw6FVNL4s3A2WLmHYRMmG0h8HpDH7l9epeYPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fTCqnJmZ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFF0606A333
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFF0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fTCqnJmZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so7674275e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006949; x=1793611749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=fTCqnJmZsRBXplhYxFAOrUar5/9FwpEu+rdiQIigRVB4eQQKie4OHxu5TCFViIK4iz
         ue6D5JQThOG585rYCKrUQVMR5qHWIptSC+SYYJuQ+pPMTOwyGLWkC1d0Jp5arloi2hTw
         wcC209kO5rlY3dNSgI6lFVjvJxR/Gzj58rQo3ddtI3g/DBcfyjKrqckNPOMesd0VgJBv
         X9CGPij/vQAgye8IP6aDhAG0TPkz37vjYJ2I/mtuasGA7hjNEomOXEX9tDcpoL65e9sF
         fnGG5eAZ99kbgYRS10swnHx8QTEXG6xe8D5GuHwWi3weR4sgSF8dwYbnY/86hmhbaDRn
         fbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006949; x=1793611749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=Mf/4BhATTNoOQD26hP141izxM5GKaQpB7hnhJF+YR7gnsA1ly+7ZKMjT/Izyd6bKpM
         U6JAXmQGsbnZJSgX7nc5aAxu5jJN8w458po5VUIIadM29Fv9GmKAEFod/Fw0f0n5VQKw
         9xRvh9swF5rViQmWlIEe3NPkJLi+3IhwEYDbjXuGG6fYSkw1iMdphzEDPTvQtGy5XP3F
         crumRjuIqZtnhfEM+jz5vhuv0BdbH56lwGSxhRNTQiBqvPGPLwMlo1amUU8hi5ama4tL
         Rd8/6IlDFBPEEDxAon7mxlox/qNrFQXBbbl1i/O6fT5ZPoPTmVmsovA2HjVAceVEPqX7
         vz6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZvjYLZPI2l8acEDly3bmlzi0o2sOoq9b+3ggdEb/Y/ywv/Yr473XcNjWQ0KfQduTpL0jp36I7wXVI@vger.kernel.org
X-Gm-Message-State: AFq9FYKHjREmFZ5vwgPwBjO5beSVmcneffFR8vcfHDm4nECu0teMOE3G
	SaI8yc3POkeId3JfIlDSpEfApZyB9j6o8Yfzzs++zeAN9P96qjYIkLHU3kXosUNU
X-Gm-Gg: AYBFou2L0JuvIubpFmBGr1NtU+Wgv+rJlAm7gNqTv0f2Jt3c6gHfdn3CfCAs56tkeYb
	rKUdOUjewoR+3cO/cA/nhkTeKe19e1Z+0sgd7ePSkq1UZzxPjMX+U+6x9sNlcoCaIP5fYWdRTOk
	Jrbs8TZ7Bd7/QQqueTSMzJFsl35Qq294ScCVBEo2PCY8PdJ2F45nzgtxDufewKj0U3DcNd9fVQI
	SdI6UzPhBbRI/55dSqpuwQwalixsB1WfPafuf0Lj+uOeRDJP0UNtwy4IYkRURWp1vu7TQ7ZiZmu
	JulYJ0qhn61P8C+toOFpO8MSqR8FxrOQbqMJXx7uzZazQSMSDbug9pH+z+3XXoGMWAOHGUAmXNR
	CgHY+c4DBbmcECw30iZcQuvGTVw7CeoMB4mMEWbEjVGldgAXPlu5k7NiyZEbg4gvozM8m3aQ3J5
	WWlmfxMZ2pxiP9zVUwuSU0pgNXRbM20n9P7KEDEIxuKENPDH4cMjfU+Nm+qXH6fTauhDB2Jim2A
	suUUKi2R/yQCDesNRxuEldqt75X4OnYhOx2dlAHKoQueEkU0kkSmcLrTpDk+RdXEQZo9qkY0/ZC
	lWNs7iuOAnGY+tLeM4mbemxWdOBkgLHTaZHJOJS1Es+dw7P7VU5B6aSyFpRKa8SRg2NB2Abp2jo
	=
X-Received: by 2002:a05:600c:a04:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a7555d89c5mr4396695e9.12.1793006948732;
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm187356525e9.11.2026.10.26.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
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
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix PCIe PHY init
Date: Mon, 26 Oct 2026 10:28:58 +0100
Message-ID: <20261026092858.10591-1-stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

The PCIe PHY times out during initialization on the DART-MX8M Mini
with the Sonata carrier, preventing PCIe device enumeration.

Add fsl,clkreq-unsupported to configure the PHY for operation without
CLKREQ# support. This makes the PHY driver clear AUX_EN_OVERRIDE,
allowing PHY initialization to complete.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..ccc81e5b3d36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -267,6 +267,7 @@ &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
 	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
 	clocks = <&pcie0_refclk>;
 	status = "okay";
 };
-- 
2.47.3

