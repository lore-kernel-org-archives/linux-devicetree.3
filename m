Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308363;
	b=TlrGbr8PLpKOxnHAYktAbF/hrQtoSAeD1jdb55BjjOwYv8lDj5Yu+EH6VVPZPFREpLpx
	 udy+hccIsFeRwKBGCoHAo/1Qfx3ZA4NeeUIxngbjI+Nxb2NMYSxzmHpaOP5OdPNZ2g0KP
	 m02xSzmV5u5qmkWjlCAGjOoGWzl8YT6ewsAWJwVNY6W47htwugiHtUc4YEJwAAZqFJgRX
	 FgVKdnBYcqKPuePzDVQ35xyv0gC0pKWnn5c12R1pVKDfDKYxK2ifxsi1MoVoVAEh4zpI7
	 Jbyw3xqXPE0hGxqo3lpDeFXHmDx5oL0nJGW+pG/7bWaHdjJdPIruWhJ9qQsH6Ro8v+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
	b=GP2aLSsEJ6FBEPpBjAXBgzSeED6Dl/42ESvLN0DDJRo2IWGIfnqKROC19sXBvrycFZaE
	 dIcGssnbPLXdno9WQApKnmzmdG7aVGERy7bLB0aWZnJiPhLtnKl5bTys7ge0dpj55zhSe
	 JyFxZ3moiervPsi7T0qOoxptioN/CfYqYnRCyiaxAiiyKJlYJJRGsIwJCpUa5sadiUoFS
	 EKF2MlnGH/KRklDmiJm89FWYsMZX5CiZLKGjVHS1lkrxpJ6/ViYdh4njdlqEZhT24TT6G
	 hnkT2zPMPpMwdeO/WQV3VqprIzG7Th4Ht5ElZa8bWVhHwCmIK7vvQD/P4T4CNerRw2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdCa5cEb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93060A3801
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A93060A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdCa5cEb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so1125812f8f.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308361; x=1794913161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=AdCa5cEbsoozxxGzWLhcAd+U90TFNfDab9q9iri6t8NURGqN/2Ivz/dOroygzRPXUM
         mefwG7O1UaH358f5IvgNL/dqN3U/PW7HhT71qH4OFPeOuuGbbgrGNBzrLw5CRpW12Wha
         zpDrEH6h6WI8C2FwbyrTWJvTAbgM6u/qrzhIOhcui7R+muK7JFJjtr+F/TGMwtJhn58n
         2K2OiPYJyVw91xn1fOD7TjKC4PgYMPZD6NVBaM90Ww7t2eDsZUu01+MyYgvLrOk8Ez0R
         3jvw+Y/kP7WzY7O2qJKuNUTqZ4fWr79VI/qW4zG76LLM24wrtmeg9af9tSP6PqAJqrYm
         ZWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308361; x=1794913161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=cMIHJnJ4m11VWFPcwxWj0o2LSleC0Ee+zzY1opeXf/dKHOBoCOEdohx2b/ceTURB2w
         6f5tHbBsO1vPOymMIWxIZXsjElRdruSSIaQwdx8LM7sv+j37Kj5KQu10OMHUfy/1P6+1
         elbOMLIJq3FXM86QsMvJ+DNsGIJdmNNj1xOycOZqcDy3aV4rm5Da/6ZWbaP5wYKH2yZF
         GEA48T9mD9g4dWIgRndMpmuxP6Kev8ppDt85MB0lqNGmDyzOy6Xsn7FyysbGBbTFUTRS
         WK1gCueM2AmFfhN4fdcfNKhnCv6WiMg5hwp86K7VpJIYmsEDygXvtKXr3bDNEKvOWsJv
         ko+Q==
X-Gm-Message-State: APuU4Z+9O+XGmAFz7v1WHlS50bOU2s5EDeiaZ7pGGY9P8enC4dNFIMmv
	o1w5J3DdpP1BjVtRJr643eXv0fxs/IrjMhlWe28A0ClaKM5CgrNyrWekNGVq5Lfj
X-Gm-Gg: AYBFou08J7XpZYgstnoZuvEY6NVko6T36GlRmefrpB5YXPE2p4AjfQ/HJRCjuvA9dRA
	8kAaUCmVIr4MT2Rb5RPwTDI2TYiNTdYAAnUfmCpkL3nYtqKSYTWXoyWJ51ARjohuUcADEeHJ6xi
	L7eBpDKYP+LiybYmdAHsQCWmw5S9P4GJ1jrvkeysk2a5/WmzgiWiKpjUQIrlta15l1Y5745h9zA
	Rp3snVewNowdUjFcvzbatCE7hCghWwIK+E5YKD4z/9vXRyEQF5IJYPKe/bt4wGb0qSwcpV3zeNC
	oOpmRdf/nslIbNbbun2m4Tpfygw6IIu3Tr4wqgqaenCK2IkkTffla93diaQjJLfhjCOzN3lL30i
	i87Ss/jCV6PB3xerLDjLqCm97LazPpeKjuG4wGoKLo2dWltzcBoJqDcbBTEAZ/PF4rHGXG/KoDd
	NxAzVHiPtZ5Vc+CfQkJP8YbvCHKdIXk9A6yUQ5ZXPhAJu0YDVAFYnDFGjKslhRdCY6YYV6haOQU
	E/JJ8IUFtq41AC5L/dnNL6o8LkMaffEPuP8lHdT77/6Hsux1cjVdISEub83Z7MRTqW2WZ3VOtUG
	+TpPYZXpVXh7lNxHNNZw3J6RRLTLx9CTSG+MDOetXqEI55k3XzPdz+0aVVaNJDxo+Hi//EGVEDy
	tbhgq/zGR13mPIslYRtZdyMWDJgLB40FkYq+FsNv9O6uEVbWCTc0=
X-Received: by 2002:a05:600c:c0d6:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba06d8e3afmr12626575e9.12.1794308361498;
        Tue, 10 Nov 2026 02:59:21 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:17 +0100
Subject: [PATCH v2 5/6] ARM: dts: imx6dl-colibri: Add Toradex Resistive
 Touch Display 7" Parallel
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
Message-Id: <20261110-colibri-imx6-overlays-v2-5-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=TCfvQZMlT2FEQWtnKqizOTemtEj324CkM8hau8ASkwU=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5eZ+T8KJ/kwVPP/owd6nwBm69uJ9cP/uzLjhI3
 vufdPFfeUcpC4MYF4OsmCJLxhNVQT6FEFkPjuZkmDmsTCBDGLg4BWAiHR4M/wxYTFMzp29os1Wa
 vTrj3+FD+++2xXVydaj/M2q9Lxo4mY+RYULf8gXJff2Z16d9TN1+Pdp6ytPbHgzfX22/uXzrBn3
 WlTwA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch, handled by the touch controller on the module.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 02d21d62b370..c15b09c058eb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtb
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
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
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};

-- 
2.55.0

