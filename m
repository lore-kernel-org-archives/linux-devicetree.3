Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658EE3D75D7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448840; cv=none; b=EktEXO++9oZSWDy8mzybq7ZHZsAJzHLPud7oAEOGKtcxYIcsFRhHxFACoKhRYW9igvlxpuuqmNvdu1EMSi1GSn0v/vgVDfPUswXM5mCQ2r9GVEB1h7owAoftxZ4iBbSbVFIsMfp9zcX2eUqSWKZ2nQCf6P3IzFFdRufeHWSfFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448840; c=relaxed/simple;
	bh=jFQm0rjgBpU9oc949n2G41f8CuJwzmzBzE8Zn+NGY2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rssXRsA3AW4GBHVKW8mjd//SDRu0Lr3EGdydc4oN+n8jlSv82GAtZWTfQHn3rHnO09pekbHPq2VfwmY1nT4eS9VKDwBSpfFQRFzDUsMbR7eNq8Im/XQggxJaVGbFzetqF6DhGIoUxsqEAol4jQ2RAbbnIbd0jmCZXTu7xnmkWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWbFRY5t; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWbFRY5t"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so17575375e9.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448838; x=1780053638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=;
        b=lWbFRY5tqHMS7GrtH17UEAn57vSiIYl05S8H4mrbyl/e7bRZ5twDcsf27hZymmiCo+
         ZgY2EFKwET/SZY2HAchN3rMTW9EW/VRDz4ZSuZKuscq9FqtnLMefnix/v/fOT3APDwuU
         AG/BPJxrfb8W9H+m6rhxocTCYstDjb083pB8UbofHodrcEQsZOVJ3gmMx84nfSA+IvUx
         VGUMbW5E2KNwYUa3FgOnMSDGEqUXdwYamxWSFs0BwKHVDKJxIK/7Jpv5kMsIYbMzejjK
         d/rMp/qfqI2kw/Tgl8IpSJ99PtcdQlWoUOO6fn4DNm2VmMNnHJPmmfW4EQQ7MYfpV+cX
         EaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448838; x=1780053638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=;
        b=fKTHVvH14tmuymqNJ5fn3VUkWqp8gBLHMLzoHQbOijeN2BQvZjrnTmpBLE2SPtp1MW
         lEod9jdwyXnwJ9UOIjsVFigyHC/8vg+aL1V7x1qP5ppOWP5Ecvmznr/sPcDFyd/3/rEz
         HgjvVtWuuZBJovwimB1rrGf0Ouw+il5Zw+pfBPe94OqTqSfhcnda1P6lweq5I7amVc2N
         Fvxw8CuQulpTnYSn47CNDjUvL6L3ylKBqdLwKepcoEaLDgodmB4vhZJKa1/zqfqzujaB
         yvwuXugq6BRu1wlJQ5Uh4o4psPsXXMmKeDcLA+uNvFjaIFuTYMA24lwiBuQWTjOGbV9h
         /N3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7iXUaszm1IoQTsnzlb/irRmjrwz9VkBCzqx5gvvLbQ8JepxUugca4V1zFNxGuhaU35BMn1RhCgNji@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wTWCoN03mr8n+drEJhJA3zV8ypszgqoYiqLutOIit0tcPttT
	GLlj349I2aGIjV5eXLbYyD3SlKDDKCatqmAUddgNC5RXroOiiSEO1yYy
X-Gm-Gg: Acq92OGmBSkXmoaitA6LacpvFD/wwOviaRd3IkX9PjOt0EqvxiQhgcsXxRwvyBcuL/p
	i4O+tmAKDL5QUs9YbfFluGEhjDra9i8GGMhVZuCcx7n9ZVeQ6HH5Vud7kCYwMqk8HN/WOGZMDsy
	k0PnorlU7CXakyS/t8tb+x+reVycbBowjz+TJI6NG3H9Gd6wV7+D8W+pTbPc8PG6fA857vxZarw
	/NmYrXcz/BV2tiarGpGFOONJk11mn+r1q30AsmajjZXliTQkk9cPNE8r4w2o9GQs/8LgXQCbGqv
	WOAqbnXjz5BRSmkldMqOdubGIQ+kLGkd19JMRUj8mFUzNXdUH+YBpLaCAA88cO9AWpnTrMAmuLu
	rZ/AgIToZgP+f8cQCc1YxoU8ofpG2KjTPe+8SKXkHIsdTpO/W1SNADdn08pPQm8MWskGBuxAEKT
	Dv0CdB1mbtaHoHAuj50rcco9yA1FjcYgsD88AAjv7TkcAjB0R14Q==
X-Received: by 2002:a05:600d:8450:10b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-490428cc11dmr30590335e9.29.1779448837574;
        Fri, 22 May 2026 04:20:37 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:37 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7 node to SoC DTSI
Date: Fri, 22 May 2026 04:18:47 -0700
Message-ID: <20260522111849.783-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The CM7 remoteproc configuration is common to multiple MX95-based
platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
channels using <>.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7d760470201f..c94a63a3bf8f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
 		startup-delay-us = <2000>;
 	};
 
-	remoteproc-cm7 {
-		compatible = "fsl,imx95-cm7";
-		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
-		mbox-names = "tx", "rx", "rxdb";
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
 	};
 };
 
+&cm7 {
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	status = "okay";
+};
+
 /* SMARC GBE0 */
 &enetc_port0 {
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3e35c956a4d7..f8760ac067fa 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -272,6 +272,13 @@ opp-1000000000 {
 		};
 	};
 
+	cm7: remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		status = "disabled";
+	};
+
 	clk_ext1: clock-ext1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.43.0

