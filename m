Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308361;
	b=E50r/6qpLB7xuVWC4OzgmfeEfCp85i4qBpddj1nL51DcMVQ5j5FawsDIf8FsAeVwDyGH
	 x4fbrePLc+PZubTSGauV3wQqm1ZuHycgT4xxOjFIxKGjB3ZcqL0eHVJSKlVfggIi//SM8
	 zlUSVsxVBLU+AdRHFZMwFhyrdsrRY4wbqQVO9OoBDFeNSoK4Quc/VDqeVy7LwkehpYMpF
	 QCZGhc4RryDrQAq06woJEPPxWnEoO9SmxXnKzsaeaYEHmhdxUfy8/dHDz3bLyuLeBsLRi
	 E4vuoJuNW9ZA5g8Z9Lvf7ICAxTpEzptInOOnplKIooEMXVciQlGrkdE/xbVu903muyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
	b=rvVDrCb7PvDao+sldFK4IBZ6KrwZ+YjvVJfwgEt+8OYIf57jgEdv36zxV+ghUuvIcgeD
	 Rz45PDrQw8ALXIrRdfNCo3oI3XKf2956bIxu7QH2ZFQI/3y85Ek+0y5kVr3twyDEvs6ds
	 1Nrwy+uwQhTYNsEnjVdGOJEOMpfvIKsQOh3MIMiTQqt5etd2P7awtNNkoShhObELHC6KT
	 5SlYbo2WbxND7XbsiaTS7xR43GGKU+A6j/nT2ao8mwtG+1y3Fw1PejxazrLKXmYbmQ7NO
	 AOHQcJ927aARUDei0QrRun9wmXmUq4BknHLSE+wPED3bQFS1ptSyzPKUm/bEDFx8QcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sYPFUQL8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B860A260D
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655B860A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sYPFUQL8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1226858f8f.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=sYPFUQL8KhHWwwBwpSiKrGpg/EFlf7rGKp16C+S8jxeAbugj8PvaRksDGmAfCvo4aR
         cHv/14lzspXAO/W+x/F+cEdtbTqiAUyo2zxC0nIhKn+ScHmCa4/3aM9jBnf2I+nyhNVf
         aTIiAeyp2iNzAd5xLOnuldBU3GjTvUl/FGe+xRVkwmQkFgP/dR2Z6juPCD2p0/GCUvHj
         NhPdyL/jSe6NUoLXUFRC17x7HNUlqTdWtvoiFlVWWf+7CztRmxfGtvBirL7iVGX/RbLE
         SMWcibvUiEng4bkWUAdu1mhWP4qt5KC3YZQYCRLBKRNEI4hPOEb6IlKn0xHOPKfPRsU8
         N/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=v8YENFq4D5FJLJufO0znAtuZyjbILWh9f8j/TOP4vTjbaXQ2WhFvr3AW+5XT3OSevn
         hyBdDM3mr945aGu2hsU13zMQXNnW5oqsLZlKPscyCBEY22TW+O2AH5UOM9LgLTPS3yYd
         eYiYKlrgiJtz56VXvbP71Q24wM/1+pEiHmE4m/WH2Du3ukbdJLB9maS5MptI4S2mbKo/
         BaTGVVjuGnV6zrAaLMZkeXlXSFLTg+ddbugB/WQ1MQqCdjSzoLGjtE7aTcuoTbNKQCwC
         fH+ToMa0JPpgkvfWzlyNxPR6OxTqxQT0r3pUTEVnss6phcUpkQCMvEFt6o4kuGrdmeQT
         DwNQ==
X-Gm-Message-State: APuU4Z+K0PpbC1npdRpEk2oJklL0Q9gz9r5T2l1EZzYomd2hMua2iaSE
	+XpWbuMUjaquzlc/q7G0dzESsMVsXvVkbPShyWzHgyMOPCV3Kpp8WsonU8C1Q2Pb
X-Gm-Gg: AYBFou1N51ssNSntSObCIcMG/zlbLjdMpJ3bgn7kkAWE1EZc9nPXewSbFpLdAk98DdB
	TsR3D9JRXFmMerA/r6EKxOj+Jlvk7pk/yCFA7lSQIVhGdkgV9qAKOugVGvmSgYNfRPPt172HX8y
	92tSsOB2JkvPmXWAGOSuR4SuREpcVMmSvmmyQh6QtEEF3g41V3oAL4MbF4ym0rPryJN0IAp81ZU
	13zjquyQ8lI05xjOMlOjcm4uR1ciLysXpsKY0L+9ux+KSGSbH0llBRpstrJq8pfaWAWGC76bWaX
	kvHJBOBbCTTln3JbReJRzYs4GxISeQthAqeByF+mWKw4MLvWY0LsXDY04nX2qwH6wJ1unI/MiUy
	0UZRlPh3v57TihSxliBUrXOlU2mMxNltw084/9bCkEF5Mwd3DFdApjEy0ageS7wJN2A1ionQpzL
	CGL14tO8KUQKTbHKOBBjfFD3OIHEfx1alq9UZpGtnxz6KDlWRiQVa+t7ia63kHvNUdhys9wkgr1
	l2iJ+fJqSUMHzC+JMZKXGbaUX+0Bpb0jE93Cj9UBNzJ3LZAPNIXaAG5yM4I7U6GdET/iN3+4V3c
	GEo9wOwbwmmum0pl7B/szfLuE5mQTaKdRltAxqiV8TDN9caVbaA2DOXl9jswA7HNuEmSxE9JN+S
	GDShUfroSKsW6oI3ns+sq9YhFZ2+A0JQP+5a5JLEkPhumYYHNTN8=
X-Received: by 2002:a05:6000:460a:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-498302fbab6mr3856100f8f.35.1794308359531;
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:15 +0100
Subject: [PATCH v2 3/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
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
Message-Id: <20261110-colibri-imx6-overlays-v2-3-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=9wYjQMWgGZ2miySG/qhMsDxpWS6y2NDDR/Qv0+L/cjs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JPZ7v7UNSkCzt9e1x90ORjV9ayX2TmIIUc6YEG72
 W6z17qWHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIn0zWX4H9Bddcuo3tVz27J1
 Mo2OB/Oak602q93+8sXxdsvO9OT1Pxn+F78VfSQR+dDLLLNr6WPD/S5VLrdk789W27ppytwHFlJ
 r+QA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c72920658609..7f527e2b9090 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
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
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0

