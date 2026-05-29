Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605703B4404
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049479; cv=none; b=C4Z2X4WzqZHWJXIcGxGUnrPZ05mlBTR81UF4hHEOm+tWNWP9nDcJi23ZEll7SAHgWJ9D6Yv7Pvox8YhZhFEJT6UCB/XL2EbSvh+NzvgwaeeayEOAMrTP9uyXHErn3vzy0rmmtckdvuijAxwQVjIQKhC0VRgCTNt5h3eidatyAB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049479; c=relaxed/simple;
	bh=u3Kn3BbHopgZ8N1at/4YA4/kx1F3tekLTMf7nyhiL+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maxx9c8B74weyElcKTsPay7y8Xv9aDhZ2seIBJpk9XMqT6WIv5Y+IjQWSYzpAj+N84Kl6uuQebZZjRmDAp1mN81pWGv13p2sGPtyiRQVnf27kw1slkj6gN3Yak/TIecT5BK5pGc1UTzxdkzz+1YMF0TXpqYqLRv9YOmTngNrrFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixFZk6iE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixFZk6iE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso69745725e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049472; x=1780654272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=;
        b=ixFZk6iETI2G/fyaOCQMnZzdU7zltHMvulBshJeD7DGJBIkalUgrhrCGFm/L0eU5ys
         md1aHdIpYnuMlXpoNaItPMayBwiVWFNXRvepq5dFs26OkJUflb3pLTF1Umv/5QhuOq7d
         blTuz/yAwNg4Yv5JEi7tfa5dFgS7KQC/INWyagXLfH+IHg6dNVJUj7RnhiMZGG0MrZRQ
         mZt+e/VIre9FQWVY4NdtcGOK3ekWMQf347peN2sNfWwJRDXPk1oEGdrhuuq1BjL0HFnk
         ghZ84DQZuUqtdugUlL++X+XhZ3x5G35NQudUU5gbnCt6yGwXV+Z/9g8CARMAceFsqwrd
         GJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049472; x=1780654272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=;
        b=NcanEVeEzno+8v9o6MwG9Px6iGSYkRQlt2I80GnGWXPX0Le8t2pF1ErZ+eHuyTZZkY
         LJtdH7isyiyBwO8BTaSgyzsezg80h5Rc+Qp16RhkoiREzMANzvLsV9jXKhJkfP0OS8L2
         vLN9QFs7mjEAjTw4AeFw/3aBGnSi/+673aDg7BsIjDZwUek/PXy1UUC/qqGsgjK1ee7W
         E0RPT/ZgA716EvmkV2+PWqQTRH41S555F/TIpCsJxBGu+qxOTCjqs7xUlWqvjB40bqzM
         Bea5OpIoXJiHnvZAc946JwktgGuCwh34RiiuE8Xivi3j7lMSE1/lv+nsnk+YEG4STKii
         NPxg==
X-Forwarded-Encrypted: i=1; AFNElJ8Pg1dmzyZBRjg34rHzFp/jIwcGLuOOF3UAzrJw7rXJWpVvNXjs/4xrqYv34gmv1W3HZzzhweDVgQvD@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlEIVI2FA3Gxni7fLYcRfOr0n0dMpfiLwuPWmRDwP+3zFlRtR
	khzrIKxDpnFO31cKNo2W3Ab84qvNqgCii+WQcnk9SVTdCocHgchmNDRf
X-Gm-Gg: Acq92OFFx7mxUXTq0c16EgA3zZhLhdyvB084XkOUbM2p4iqwVSQ6AC8cUSEVqhYDvGS
	PEMLcH3kt5QcUxhAm/G0kcR80U/6fhh02bQ3s1P+LApPNUeTAFF7n0eicS/2YwIKPGiKx1m4JjP
	5y0LNd1c52fbqyi6YWQOkvO/OGaev8nwO3+kZj38GoHyQ583Tf+eGO+3lSr5G048dYv28lkxn/D
	2S8M7JEC1M4eborUhwuHeKp8bqdy9lU7hChlN8jSXUCLT9OP3LrD29EYjGi3F09/QRgABnahRnx
	RMDO5jnTdDwqPU/VN8uTOss7CUePJluRhuSMqnllgvydnmtACZT6J3CWNLTAWFzfIMAYUQsFZ9+
	4UIrh5vncNcf812p1Uroa7TGPzID6uIdKp4IuRT0oLKzKeQozviz8OjEbsXhrEJPe3eDVeayIdH
	w4x5Y0tuIQVpxXoK7LgfuVXuoCUx2iK+rN4UOMLAmTJzrHrbOCFrJkYQQ9C1wVurBTcHP4/ItFx
	VdNAYv9qWY2GqffbRUw2YsbtiZehsbVNDCG4Mm4Cu3SUxo=
X-Received: by 2002:a05:600c:4fd1:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-4909c0f1062mr36191365e9.32.1780049472453;
        Fri, 29 May 2026 03:11:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:12 -0700 (PDT)
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
Subject: [PATCH v1 2/4] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Fri, 29 May 2026 12:10:49 +0200
Message-ID: <bdb099af08657e35b81a15bf9dc7ae2b5328c612.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index ea996a36b022..a5fe8432ae59 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -310,6 +311,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -446,6 +453,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3

