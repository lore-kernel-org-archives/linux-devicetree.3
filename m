Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002893E1233
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087650; cv=none; b=axXF33D0RmnXi8Bgyb0X4ixVEsbg0uLfk+t3BdIHpwUhCVTJcA/WcPGl1N7J2xj2qzrb9MLs3Bx5T5vIQw86kaHSHhUyYErhwIYITUORmWmruGmupZ1DbukZFXmc6zwhRCRlftOSTmm6ZGfXxbr+Tm4Sb4NVSO8cDxZM+Kj57ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087650; c=relaxed/simple;
	bh=VPVRIEx8azlGmyfEjloVEHGzIOKDIxuxh8I73jFmUJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRzm8Wg7P61MgMqX86x4MJut96pf4IH0X3f6o3YqQH/WGKW9yvEK6wh90N/glLLLxO8K2vEX7Y3Xz2k9BQpcYb7e3ryCxl6q4SzkyDIeD56thGFOE+KkGL7m+3H7Gj+gm3AuComyLmWdZdfM2k6uUzytvJwSTX1Gu+ZfCvRhLEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzCZ34HT; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzCZ34HT"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso647232366b.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087646; x=1790692446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=nzCZ34HTUTqZR3Ujr4L3oOBfYy4glr/+4ctzoffR63iZmzGUqdeijVaR7k5h0r7Vhr
         N2l+oRbOTk85+hs0FSzSf33ClARYUC2yw4Ggx6YEz8vdAOuJM8EWowVVuVegaZ6hBFxz
         Zd3o7L7QHmeNY+j9JifBdNWvZFTU5DO3aPGigRvviaj/oESQdtYAtu8NnbFbfZlp/1GW
         eMIc9eyTQ8CScPtG89duhC8S02CQPd8KIvuo9sAWpUiIZm4AtDwKX/REmfBEYXxkwIwP
         m0KvbZfT5s750QZGbVy8BDPqF51DKzApKIuj9+9y7wRW0HyYSeeRzTrJllp9/hyrNrp0
         X8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087646; x=1790692446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=0EvdrqlrnmUVjc04MmPyzhcfQPGlHdmq425b2HB0ETiX6IqQAu/9veCweqZj16WBEh
         reUmNAZwjfibQdGCsx3PshNLJGE3QNAqOI7/3qyxdCQ/ocGeFcDp2kBcEYseK73H+Ytx
         D0hTnJXYrEMj1CIced6meH0JilwFubGmpN3TIzU+2zcHTWyEfPCiwkIK6+tpGRC5gvnq
         MqYN1RcYVPOso2zc5OHdkaSyWj0krlSxyJuJLKrN+VTFKTMZodwBpcOf7C0LJ254ED0t
         esqbiV+s9doUhWDOewyTevKf5JOg0W+OJNvd/lkWy2/zj0qKKIwDVr+IG4BEGYGFnr7j
         V++g==
X-Forwarded-Encrypted: i=1; AKwUvBw8zOVRsakbmUjKoQBG39wnnHVjMV7F5Cu+z/fx7K6sdqNz6xmx9c0lISJHtEJdObDNMUZ0LvS7kp01@vger.kernel.org
X-Gm-Message-State: AFuF++kVCxMLCZOEF+gm50VPTXbjfxcjzy2ntuXRRSrgc912sOKdnWxB
	06HBvBf/bO3181xIqYYuAGtqtbK48lUdUAvrbOnBQZ8QU5c7fVcu3rDQ
X-Gm-Gg: AYBFou1kjrmOJ/5r5l3OJoT7Bt64mSyblhl784kjaQ3ojvZ5eCN5PJmq6LesfpWCA4o
	zuzYAps/e9+6wDvQg84E6noBl/YwK7skbgVmRm41vksSZtNavIKwo7rZvxrvmUh1JlrgiMhEVoD
	GkP8v+q2PkiUsKmMJ2MI0gH2+Gv/Vw017B+iBflbKU5xlPVlLr1HVPp8sf+cPROV4XFVJYyM6AC
	thP5hCEtvV92+fFI5r7z2OvMqcedVzSB5Q79GS7g+fcgRe9Di8ZSMp/QGsJUymQ2Co/nbntZ84I
	YCIL9/LaWxTz2fig5Dfxu3nPDVRqpYB/O6PmKiRIVas4sr0GEo3yv6cmtSAV+IvJQdv/qPBYN8Q
	0Lex7z6E3dOJeDiq6gVrQPtVA+/Y6MKToAO4I+G+h0j+SeOhr01XY3GHm0RuX3VBr3Ap1s0yHwP
	+BiGv0nCEe6aC/C/VD9yOvqSrvLJPJ0ZSPz6vveQomJbvFIhdfmV0bZaaMQPdIXVS4MS2cVCjK1
	03z16P+uQVh8ydj7b0057Z53BJTRuamk0I6QvlsB/qjiSz4FxeTKU2YtnooApHbiEZgiLHrzcM=
X-Received: by 2002:a17:906:2090:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c2a8e3b0af5mr219778566b.8.1790087646027;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:47 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-2-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a7ae74a706a8..c283c582d974 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -966,8 +966,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
@@ -975,6 +977,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..efe3849f262d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

