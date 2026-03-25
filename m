Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1E839FCCC
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432245; cv=none; b=BcdNFMr9GlqX2kxMQPI8zRR5F/I9hHewn8GD3HJTLChAv3WC3saZZH9FLYq24Ip6sHCwvH+iiV5BoFyzirdRP9gi8AFuV4kGeQA6uzCZuiVrHkvtCI1njGsiyex+1AWk7PuDjTpQBsxeb+Uli8cNvRpEimNXuAT8XZfxRxlqvgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432245; c=relaxed/simple;
	bh=uoakx01xCZbpN07NnILah4RhFwsBs37YreFODQ1tNu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPAoOYmmTHZL1X74LpW8FoHp2ae5IQYkOzfdq/ABn/FQmyC1Hq0890BBVdQTyp6vahCC7c1tPTR68SNtxginth2x6CvcBLMSl+6zcj4xV1/bitHMom4ck/GO16JnY860i25r9F3fCnIkpVtyEYSGgVWUAbU2G8GRl5QHdO4ol6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLec8iyQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLec8iyQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso54471035e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432240; x=1775037040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=;
        b=lLec8iyQQVD9tPbR6S63uwdDKo9ybnyHl5X2KgJDBZhsWvZLt9dO43DmxO/nsFoNAB
         CpKwEu1WrcsXFrznHSoVAKLzWb7UH92ZGP8dmVcxtlaujXzAmvKklBokk+D4eDXjPX7D
         tuHXzR3eBlfbfEgb4H/sTAyc0PtaLAARK339cS8VaUbEz5IM23+PbUzsYhp3Ua7E4sNL
         SHJcO9+AocromHc7Xp4oX09B4IAKJSGn9rw4S42h9PC0i1OnzZgF8HnLUaMcg0eteAbp
         rhTHucSG4nsZc1wiSmOMzAZqfpYrQUHBaNFH9D5esnG4bnwrf34q0zMbjjNTwVOyLY2L
         vkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432240; x=1775037040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=;
        b=rK5j1hVAVbvwnZU+511IBXAMPmQtc1mNFwigBlv4fWJu7M9ofYHKExtjpgbPpRfU4p
         nEDFUOMqrhxflbJyRkH70RvlRTaKFalnPQWr1aZ+46R1+bYnFamXU7c+seHeldFCO1JW
         H/9fiwV2t7nZcNN6Vg4nc5rH+EIJd3TLB1yoabpax1aWg+tb33qg2iS6+ZNbIEtqD658
         CqGFeeG0oF49bbEafqpGASE7T0MoLmXjwD0z9+t8EkV9+DiGtPfSYvU3Zab9uomkaqge
         iRBJ6moY1WHLhJUOlhlrrECQHmZA9bNWklXj96wLGa+Jrq3ZUsMXA3azfaHRcFhI+RQF
         6eUg==
X-Gm-Message-State: AOJu0Yzj7+WhI0NzHzEQRtAHnNLojhGkb7nD2NxQ7y98A/wfNTeswoFN
	kkKgjnufuOEYIaHvyAh2UQQEPCpaNoTiCLkMIw50MVRlna/Q257OIA+i
X-Gm-Gg: ATEYQzy1nIAbwTo7vyqEvIg6GMvjb/ALplsSJyC6V5jRqBfu2fKZtqmTiOSCz9Znp1c
	zfme19pGQouHA9mSoehIZvlkJkb9w+lT6FdtN+0zkhJxhfXnTfN3k86NNpNdXOLxvbKRMLiFINN
	Wt4RrDGQOL8ZBS5K56mll2k8ktq2twhI5EWy7EKe8hvgwA6nBlsKNAB0YNim5QeWwYsyF7+0Vlf
	/TazuH9Z+3IXcbKT+uo7EQuwirufXmjQBEfo2pa7HUeyZo6shSWlTmAb76U2WmzTJ74XNO2fN8m
	AV/YmIckdhntaWaj8ZM7YQ5D4MQHkgahaxLK3mA1PIFnlSsDw9BohR5Pqe1scZuQVryUTJCWQYE
	9l7hQ4qxHLsziD7LO65cuXcDOPnNFnozdtvKuluQoPWrzBjDpTSFZqH5JvjiIjVrFwiNEKgA8s+
	8HObDHBdQW5n7Rc0Qy3QPASyegSILv9uUOd/VzDaoHb5YeMikucC3drfnQet05og/yNMD1v8FNU
	d3Dg7FbFCfGg1qacdnkUirDGRGsZTevFg38CGXMyfcEFpxbokXgV/IOa8Ax+C7VcHqBdGOEzoCj
X-Received: by 2002:a05:600d:8449:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-487160afe8cmr30769345e9.33.1774432240097;
        Wed, 25 Mar 2026 02:50:40 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:39 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 25 Mar 2026 10:50:21 +0100
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable
 bluetooth on lpuart5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mainline-update-imx95-v1-2-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 uses the MAYA-W260 WiFi/Bluetooth module, which
uses the UART interface for Bluetooth.

Add the missing UART support to enable bluetooth functionality on the
MAYA-W260.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Although Documentation/devicetree/bindings/dts-coding-style.rst
recommends an empty line between status and latest property, leave it
unchanged for consistency with the rest of the file.
---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 1d369983cf7d..a90edefc5197 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -616,6 +616,19 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* On-module Bluetooth */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_bt_uart>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <3000000>;
+	};
+};
+
 /* SMARC SER2 */
 &lpuart6 {
 	pinctrl-names = "default";
@@ -830,6 +843,14 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	/* On-module Bluetooth, UART pins shared with JTAG */
+	pinctrl_bt_uart: btuartgrp {
+		fsl,pins = <IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e>, /* WiFI_UART_RXD */
+			   <IMX95_PAD_DAP_TDI__LPUART5_RX		0x31e>, /* WiFI_UART_TXD */
+			   <IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e>, /* WiFI_UART_RTS# */
+			   <IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e>; /* WiFI_UART_CTS# */
+	};
+
 	/* SMARC CAM_MCK */
 	pinctrl_cam_mck: cammckgrp {
 		fsl,pins = <IMX95_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1	0x51e>; /* SMARC S6 - CAM_MCK */

-- 
2.43.0

