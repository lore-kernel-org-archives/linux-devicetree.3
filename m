Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5213DA7C8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929697; cv=none; b=XlH2P2TT13BugPmtqQwTNclrX7sRrjwMfSVHZPKLB7JJHR7Ty62JV7qOkv745t+qlLIIi291dFjId8wMzsIm9wVMntlrNwWUG5/24P3IA1YawhEvvdFMWh4t7Q5OZzj61Bkc8ZPcowWbpPQVDpojmDLRh50cX2Wfn7nxTDGCgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929697; c=relaxed/simple;
	bh=pnVS6NpVgr5Udx8TT470FrkIwhtnGokApzckgFTyCtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHmYypcvUIT+QOYeeHMggJm6I22YJ9CwNHOzfoDCnx18243TV+PxZ6KU8MUHzkwpCNxOrk3BxQvOukXMyPFNEC1pYbbjoB57uzHL4Np5QkbyFV6YVTIAVQwKCggVyP5Xsf3eL9x+dhOBLM053QyLI1BF17QGUO5c+p/1AA9Kkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qURF+fev; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qURF+fev"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so49669515e9.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929695; x=1781534495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=;
        b=qURF+fevVDuLO1sP8CdBmd6kgQHGfaWKIg4FiLZ06cR1A3I2W7jq2h/qz0FkS2aSFF
         baKh+lBcIfJTIoo/chynfjCMiF2WKtiu+RF4PfCbc24OVKGE6prhN9lgvKx6Kewvn4uQ
         bYq6vZPC5jmhi7GNiAWrtoc2+samOyYXvXCpC+ZQIHcivtkQ3t8Y8qMJ+MlCDNm2kOmM
         xZLJBbV+CB+GhIrEUjhHMo78R/kZsnz5wS6Pq00smPj6M5ZYBb2JGH8TjDg3GHp87Nxi
         vyxVlhLyYGTmojc42wIw382EpbK4T3bApXS9oMWhvjAJyGyzdXTRmD3HRjivfxfF8zlZ
         d3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929695; x=1781534495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=;
        b=JjtiJcH7DbHWBJ+3LoH53PB473qPbwVgCXJj4WvZZy2nF9Q9RN1lLorWcT4i8IP9PJ
         3XjQ0bLYvGofQ2MsJOhkoCR5oLMkzP1tI0O9GNd8KYpzC4HFrstKpEAeHUCazdOgjNv0
         EcClD1o3/ttu3s4k8Gl1At/sd93kYo6V4bs7HsFR+DXDZqN+uzsCf26cMk7Am8Czjqjt
         RDNS/+lyDNDFe8YtvsPbxAKi64s/FZU6qI6hTAu6jE7JiTSp2XsfVVppIEdVT5xwFDsg
         0aEksTXyYw6quZTRN1rs3hPnVKYr2/DJI+hKfH3R8IgyhzUqcurhDDNGEBR4P5ftZE5b
         0kNA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ut7TbrWOaXFXmY05yRD4ZsdjQF7n06COsyjzYsA7B/b0cvhalwkEf3IhuEBRwWpHblP2RDYJHzT76@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qgmv/BECt99wozdSVQWO3n/9oVZoXAPybO0hctQTerjAYnGs
	QIVqtkrp2T8oQ9k1P267+k4uFYKjJjG12rDH+5iT+sC09Rp+iemQzkDr
X-Gm-Gg: Acq92OHOVA9xH3YHlH3uyjr3ye4bS53plq0NEK/bLmCZbWOuTV4iPdb8MJC8y27w6tA
	CNMlIRocJKE5UQTfe+X+dVk8L9G4fnMpel6zYpk5fKIvVmP2b8rmFDnVMgppheHn2umSvHWrq3b
	a+syRBkv89t8G7e7rgI7BwXnhLr0jZnc+0WnXAONyte81DKJGCKl3qFCbSkwelqSSm3aK4W/bPE
	yyhHjUo+IQ5+1JaLADOOpyIGBtenshNAtuD9w+eDbsIutp8pV84XJDjOLfcXIFwQdqH3h0jbdY7
	iLkhm0ys8Rhk82zkW331Kvwh6cu090bx+2SRg/9H35LvrsWs284Y9SAdfmKoyXQnHHHAlb38xjD
	mNo4q4YMbJll1RyRsPxo0LpjC1HE+a7WpvR3PJTRVZXmMDz55ojEJJ16bzcFVicFuTgjWyEqsw5
	wWujjrh/wyjP6QSP4gLsO5YDeqOdN6gmaKunfgqMFomxAWGeAJlXswotqbr7A+aEjYplfeQr09I
	vkWg/Vv05vgAFJtAkh+nuIuEWZo+b7llLV/NkUE+1VRwAta
X-Received: by 2002:a05:600c:34cf:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490c25b1243mr281916035e9.12.1780929694545;
        Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
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
Subject: [PATCH v5 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Mon,  8 Jun 2026 16:41:12 +0200
Message-ID: <909c174cdbf73440be3ffab5a7a2a60343c99940.1780929317.git.stefano.r@variscite.com>
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

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

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

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7f5109bb4182..54cb5725c4bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -400,6 +406,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

