Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B33C9ED9
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913390; cv=none; b=XaU0HTG762rCI1yEWuBQBn2FvV7adeIdfGhQyY/Ga1Wy2ZTBCTgBFqW3jOW90yzGmVqRXeOPy1kAGtsuZf/XSNBlgKw9hgIsDZb/cMEMgJkGsmeGwVexebainCI2C7de6ggTkmwQDuDTaZy1TbuI+6sPwHVRaxO5bceqOzAhUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913390; c=relaxed/simple;
	bh=dsGSNHPPVfK6uc5Otj6tvjUjFbJ6078d2I1D7Vl3PZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThVUp/oHWrLJg4P3h9i10rfmc/EC3sw5dR060TV/Y2Gew9k1GEPsOUiCha7PQfg583OOUh3s+mDiqdMEf/4T1pXBjmobUKVlGhDvbk8WwtVglAEeN8z3cCaqps293x4+kev8m4BzIdMu0MnI0PLewSKjaCcjrBTBmslJbB4+ziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvu1cXRa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvu1cXRa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2121937f8f.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913387; x=1781518187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=;
        b=Xvu1cXRaEBe+ff0/mD/7emwFvNCR8wEiA2Dq7It2YBjf1sZh59RSZqPnemEP/1yfmR
         lVKUPJGGnbsq0QCWkIUQKW/Vxnwqi02vaH9OkSiMBlId52KTuvPygftO2WxlVeDnfIAJ
         hyW6Bz+IsGd3YqoTlQiI2jWIIzqYSsnZn2jipYD7EBmeHVFKjlN2qynolGrr3CvTgayD
         E/QkG44Dno0JtLphIYxo8sO//ce+H9CES6Bq0jYEJAP404ZAltkh9xkoDXdnnW+rds7H
         2E9yfCLhifs5Sp7uf85Ash+T0Odxo3K/ERWRjl7pJu/yHLl7ldfe+tSaxQvd6yIW79a0
         wVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913387; x=1781518187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=;
        b=OFBX0mEb5CJNJWDJUFUHrOLRNJ+ISGviwnB2aw6fgT2j8S1sF2pDkDQvbjo0YfyxUD
         riMpD97AUJfJ4BMnYzRd5fsED/qZLnlEvDAQGuV7+Jm0X5jdsUlHS9+GU/JBFbi4yPqT
         eUEKHx1l1BZMqcDkdLTW3gF/oq0I71WPUpS8hAJ/ExrrU00a8X7k+FvutNJWsTONn8En
         kAxEH6wV2PWODJC5RjGazaRfTQh6vryzwkgElTHSw07p1Mp9+NQFtckuvB2+7+UN03Vb
         2XAUxAurLfd8FVxQA0nVo6ycOoPwbLo8LwFc//g5+Wq8GJnafyNccmypeBBGwWSs0ltW
         sJgA==
X-Forwarded-Encrypted: i=1; AFNElJ/ImsZEg+QzMGOBmDXxBxzWY+JZVReVRV+p1NHUCevC2nx+CPd0HQlezF5VpK+tw3VdgZs5Sw31Iz8g@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbkew8D0x+6z1WRLTXLQbiOPqs3xZgsxH3lSUrF8W2uo1tdCl
	bj9wgA6SxrIEVsl5/jzwPPviMQvMMDxGM1yJZnmbv0J/t33C4DkMrjY+E1s9ng==
X-Gm-Gg: Acq92OHfnvagCNgryZPzj3ePIsCeRCb8hr79V4OL9tRttIn5Zu7m37ZWlX3gneTfghS
	VlOTXtgW0npTEhjcJH9oOZB4sFkMkXosjCQ0mI4yLdm1DZqoluoQo5RVWG8VwgfOmcT2Bvu5zE8
	MeBYXe9M1KJ47Y/ZixIggkLle44seVAKmukxfeZU9cE7EgsObd0mLxiRhF7jpGW4iRJ8jyL/W4Q
	o3gXh930rOsfmUM7+mxMNpDpoRYiTxbYiFeyJ8uMDsod2ql59ORU+3s8A7q0t68r02RVrg4cF4a
	VmMBYUUQVn3cOboeT6kCW43gqocxqZeWuZh9le1JeWeu0NvM5UvJrKlj5O6WgMBK02Wp67pkrNr
	FJixSQimaXxvIYl9ZpCZOCLPGHGderoPduDOFAPNyisF7fZu8pDWk4Ei+HRfUCrwsUkiDgH9WOi
	yPawH1tWcdJGurjd4X0oBCAFFMcEySmMN4f0aQuHxX0l8N/UZGXLJHFIEuZ+PpCFM+yRf2QeY3b
	iyriLSZ5Iio9gqID6LNk7gnAzhKvuCGsvpUr8wQaOfJSCjF9zMJzhbnR+U=
X-Received: by 2002:a5d:49cb:0:b0:45e:fa7b:a7d2 with SMTP id ffacd0b85a97d-460304eb5dfmr16501423f8f.7.1780913387160;
        Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:46 -0700 (PDT)
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
Subject: [PATCH v4 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Mon,  8 Jun 2026 12:09:27 +0200
Message-ID: <3875138d135b3aba6e39b585426cd4f641a92013.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index bac3de6e1530..c7073fcb679e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

