Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18F35F607
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049479; cv=none; b=h/SvijyKkl+NmkfApdGdpKF3ArvMwbbgbJBAJzabQpjnoKCFpmHpSB3LV/knvpTVV1ntcJxed1dMJZ4wdNBcrUis4X/tDuZTzktYr0AvGs3aJaH1colu0phSanLW++vTeDEjO9vXQz6ygWBGuMqr2h/WIwfcmpE1XODgIkbhH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049479; c=relaxed/simple;
	bh=E+DU5t1fa+GGm9oeyXG4fh5KMGGkdFZ36DmmYawGniA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZL4bGC+kw3F7q1eluTua2TRC1j8ylW3w3Z9SqPQ5LOVJDMNhWI6XNP/7arrZbBb1g7WxDK9Fe65W/F9D06eNLaMBExc1ILrQruRwmVWQm8IyogvzjPzQyKcSzJAXbknhZpqOe3Pt3XJQIIRIbhNHnGwX9smKtD14mOlZDUlbmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmKEtXnd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmKEtXnd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso60589145e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049475; x=1780654275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=;
        b=hmKEtXndCkiF/4sJZPZpY/VBz7eTE8cgOwrjxKazxpZbbj0+zhV8z9BsLisEX6lrmi
         kRWPDXcpXadDfx0E/XphP8EbawPJBrgaAvIdvpgMF0GVJwJe+bt7Wkj+Nn4GbfK1XKQm
         TQEjG7bm0vOEgX+aC4Px+S1axPIN35KqdtwYG7Z089b4MfcDScVesk00v+CuVabpiDeZ
         OdjVRH+VEa5lXMDxFFXw7vSPDxnqWSWGXIDsI20G2JNWJ7RU7csLR6g0rP3KV/cK24aP
         bLghZuNSBBqoUFng/ARXF8Pm/LSzUVYyl1w27rbB5TFaTAszB+oVx5aejXr3svp7HLke
         Q6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049475; x=1780654275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=;
        b=Wy/C50jTG3LA8Z1QF10NyNeBIzol8A4VQb/nfojTGOOA8NbAM96Y1qc8WzBSeLTeU0
         3xtvx9p9QJhulGzl7jKyJ7M6XOEnpOBg6Mdapaiah9mzn4lZc8Rj3dif2o/YlrEBBINy
         ZsDW3ztQrdn6XjeLI1FCatlH9HrDYDRCpOzE65IKHcrv2nb1h1WxYoCMQHYMk+/vR/FH
         okcrE7CMp0GBwUo6q+4HJedeKPS38gV7C1GLtww9iYjqMhkKGPevblm24tIxM4oShSDK
         avPs0TrE8tVv5migcoHce4ga2ry6IZadfzNCXFoZqszlTAM3kxWr+avdsHTF7DNdaWsA
         VIKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+l6JZGGO+TKutpFHp6eRueSeHnOQ42lxmXLqoXlJ/DYNt/n6xCDi13AaJTjL5obPM+9tgoQRGOjTaV@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+ycR4mT9lXaE5CBfGj2+2oIcXouvPofGvuAeOFnOL21Uhn/+
	jkxiKt4GBJd5Ij4hzPzpIkslOmemwKPxx5YPatIrRTjMHEOI8lL0heJ/
X-Gm-Gg: Acq92OFsc7EL0Tbrf8Iad/W1z+lKlGx2vW6TEkEycW3pZL+m602nDU8V/6JYYs6xBbF
	XkJ0NSyrRR6O4OYFT0oDaK2lbJqJEiUHOWEAsjv2VnXVfpQll+eEnYT69WIElbsb5Rmr8JV6JlL
	XFCvVyHg5sFWDXICYymxdjZo5dgVaZZ7MgD0a6R7hT8HUnvufQyKLP2uGVZp6+vHIMXb4EBTzv2
	hMIjSUVba8qcU0UwdjZzSEi6IFwOYfLeJln712banPx2ktkB7e4KOxIkWToai/TD76hjaHC4SWY
	8uwgsdiZp+6a8kIIV66TmI2+uJI0drAvUsSmTpg7Gp9aiSIEEJxuorYaVa7VP/uCzbsDr5fwJpL
	MxYMVFSTjVY6omIp7jDtK/eEtynyxw1sdV7Dmlv+nOcfkXbatYMPBCr/PSta7vR74j8eIrcPwHN
	Ecosm0xXCUKZoSMi8se/eTgD8BPkqXRSI8Unww3POphgxcc/1bshnmlu109ITQtE66IvHJVtDsZ
	q/yMaOjrub7yTHMOi41hf9qg4XFeWXTqEoSgBpfMNcKXqU=
X-Received: by 2002:a05:600c:468a:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-4909c0c9b87mr40354715e9.33.1780049474638;
        Fri, 29 May 2026 03:11:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:14 -0700 (PDT)
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
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Fri, 29 May 2026 12:10:51 +0200
Message-ID: <7fa810b0227fde0205eb0fdefc6a6ef9cfb279eb.1780049085.git.stefano.r@variscite.com>
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

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 23b359e39094..7f79cd7e7a4c 100644
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

