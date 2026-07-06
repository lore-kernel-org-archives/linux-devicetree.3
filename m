Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4573423782
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330517; cv=none; b=lhY/IA2StlgEnsBIzuxYAOH2JnT+8EDEV063LRloShUFpm0oIhdqLAcZQdxoIeGDeyVuzB4cTodNdxjzpjIqxmWvuOU4gbpDAtL2z3bOFpImiuv/SafTkfc1U13H380p79wRKqsUbvdQfX/2bz+zbt9VS8LCC8CpSV52muZt1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330517; c=relaxed/simple;
	bh=3O06oozCuT+TwuN2glHZbbQbB6+qN9fnq5UtKepRLIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3W/KrkP/jt5qAGCT+Va5tbUDCWWXHk468npunGYcxvxqGkEMi1nYRJyho8bdiHNKZQTTWEsIacFw15bP2YzOx8fruMQGQVWsQAKoBdT1NJRp2q34yRKkoE2xEtF2VjnNjeQRF7tbvEvyEDdvgqhHSIw1uTjQoOcfwpMce4m4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2PJvX3d; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2PJvX3d"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so18842445e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330507; x=1783935307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=;
        b=Z2PJvX3d4v2wuN8kcYmkvdUCVDu6ylTsGv1h1/nR16cPxRJb6LemPqaVa9UAkCDssM
         Ted+h1VUCvamjCCY89VHs2LvF3j9qXvqhQZDLcAUC2O/hoSXwL+TpFMepuzDN8hsKuth
         Oq02oisjl2suEi5kgXqGsNmI7R0QAGCPLUs11M7M4a14wiiqniJtbPYr7CMdgCTF4F87
         24UzYhZZ7ePT9kAVnfL4UYXVAwzIv1BQPFknnM4fiNtXa7FI/EUoHrNrvyhiKpgAcAXn
         WQwiYTHUDJdDCIZl3DAX2P4ilH3GhLoOecwbSILTP75jUF/9fNTr34lE9+RzDJfKUbak
         vYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330507; x=1783935307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=;
        b=EzRmXf8PvBvHdzuXC6B/wcdFYCtuDrX/IZEBbx6bUEl3ol2JMNwNVlZGtEJjVaE7s8
         oKl+QIFobtPp5Bh3TaaK2BYokQ2fEpkRkKDgNTJD1cNSNzdD2THjCXr0yyQy8mHqHmvo
         yZnV4t+xz1wIfvk054xcPYAo6WyGi1KrC/GVHeoCMBFUrH1A6oaPYwkkkj+QqwLEa/OE
         zmOx7jXjULXJSQUo01JX+vArMWrfoiY8SmnePD2O46Mm13iRrP6FMz26KQendscHc15o
         74pmuSn4IXMImJ/pKjJi2Ylg9EVtThid3FceLE3+G5QG6X7i4oLe3wzOw67kO63MwJlu
         5A8w==
X-Forwarded-Encrypted: i=1; AHgh+RpMteNjpKdKsAD1eu4zRtXJ5Q8f7qH0P/j35TJ707sqrzLiFe6svBlrS6na5b4SkcNgzfsKZX4+gCaC@vger.kernel.org
X-Gm-Message-State: AOJu0YxEvSk6d0+chyV2nFDm3/SXyodnpo9p5UdcA81yOUh9IZ0IIk3c
	S9E9qJmOm14bZx4Vb71Y52RTJM6jEjPvdO+yCBTrSTTu3aBLACO8tRKi
X-Gm-Gg: AfdE7cmdXH0YEZiLAdHPRZFP/qKPRr5mPCkO33dRL6AksoiZmyeIDCvywdt2RYTovkA
	ua2Oxma7eGjWZMIOpFEauKmPeudan5bK30+PVG/Vwf7vmCQGr5oDijgF/3+I2jGvZuku9GDdAtr
	OpAyCGA/aXDScHc3MBqrA/3cfkURvWc6ath0yfsbx7QEIA6FywGFBC3VU5dpA/EmymTOoLmR9hF
	K9nbUS+KRWZAckLGrwNOF5P0TeimiB3RQGC5kNs36hh4LhsPpe3+XCqBu5z90o/P6SHne4UeezV
	ybKe0n9sF5GWO+JxDEhFHNN/V7GmncrVS64J5jF6BRxVla5FFJC+v8JEO5vU75X3fvTStnfAA7l
	gozD875Y9/Qub4Ks4A5wHkPQh+JtN6IVQJ9F0SsdgYuMPwL4FdXztAajGtFslmLwICL76j/wXSK
	3B9ZtDwLk1s3qsgiVFBb8OyJMOZEj2s19R3vqa/VYvP7qHqyFSDmxM5TyerH8b4gIiQoxvJpqJl
	eLCsU0IvzeZ7BiKn4MX/c+pQw==
X-Received: by 2002:a05:600c:46c9:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493d11faa18mr95203205e9.30.1783330506886;
        Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Date: Mon,  6 Jul 2026 11:34:44 +0200
Message-ID: <e7b7b016bda85d2d3fe3e804ec868565049a3791.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index ddd4651b35d7..2afb5b438b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -217,6 +217,12 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -310,6 +316,12 @@ MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x16
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT	0x06
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
-- 
2.47.3

