Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889E4DDB49
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408731; cv=none; b=L1fWqt7Kv7iAzYOZd2iEE7D1x1mfozr7qACvmkVavSwuOJd4Vu9G/qM5zzJkdZJh+YpnAW8nZH772eugep0Vmbc7Z54BfRVFx1TDIgLrLp4LcMmRF950041jUAamxXdKdineWPQuvDEip4ImmX/aMke2d04G5cOZbq2IdHm3n9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408731; c=relaxed/simple;
	bh=zFQNhdUL4WPcv9nvazigfdpHJRQ5vHZMaw6uqlFCKZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQDTjOJH2xbylQnQ3aDVOC70mXKGc2SdmUpa/XiM1UAk3Sf9RDsB0Oo7HXdg+3BdphMdGu8IKMrDkBeGJGe3Ylnjs+jpfaIjwFQ29qc7Te7zT6MlsMBfd0m5R8uHzT5Xfx0j7p6tLeTfztoOGba/q5SJS8T6JvCNh4vwuQHBXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAsH3J8r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAsH3J8r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so21464965e9.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408724; x=1793013524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=FAsH3J8rFtT4WzxzGTRowPRoVg510d0JILoGdo2AYu0ww4rke9Phd3FhW2dUqYBRwJ
         O2aLMXbkJORlKE+PfelCti68/QbwtrQeVDPwdTAgvT16ppfHCvsOil/jMD88D2sRCQQF
         H6TeI8PsgbmpCaJPd02vAuTb3BvWcN1W8/LWZ+wkymFB21BWHbCCu6luubpF2A9D3WAy
         kpjR8kfUrHRKjid3rL4ypKdOkd0jM8UeGObLijjKvRM8PZ062DT0NKEvEKNReKzgKJXE
         cGgADHP3vwn9se7ux6/RxO3tJDOF5cyEI0Eg64tacX0yJi2/Rkr0+cw1jabYUKaMauGx
         Ac/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408724; x=1793013524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=rEF5FPGqTaG7x/fxAefY4Bk40VbjCvJpe39SVTgy12wQCHBkHSsMOI7gExBm6SsuTF
         AU4VlH2HHhW4fE82XPMJwCQXPbyoWTWzJHMlMSUmPPMPLY8UOh+a//T3yqNDF4HgnRFy
         7C5xUIXq8jJtgnrEH2G775r1AB6nxekibuqAAasnoackAm32NIxyvEZPDGLflltlW6ZV
         XVlJ4XISahGwwBXILnl62yj0lU9NE/CcNd3h+F/4HbrCbdUOteg+1zH1VUWUwAm9LKTH
         W4gR45kKr3sBTBz497jKDb3WotRcFLIh3CFuUiKjKn1SCHwhbGjoYm2tnC9k5kxOC9sl
         QePQ==
X-Gm-Message-State: AFq9FYKzQxZlIejVj9UpEDgcR6ZscXtTzK6lc9Sz2flksI5pi5wQx9oI
	848IFCKgZ5eBlgexKCjdBchrMYXom8Jdnrgfb/In58mYnBRJezhzU7nj
X-Gm-Gg: AYBFou087ZmbuV4IQ2h4xzEaTPdSf6ODeZbG8rBQ/ha1GOZzP+MgJ6pdrBJmkMm2VKN
	lN2rHkrFp9qYt2gizHTvKBMISAQt4MhkRnP/J4UXuG0M7knU7xYmTLrpX8f7K8SRZpuDB4PKR7u
	X/N7QueI0FPosvY1cghsBLC0MTmaW1spcIQTRVgziUwgPNTx6aHwtEXtSMj328594meC0OmiJr+
	IS8kp9xjLSiVGUQJR1muCTqDFBsummidHkO5c/7AWSu4GlJCqfcsPph0bp7mt4zByL6Ona282a2
	tljb+aSceBQleZ9KCP8c+tyrjJbejLnU1dbVxRowigAajLq8lWyDaIasJukFzjONJuwD8zaH9tW
	ajRrGGu4WOXJRuHnfm1A/aFrXnHUwUi+dm0NxHnY0Q42tPRlxx0uy6ljeASpGuueuz/1eOUQyHU
	mk5aS6uO7P1NfLh+DmC0NjGyx99K9s2tH3JzAOk1QfNTYYi+To2sUqNF+bj6/z3U0EjhKhwdj43
	6m6+X+XvXoBHYOS0zwzLlQFowNpj2u2ingLyegyLd4q0Dt7M1OPOmf+Kc5S+U+Ua8ISHh08cOrZ
	HchvChRMSxB1Ksm2OG+z+w==
X-Received: by 2002:a05:600c:3b92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1d76315fcmr190697755e9.25.1792408723519;
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:31 +0200
Subject: [PATCH 2/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch
 Display 7" Parallel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=myClqR21JNubd0OB2mhh3+DPt2M98s4uE3+qZ2frpw8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qc/6F/bmfCcZQVfJk5IePZU4r54OsPGNIPuf6d2p
 T7S/cq9rqOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjCReyIM/5TuX7M8cKc1nSOx
 n+dkZcXVIw+2aM3OzrHSnZw5X+QKKxPDf4++DRPMb6pVXhCy0F7fcpbjYpKTn0nRxwTRpSI3WHx
 P8QAA
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
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 76e2ce85a4d3..7897d9dbdfac 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
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

