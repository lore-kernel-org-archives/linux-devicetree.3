Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AE3DFC82
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408733; cv=none; b=P0k4YYkZTdsWJwXpp8NRuAOn6NOpcKxJTHo2aIG6dY6bzGrQ2d2GtHJ60bCY+ek7VtIm4FUQgO9WqfzAVWHi4MO5vu0+SR54EssVD11cIu3FpoxYNaTZIbbb75TaDi+W7vQANPy81G8+9Kk9jUSqTOQm/ATDDdq1NwPu0pHRIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408733; c=relaxed/simple;
	bh=mhxLCTPjVQZv2OtRsJyKUu3/MGnO5VTuhQw6MyljM28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GD/sDAIsYnu0Q0Qnm1BMLH+w3qfkcRSHHpf1kDMD8VCMv5wll93lpG7y/pvH30pzQUZut7+jCo0Sv2eFHNLCiILnj/BcaYyHVr7T9TCPn3es5A9K6Cnp6oaVxzqxQRTwkhw6ZsTTox9ABgpvVPz/BZqAimjMr/JL3V9PX03ykHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3WldgqG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3WldgqG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so6965905e9.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408725; x=1793013525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=a3WldgqGFfraGc5x3lmUaokHskplTVWL+Y8hD0E9CkOSJ/X54Hg0ZDQ+3cU6rj7zXN
         gQTAAY4RgwLMogBwHXonB1K+cnKuvTjqHegKkPfiENJ2hW1kmH9d2lfwn69wAeCoGVif
         4tuYKpVXyn7NZARU2tc6raRJXwKv0O4k6rjhGqC5oXJ7Zhe4a6jMnT91UB/1kcZyZFrc
         WpNuSmzN6ISpSlGErM/S9cRv8FgdJ7HLDdXzB9kL1CjA1a+bpJpp1IgBU+m0ftWHlY9O
         bLnBoi24c6sl2K7ddBlB9cKvhNBz6h41RxVO13NCKO9gXJ1VuayDmO1/GpTMW31/aASQ
         txeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408725; x=1793013525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=cd/1FvBAsQ3XKz+DZFBsarWvx5pD6B2mE3lyfHNW6ZMZ1yY0q4Ix2IXXrkWUPdYrx+
         Wc2l8e+U8D7iiS7bJlDtcKL9sMEStSO1zB9WKk1b4iujgU0vUrUVzn33oeiz6d70UJCn
         6zF05WBcJCRYgyD9R8+xtdtlDTEvtiJZOpiunq1OBNNNYZMrpdvElpWXAznR1w0l2+6q
         X7xq1m7XLlftiOlxNWr9qZADbH/hfXm8VCkxgVxUwRIiLYSBVLt0yFWHJufPPebL8oR2
         f+VR0jQEaP9sazt2eKURutL5jcQWDZIJbew/RaVvV1PMEVCQtmmKdBLO84O2S+4tCLUC
         21lQ==
X-Gm-Message-State: AFq9FYJNuo7abLN7FtXVe8HVQt2fDL2qAYe7pGuwMwZXnv/ygkzCJwBH
	PRl7CV0sO0YxrEokxLtbdnSxEP8SLmovItYhnwKxb6fDOnFRmJt9stg6
X-Gm-Gg: AYBFou0scVo+Z8OhKotbYFmrx20/qWct7hUWe/8pLdtkzO8UUKPhSwiA5jtMtF8NTWB
	fQNrZS+fJYs+7W0vT0PE2rvMRw5LEklshFJvI/gPPxc3TXF4C8UDtNZnrSA+q0Jvc7N3bmvnwZU
	A4WcBtq75XfMD+VNom5WerDRHSYLdAzELllsOb5i0kjeD6spa6/djWFG48Qz5tCDjQ2JN+VHZOv
	vmKson4eWD7h5/vRNmZ9UlC5Z0R3Ws+ROk4o5J6gc6Ef+cJhRlO0aNDBkDxw9EGG+EbJh5q0bLv
	XPtJUgVdDVTUZ5RrRE45Tt0ziU4iY5D3TTsVKJ+XQlrvYGzMrEIIJwRs14spRP2zhj094flhIub
	ecEdFW837DBvH7Ugf0hPhEHaKlInimGQQqZvArhkDOpEO7+exZhRUPKDj3IK04zaxABoNG/i1pG
	7mNFsr1Ukr5kOVN4boYgspUvh5dKFMknTbbYkI+5kcKK6GUJ0XAgjh7v+mezQ9Mr2kMef6wXpR8
	1itPeuFqIJl5ITp/PVwE9ddElqk9aasq0Ud6QMMLn/Osyorcpx9MjIuC1qNwpE1Cq7oBguS1y5/
	+wmtqeJRLK52EPuql3udkjR/7YoFOFec
X-Received: by 2002:a05:600c:858c:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1d95773ccmr99705095e9.26.1792408725266;
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:33 +0200
Subject: [PATCH 4/5] ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch
 Display 7" Parallel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-4-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=3yhzmAkS0sm6Z89eEvnHRy31Jkz9wloR2qd4ecuJsYo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qe/r05eak5Xb/exYr29f+X5FfZ4G3D/2f5hgRefa
 sW8zA82HaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIkwRTP8M37288i/Pm6tg5eN
 VBZ6Mrlvmv3xrG/vRfbQ1jsRsTwZrYwMd/LMd85bqCL69jzn710vFGafP3zISMVverOM+IqdUcp
 /2AA=
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
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 4f59ef0855cb..1ea51b13ab7c 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :=
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
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

