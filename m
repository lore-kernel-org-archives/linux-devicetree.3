Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813A52941E
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870077; cv=none; b=cd/DNN+rGM8uzZkT05HoUIQHDTS2gp8qYjo54BYePdb2PibDTWOd34xRKb0B7bF5q8OHuXQd22KAobwFXGSzaMHFvfrecI0f6ajdnd4HWeoprS/9GFgW4SY/WqnEBRg2/bytOB8Xci4aJGmSilz/zqFg8OAS3yNK9nhBBb04krc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870077; c=relaxed/simple;
	bh=9bZ3n8SEQUaRJFAktv+2UUvSvnhVyiwRZSDjh7U7/3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPAHJXLPBVIWWZzS3DWqr24OjteU4+fzsqxhKniWzqVs1gB1C22O6YQv+t+kdR78GuB/Eyc1pu3nlM8y09LvC1acrWLsY+tVKzEMx+uvcUjhfk8qYEsAwZBcJXqo3NWUFE3BsKW+5USIJxyFXWuM0Lh2vsyAXuzSZ5x4HdFGEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR9OjJcX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR9OjJcX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so44231045e9.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870073; x=1791474873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=;
        b=RR9OjJcXBu4tKMH0JsUzLufsIVDrNFstT4vrs5vZgNlXmzN035C8JbJUoEmco2LPy+
         lIcJ3pL8YNJG1d4wWpIt4OKsZ/albJh1f+HyNAvf/KrbU5V/v14sqtRFDzu68mRzvuN3
         At6Ou1PMWawgcwCefOFq8rd/yuLwuSZcI4ufqJG9pyuudWPFbUUgYLH4cF/i8LzVkIcY
         VyvtMEHDJj8NaXaAvDu6kvdcUyu2IvzuEdgoFkuHZ1/Ud9Ps6xCsW/2OcrTVx9OyFKH+
         ss4zRGC8qk3nR7FZqs0044agAuqdeozmgUZdkePFYioSyAxKEQUCLp4uPY+9s9p5Hs5j
         ct6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870073; x=1791474873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=;
        b=zWoLfRUmEYFcmoli9BjB2DqQ1oZn7O/Vh7rsX3EjEjM9ZnF+8oIYOfFbUnTOawiH67
         LCQ3E8Yq3VtVYNsIXCKoqHjHqQOB5m+GCgh3pgpwCby8vq1zxsKSFFEqr0lx+tt5qVcZ
         Bwy50CXWfX7cAOuloB4DdoE0z/vikQjOe2uxxrmhHkqxnqvGiisQpUqjcJeVh8i6RvqH
         VoMLZtKE9LyZkM35memsdHu4gVHUhfLOayf5scYNBguWKyqj/fOUp7VUxAzxOdizFd5X
         bNVSOeB+aZOWbz9HiXK2LBELYF1lNDZKT2L6yP5FTFYYAoSsnncvor6uX8CforrLzgep
         mxLQ==
X-Gm-Message-State: AFuF++kgJkLMMp8heOXHy462c9WOR8efRi3BIfv2azM/QrvBLQ/hENfZ
	vWD1k8n1i0D2fjLi/W9roR0469wCXVMnfAiVY/Q63rXhUp4viePLzwpP
X-Gm-Gg: AYBFou3TihJSmMXaQ1ayh7WxBpYolUmCTm/iMyq1ttLJj3GWjNE5muMnB+auQuK2FN0
	i9/IzR71YFdDxZ3RrA4utY2cLSpKaqAUSvi6hXNmYjbdXUrQM2wvZ5x+p/Qkq+qTWb5HmHd3Uu2
	RvIw1tmojP+enKtYCVY1TYu+siKfkYkKU2O19h7j9XJT5QvXn250vqqMR9Y+atZgUoRQmDlyD8+
	mh1FMMvNTNaxWttThvLXIjZat8LQSa84f1sArMFiBoTIhUxYl1zXS4eBmWeOkKLU6eXzRv5ClAG
	zGQ0iZgpbSU83ywbexMoFAMaCXgX65wK0vkkG2St81d04D8IhKJSfQYrx5qmFJba4EGbqYWTFJK
	/wXsW6SdWjXYLYie5iMeMOByVfuSFxZu1WG+TTST4ddh92uevgveU1lFJ16wQmCTnlIlX4v4+j8
	ZMzJksJhCJ/ww19SdRuCwhiSJIG5tAOhCpbk9f+YtJDGgwYprZl7JdgWBvX+77MmgT2APa5nO+e
	v3lImanamlRie03I86vz74HaH64dLO0j1ugrBLwA/PApvK7fozACrCJv68b7Q8XxTT8w4KpKVyH
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr1517275e9.4.1790870072609;
        Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
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
Subject: [PATCH 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:55 -0300
Message-ID: <20261001155412.3177428-6-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 5f35771cc3626..cd1b095ce06f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -107,6 +107,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -243,6 +247,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -255,6 +260,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
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
