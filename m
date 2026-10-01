Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADCD3E51C5
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870077; cv=none; b=Mjn52EDbzDAQrgM3qjzWWqXhvCQ6QygsVVPo2dlYokSjxj3vZUm3wS55dMiCzgGNbdnZCbyQ3XGSrbRHEKerVmYijPUIwIcCRIK1BBFOAzccW3ylPcw7iGJSWnkmigU6vzFkVJcYqiKGFsCnJ9Yl8YKvFeeNDKzox68mmJbYzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870077; c=relaxed/simple;
	bh=ezdc2eXx+yuZWZufbn3+r0w/2tqaSbs3K97a+T2XLdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc0JPjQbFNrp/tQekF0TS9zVu0j0xULfQU7JbZAK1I/3Y0j2fkr4U4nJksCdQFrKEKqjXQXaOHYRe/C9xz4nxGRzU7RZHLI7+Jpn+gnD/Miq2xqe7FZ5m6d6VcDhKOrugVu0sAvh/ylrM82G4uORADUEBpRKfpuQxNK0DyMqou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg0kSm5Y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg0kSm5Y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b02a2359aso503134f8f.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870071; x=1791474871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=Sg0kSm5YZZVrJha+bllEHem8cNcNFJBY9G1+xmWs0GK1OgC2Hsk5ZnlFiq20v4qABo
         Q1PJbWxqgKs36rpaptYbHHSwfpF7KDT04m7eD4hmQPqm9Aw+CLn3NYxrsNKOis5VsWJl
         CSne8trqX/DN+q9X1q1Y2meqWkIqgx2FV3zFhP7e5LrUG8aoETm1IRZxXAAkwPVGIoYM
         H+IAKR/A1SZVC+UWQVxP406TO/2bNUEaLRnluAk7Uuhoktp+FNaH7SiDQ3fRG1X1E2fM
         vvx7L6DblPrKm/Kjb+sXBoxyzrruxgMklQJSo2mroUAfOgrmaZyMbAONTWI34RWJcRrB
         qfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870071; x=1791474871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=Jq0lF7bxXsaWPm6Gl7OaDHJ3Ap8cYW9fWk+MQhqMTj2bwSnb3a1BGUqGLCPjXyKoRf
         TrIH9lXOg4RdRlZ22leMdAUqX9fvcttTtTFNZMmH6HCxbL+7sMubgqSmOaDA5EYTD51d
         Pbg2amsMCwgxzUpnoGkmuLl4lvfyG+betuAeA0RGp3YaA9cWFSVOKNy9FTFPXsTZptip
         yHg3FXVKfUTxfoJmXfnXyf3xcO1bHdQO8lQ+uqA6BDs6TXtQm1OOFgQmZXGV31WqJ2EB
         47n+Ixf0WZoEGIniPTWISCsE8WkV60HGJ1PEEKHLZdL8pn1rVf4nph5P9DiCmFQJO5+S
         x9Ew==
X-Gm-Message-State: AFq9FYLRYJ1znL3isA6keSbu5qwxAoX+NCBZQWhL9gr31qYiOcgCdYM0
	BUcjoa2GYprhe+Lpx7YL6Vaya7B0s19WI61OxtOVkP/WgncM2yVabdpd
X-Gm-Gg: AYBFou3XW3GdrgmCV5KhldT588Otpsn2CcSZfx7ZYoqz0Xu4hj8KL8F2oh6FzRWj+Xr
	YzCWY/78KRkO2TzmfC+JHmtic5yLoiMGujqr53kCgJC2wDwxY5Kl39wbTU91Sd4XDztF4kH040T
	utEYbyCvEjuyJskzzDGeypqs+z/3dH1mK6KEoosoZIWxhNHNM1j7WCNP1HNB48VmZoxjmccQ1qo
	iXzHFiV0GxKiuxcP/P35UdlfNKgtgboIy7TvLbFHzPOmi2c6cJN2oeyM9H7jkQVE2pH72bhJS/x
	mwwaox/GnkcaRUyj8KqjIhIzJw7ARv5af3O7MZ3WOhOGr8G4j4ENH3ZATnSx5tm45fiz1bzcMNc
	/FZttUcfvS5EC9gYcqoOAdAOGenoQwEd6uIHQkqF7FTlDHy4kIXHCLKa62OnfCMtTbc0CXPu6sD
	lMS/A8RHUDwrTgXOjrXZ9PzmD21LRXLt7cLLodLF+a+EG4qSt7UAMOZA4yGKtvgyED80GMD9+2I
	OnEKNeLEtzVnrptanRA/EeXv4JXdX5GjckvdLKciU3L+Yjq3+yoVAJIHAs3AgRPzw==
X-Received: by 2002:a5d:54cd:0:b0:487:1577:9e33 with SMTP id ffacd0b85a97d-48b068bf670mr5217869f8f.25.1790870070993;
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:54 -0300
Message-ID: <20261001155412.3177428-5-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 23fcc80d7f309..5f35771cc3626 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -103,6 +103,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -249,6 +254,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
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
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};
