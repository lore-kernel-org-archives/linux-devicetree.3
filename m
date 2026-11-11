Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423888;
	b=AsarUSBJsft+WdC5VPD55WuMxHHV2x7Dgd5vf89HShcCCcbjXgzAiKXeoUgLdpAptgIO
	 3iBG8w/a47zyIzdcT79ozsmuTPnLIBfl9Gns4LCElAZEc7d+AE8E/q0bQn/F3sO3nvrDh
	 ij8V5Dp2OYJ5EtHWTAq/arZCEJ8OOSAYwVJDxDXzpVmPPQ6GyT1kGOOKWRYJ7NsimJO80
	 aUd36yYn/OcVLjToAQIz154qgidLwOX4t6+EIcRW1pYi79VkTnhj0BqaSriamStpLjmeC
	 ubB7z26/ZZ5prJ5QCRnWqWfuc68CxXz1UK54AQqWExyVNGTlJPvC7i1k6Q8QGC7G/1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
	b=IPlMQroBT4QR9uIUTN0oCN+02IqzTYAwIsT/eVLlYsJpr2uUOp4IEdchkcXk+FtfGL+W
	 s7KUPTxkoxlgON1Oul7sVBmSIiUh6tvBmV5gUACzFyYiTgzOmIyfaQdrheoQss5n6dEi+
	 xnocoDEAW7T62wbB6wL6F1axEYhg+MTEASSNkjPUl9s70XK1uacghOFynneiW0dWb+r47
	 7VV5bGj0N6OuDl28NkRvIk94u4XtjKwpLxc5I7kuCvQ86MG6C5jU/mAt3W7hfmlrtQGs0
	 MSFTSPzLRB0F5a+ZEDWT/QZG5Gl1zxX3JF4KNZIDqxEJX8zOu0FDU8yL9/v486oVYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSy8tQN7;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A6606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318A6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSy8tQN7
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1863782a12.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423888; x=1795028688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=bSy8tQN7lMH6LUKC03tCO9XXLZC7SwCdtU/aNs4KuyGXUricJwN7c+dE9F2DoJt0rf
         zfY/PI2D1jKkCnzT8BSDoKT48uSxWP3R1qqBQzrmu3ryJ1X0OJ0CvrOMlEuP/qejnejT
         NCsdL8JJQpu+HcvCVtqBR9M/XrzcODw9Nnv3GFEc+3CIR4QcRYhy6JVU/OA9R4ybE/if
         KFS6uY99TdSJI8Dhnq1gDSdX01ReJKIpv394hNIVbeyqy47T+glhoRD9LVUwCV316XTn
         jAJxopEYbrA4zI+VFGGJUlGwJ24STb7/JkGHXRb/AeB2ndnZz1X3Yj1KG2RN6sDNznnE
         C3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423888; x=1795028688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=txF7WsarfdYzb2pogLp9j7cmkrIcdTbOOaKLBvjHkElnZclSd39NtbydHGZU611ieH
         E27EKqsVn892Vtyu5xNSNll7yrpYSih/TGk1Nob5SvG8JT0wtHxS08VURJAH+gvggncY
         gAMYUOK6GvRBBaqLIIhVp3YHZvisGMf1DPQW8OSE394OVzTE8e1MSo5Jl30JTp2ii49w
         HeIolReHivmH32mTbJoUdcV0J9rgRxzMCAY/zHXR1z+whXpvmHTmFXTgcT2mZq2wrhXv
         BGKI2m0LmvWy7o5Cw+noFSmm2cC2W3J71QR7sAaQhnI59oA9OlnX9JuNmF/F2xi0uoRB
         1XCA==
X-Gm-Message-State: APuU4Z/rDaY282zCgJveJm2S24hswGFj8+FOyIOe5y5A5S0NA+2KHwHU
	HVYfT2lc9Kw7n0IKnXvX1WTFyJKe1r5INvhHm0LDzks+zTLG7pnIemd7
X-Gm-Gg: AYBFou0X1Ijm1IEGUvfwfJzgyMXqm/fF2snt6RGW85uukw4GzqTmchTBPBWBAOAuXUh
	cBbdOO7h28Beo9fpUTLzq43ZJztbef/wkfoDtVgGrkpi+QKrhFCWL2CDRLPw7KBQQgXjQ0BF6tf
	XT3REXdDJ6fLwWWIKO+5gvWqgwW0rcgBD6RQiL5UsZUgVuW6jfHQ55WkrPsiAAS2MKVixfFkD63
	oE7qU6sul6RL1z0lsSKLtUO8uBVWxe1YfUsrnar5ag2PY1ID17A+oLKizYRnmlforD2xRDbAS/S
	Yoyb7VIPobUpbfLLhg4kewbtHfPJWQd/nZt3suj69W6Qh7gLMojkh4kYAKMTOT9V/17xh0Tlv1Q
	gJXVKKflhLTQ31lmFLJYngehdEkZnQPln1AyOTNvBwSzNbSjCFre2TnM76UIJGAf805/UIZIWK3
	t1F3Imqkljsecg0ZxFj3NSjIs+mhahfEYrZZnax7cmoxYoAqK/enmdphEBCMH64YvG0E2TzAy7f
	9g4VFqWHnCQ5U7ZObR2KYIKgJZb28OTWZzK5KdmR/NFAZjQBkRbOrFxZ8a2raDVhdp/DfA0D31A
	w/WThX0wkDv/37kmW2jmw1LHtlWLOrlk0g==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3094237a91.17.1794423887377;
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:01 -0300
Subject: [PATCH v2 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch
 Display 7" Parallel
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-5-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3352;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=eN7DvQ1E51+JeMrXQEgkpfFssIEPFBdeHdO7BmoHJX8=;
 b=5NJeH5jEmlLAdlRZBAIQgCXVcpiyPOftIb6QuJlQMcDPSElxKYbFx8QwR5gx8VE0bQtiAujaK
 kWmjaDj5Pw0DtP8TD82axOS+f5Z3LVZwK804fkVYt9rjkG9d7uAUk++
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d7f9b2b5bb493..fc9a68cbdd313 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -172,6 +172,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -330,6 +334,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -342,6 +347,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector (as featured on Ixora carrier board and
+ * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0

