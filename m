Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1B3CCFAE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051978; cv=none; b=nTSWRrEwE8+ja90OO7K61kCQTU8vd5v2Oo5HfHaUWsPgsfe+7Sed4/1jAjVzM78oSRNbiJZ5NOWjwrtcTHPYyl+D/QrzHCv4PL1lnvMdNvXp78gtH6wvN9SHHUmnVB03A2sWXl7963rgZzE/RSlPTSbl5q+mgjqNijdoo3vzrgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051978; c=relaxed/simple;
	bh=He6Oh7NxM5VyqDIcLrCUKW3HzMUDzlOLD3pIWKgkhLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQ2KR2IGBXHQ0mncSnTBnu+GoCj1lCqU3Tu671P7GkbyGgk36/jkUi+HptC4BsQwgcBy/jI56i1NXgUmfXQkVUIRKPIMjeYNkfayafA3NKFyaiEBSc6LQ6wfTCGMvghbyOvKGq+7YUa4BbK65CZw95v/5uqgLlyZTh1GXnY6Cx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrETFobL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrETFobL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso48118375e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051975; x=1780656775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=;
        b=GrETFobLoIFOniz5ikBRVRaV9GuH23cdEZxBbohatSISCvjwH+Wc/7cFCPOS3yE112
         lV+/MeiPKt01RLnrLLvS8HZ6ism3MJy1Xa5CIrPwjwOND2py2wZkltNsPk3c+pKAg1xA
         DY9fcTLcYGdAZS35hE6NJS8n6NSx6IkMsteZ6mmlZc7nuPrk4x9QL6I2JUxx2jfIXdy9
         4IaeFZ7zfHhOjd/0NEx+xV+dvhcdu5Fm9Ve1xRONiP3oUOqfWnEL14OaJ+ADm2yIRou4
         putR16CgKz/dw7RsKsmVHOMww1FbwBBeHXXNgi4KgtGTLyMbpg9UxBfNPUsefEIqiIwP
         gFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051975; x=1780656775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=;
        b=hGGpLLHdbc44lUG+hg0OxGs72ql9Kh6dY63geN//O9YEYLkP5kdOY0HQB1J62C7fHa
         I0D6WuKINEOtwgyIKe5lywfIPXEjLbhbXo65mDL9Pe/b8zymoow8YaXTUv0NnoFaZX+l
         5U5BnibydGWn64wWVyQ9So0nNcpy8qABPWNfZi+sty+bG+P7sX0JU/aIAB4Ln68XwZQK
         vdZuvqB4VoVQhutfT5uH2HabEMtuE1ziEQad18UGlaIxcCrcyS1Wbs99O92h4QdS4RDD
         62dE+y/PtwaStzlWeij4BhpJ2YWksImxFenEL3T1v1Jp3bdPGh7IRCq/5HLxanJltNFh
         VRYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fl3QE/UxZmLw6Um4lKVlRfDXCWWfCas1Ciaz11hE3dFX3+MK3bdnNR8Uod9zLd0b4thVlryIVk+yG@vger.kernel.org
X-Gm-Message-State: AOJu0YxhIWqqPerGifh7g3bKPjyQNJ3O7mVifpZaiAwJe3Y2kUAEqlHd
	/EPcgWg87bbNu4ajpgWAfdUMNHs1MeIn+T+yqv3UoZpw+SRR5UNtC78p
X-Gm-Gg: Acq92OGVu1MFEoU5zku2taLsAhYcHEsgA8tGDJpQbqbk6MFTmGQSwhYe/OPg+usWcv7
	aGAgmSgm6VBBkjLCfC/UTr48EKQINGX4agtZhxUKBbSE7yuolGn2VFwxHmyNF9hoF5kWSzS80bp
	fCcyMEORjRg2Owof0T6g7fQJIqqfqUieu3KGB8G06/7iD4Iw/CVLrbwdNKc24XRFGY8e6P1G2uT
	QrxLYLvDtqLXJSpCWkHnDcFs+DswDcJKSeu4b7+Vso1n88zzp8Z1xyz94j7Bx5hsgNhOqY26uSU
	Wri8dNIQqplk+ozPRg5i+dvQagvuDNNjSOwUCzhozR3SMTOO5P7pziw/8b44Ssrf07Jwz7jrai3
	VbI2a6sRAZ1jA6YXqEeNQkrFtMhusnlxjyaR75E+tKW+ge/3DmT7pzIdyOfpZHdvrvYcmu3U4LD
	Mi6sDvOki/6C53nF67RtuDw8lGXs6Y98l/fKZjLMOdawfGZfJ+QrZi42BV45Bur7zuJbTQTwAne
	+hoaRISbqSdQByaj6nwIuzwwDBSQkj6kA1FuUArOq4FjnTb/SoPCIUNvQ==
X-Received: by 2002:a05:600c:1550:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-4909c0beca6mr44279045e9.24.1780051974848;
        Fri, 29 May 2026 03:52:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:54 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Fri, 29 May 2026 12:52:47 +0200
Message-ID: <a13b3122e9ec41f966909281ac2a801689c7b98e.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 37bae4913bcf..a49c8aebfead 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -325,6 +325,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -447,6 +454,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3

