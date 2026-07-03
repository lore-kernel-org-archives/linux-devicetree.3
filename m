Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB83890F8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068388; cv=none; b=gNyJCzWJfLk0thrfXL/L8zki7D2wFkMcdvNINFuLCHXisN1wT2o0VMS+UpxJQ/hs+YfJbxmRcfqlZabdtjTMD1/aX8axQMogXudAUYkjNgkiYfX0So998nOGhW96+RLXQA55eXJGphzXXv6IawqUReI8Y0xYdy2x2Ivq+i7hnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068388; c=relaxed/simple;
	bh=pGb0LIydITclxhgCKi7OR3gJR8YFVO/cH9t8i5zQNEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLY/8CWvELIDo14Q7ItTlMehqOY5pJ/3/bwjg8aKmI/TpYIWANytfX0NH1N14EaAaLfztM+8Qn+AKGlhOq6ktVacU2Otp9L+2StIqDOVsE9eU63E2SMWHCHE/Cmhxe4HEq6BgvG/hd22/1VN4lt5UGtK0w2NiMucgRxYb40XWgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDWjqNDH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDWjqNDH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so1830345e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068383; x=1783673183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=;
        b=BDWjqNDHANFOHUjvj+sKWhgos2taFqqL//j3bTA4YOStzsDMD5+PEhWYHXAxCpBOU3
         kk7P7I8uX7p+8NCeuiVpDIp/YR1McOzvlkG0F0qu35fLA8cCh6r/jnCmweJu0Frgh2G8
         q4nOkPbVcL6flTle2IaeE/hMDSmc8FS+vAFt0ByxAhDUrhxd9317k0hY92wyVEhTzlt2
         9lA6wYjYZyXdEz+AQfcTJcTnol1y6h7Bt9IE7/w9N4x/9lGsKDaE6BvS/YeOSdZy7k+7
         FI89fxeK+vXLhzE/SrTUqxYs7F6sbyX3JlhNkHpIKBXde4P9hqEb2+wI4/j9t3cJuwsW
         G+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068383; x=1783673183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=;
        b=rkRRRUHp97a8qWdAH4Yb26NDord2lVC3eufNbw9/dawssrCxU1xr/06n+beAwnuOhb
         mZoWblP94l7Qpo4MymdYfJwS57eVG6LFmJxnAqqUjLRtdGdBCDXMdcaA4zQ5PpUPbESu
         OcWfjExaeZRGuNFyKEiGnuq8YkylzR78ddpe/CS7c4F2I2TzitODDLJ/mgI1BaO6mZo3
         urmgwXxjiX2DCaCJraUs87R3o5gH9yYS5oWHvKLD3UJJFvjTAin3rVsuKwlXE6rcR61V
         ry8iBgNrs6MVch5HwS3sUzkfB9tSr8pl6LVBOeqGwChetapTV+ujKlQ5u6C68gh5rL3V
         51Xw==
X-Forwarded-Encrypted: i=1; AFNElJ9kBV4dzvQ0XLVvMntEk0aagmQt8ucOiN1SJ4oTyYysOM2YO+X2oVXCyvUX9NA7oXNwPdrjYBhy5LaY@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbwvOVuKyS7yzAFQNYmaOqGJXoqPUhNJogjjvHadVxnNZEGor
	hmemBWoBdTuMpHASoPy4RmXPDDGNwTDxoEheV65qs2GFYDh4SRHKdqjIek4aOg==
X-Gm-Gg: AfdE7ckJF7pdMD1hE+onw+4aBr/AtbmrLLYvfGLKhjZKGwKuG7SWRfEL7NVg+kduEGh
	a/yPepSgkx2lun/UubHZeOaGfPj14MYulZI3xDz9BNU6aXTrRKwvAUkb2G0aYHGqqy1OmjA0wsE
	MzFg1HsD3kNkuxYsNL4DCtHwILhGxjLftCPFfmiteOhMF6hEy1+y32hYIVWk5kevGi/ioerqS0G
	ZLeTmPq0+0H4HbeKfTpcwBeGK3SYO3rZYtmQZ7D6w1pyx/qv6Xi1M6nB+8Blk8WUHZxYj86iIM3
	v7CY76Bh2Bf6uHjLuT+5prMZ5GSXjjqMBjPIajm8aHAlWCTNMXSBJyJlq/7rGVqKgaK9Byny18h
	6PEVafuwWwCF3ElB9jqxXcTFTLZFdrV4le68JRw6yw3WrZYGvWMKWMuabQp9ZO/czwS7ISwtvbS
	Pojo/Q7rjLYfO4KDUhgGsD+HwtK4iKsCLgxIsYIQfxyG6Ps849dzLchskl5CoMRcozYf6N3c25S
	nijuNLR15DbsfGZJG8rJyvTtQ==
X-Received: by 2002:a05:600c:4206:b0:490:e913:656a with SMTP id 5b1f17b1804b1-493c3cf0d3emr72946345e9.27.1783068383286;
        Fri, 03 Jul 2026 01:46:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
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
Subject: [PATCH v1 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Date: Fri,  3 Jul 2026 10:46:01 +0200
Message-ID: <e20d78ff8e242d3aa938776d435162cfdb7b1d66.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
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

