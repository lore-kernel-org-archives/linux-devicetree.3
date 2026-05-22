Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37143B1EFC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456053; cv=none; b=WotDZ3IJ5Y1GOsJtOF5OKhFjwD4A67/ya8igpSNFrg/3z0iOCYg2jdjCtItBo57nuSo0Y3DUd+g5Xd5VLks0N9KYSnVG/UlzgffUjttN70akHmx1YJ5TYy/rm1tiwbGDaHypF3RXi2QI6Ak+hMUGh3SmsLectY2dgeVDLy+wyqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456053; c=relaxed/simple;
	bh=Onfdz/xscxQ/YvwLu1pxDVtAauf991A7gIDb6FNuNSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWjvREvEn1V0idt9l15M415VBZWNL2oYCJ7KxNfBVrwlsSowtNhORHraLlZXAqV23oMFO77kpW9qSDNTMrrhYQCVCjVzfd9ZIysozyc8Oq31UJ8toSK1TpejoCrOCbRwPCK8k7d1H5vgu1GFEl/Fb6R0g6lbXEVuITAIIvGKuZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OapLeajH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OapLeajH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49040362e4aso13421905e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456050; x=1780060850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=OapLeajHY+pPMYnPtBtOcuJMbj2yJ2fixTWV+oH9Paet6ORjC+1VsEWYGcvlEI+U2O
         almowyGX1W2qGFeMVY9KDP5grmdPxwQl8EsZg5wen1t10oluRgPvupgl6fonmUrzNw+F
         X4qlsyvBZt8LrEUlszidev/7Dg3B1hwRRcla8fArupkBu148wgKZVSjt7Z7xAlDKZV00
         F7Z8TKRf6c53pyVt08TFBCN5cKADfBU6IxkNwf4m+7vlHmcQ5pQt5X9YsytrIULABjGP
         Jlqjp0Le57gQLHauO6yOsDRibJDHnAERXa2aILEoTFUBo7+MpVHpWSWAkASMJEIjWlJ8
         X99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456050; x=1780060850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=X1m1yeIJOQCY6b58DEz5/AVihImOL4S9pk0qRhmNWt9djmeUUKxd49LDyv0HHxlujQ
         EB72Kr3rlsAWASGP1GhGx5vuiSn1m4tmyxxXCYzTiUAVw/j685xkJW8Vq13AFRJXXayW
         48T0ZR3d90KJCsQFe8KQ8GGvVkJFSq5Dh5hP8ocKXuW/mE/xtD0Pq1rYczAyp7hLUKWH
         diaez1PRpuEMI2RvpHCAYytZ0JKtfj5ncpjztjUuHsc/NGIF4oI5dqeOLkzG5vxxx7iU
         RfCURI8MYdyaanyGuyBDDtwQoh71+flzJUshRwFXZq1Sac2xyD+psoJ9PLaXMLRttM/M
         lfqA==
X-Forwarded-Encrypted: i=1; AFNElJ/s8TDPowCxiIaLq7z4mpti1zJ7XGsnTB5QGLp5JBbb9db8DdiwhPhgFTfJRMFGO93YVHaabBqSXg5+@vger.kernel.org
X-Gm-Message-State: AOJu0YwsNs8QHVMSnAEQ3qGUkQnXaHtpig018vnUkWJs29wuypb7vSGI
	oE0td1FYd6P7nUrGPOM/JmVAqPXK20wH5g4GwDU7I+BR1i11A8TQV1Nl
X-Gm-Gg: Acq92OGz+wkPfTOiqpWAZHKg4zbOFkdVW+v2BybGd9Mhknt2pi1iRKoTwsU+aC1ciip
	q3l7C5tWzA7EV9UUHTU5pIn2IzR9Iosqe5+vr+vtz8aRw6mpKYUjJG/9O7LanOWC4p+Tx8m9eP6
	pfpNZr6tWsIV3aOv7S7FX0HZJlXqHvXtIszEnHc7JwxNaAuh77xCNxqjedHBaW0pdOZzzXBDNFA
	gdU1+5PIvUO178kR3Z5SpWtnNJR/Zxb+74Wj11ujOKedKgzG6IaeN1FN+A14MNEDxlykxluQ88e
	bf3+g5QYxIvJD7a9RwbT2bWYQ3kzap52Rak3A4NcnFrJYryQcr8tv1VyQgt5LJSRzGLw5lQQpCa
	j+M4YeRlgpIyODfPaeknsEIMVAkWRMxwpm4rxJ5Fd2OA2Ziag8F8Kik1gbXzRFFZVoTjjtPape5
	USuGgf4JqtrLbb3NbYIFM6S758LzWRI3YobPf6Nlr/cA==
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490428e03b8mr49601195e9.28.1779456049615;
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/11] arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
Date: Fri, 22 May 2026 14:20:21 +0100
Message-ID: <20260522132014.226721-21-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay reserving AM62 MCU_UART0 (Verdin UART_4) for
use by the Cortex-M4F co-processor as its debug UART.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
 .../boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso      | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a1083c0b2502..31c9bc1d48b1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -230,6 +231,8 @@ k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -337,6 +340,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..e263809cdf74
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin AM62 Cortex-M4F debug UART
+ */
+
+/dts-v1/;
+/plugin/;
+
+&mcu_uart0 {
+	status = "reserved";
+};
-- 
2.54.0

