Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6247AF49
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466314; cv=none; b=tbt2y+qZxDghdZt6DVh6dBwEW1CtXI3yO69hIkKzq3GCEnVHMOOA47QZLdXNKNQGcCLP/iyW32+PUqhchUlr9ZC8wCdeD8lK2A7x2qoVHzbkpLp5CQWMdW5wynNv3PmiJsRkfNan59NPzc43GQTFHgvvwASidCm67VvaWDWoBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466314; c=relaxed/simple;
	bh=ZLqTvLWlGVqpc/WhFD89fa/q9UaQQhCW1j3oilKl0C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kz7oF4G2kVxF7ol2MTe484IO2jF6eDa2TlMTL8K4tcIpCutRRR7UzNhROHrfXrhtGvz85ePxj1oLTm/yDHfkb4ac0CibOD9dx7XinN9e9FAFJGUeSvZn0gtnusqP2hwyP7eEMIq8dwqvN0SvKFVOEy6gYxdMqgUxCIFGrEnULik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEHS9gzB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEHS9gzB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso39603865e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466311; x=1780071111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=mEHS9gzB+vAbpDj9Q6Xw9S9OY3FEKS8NYaGq8Ab31pL7HbVPZgA/kPi9noyUex8cMX
         y21zs/wbpAdiJB8r1QmJqJT65Whdh/ZiXIA99ExdogCAKTrUV9M9l7F8mjfpEGdWEo9Y
         xsrlTT0RusFxrVr+iy1CM+4+xpPceaPJqkd13LL5MGJHgKdm1lgMo0KaC1Zpp30Q9Qi6
         D7E5cx/d/ZGhDuOlU9PR5ETrkga6MiBAk8ASXRo40hIWrDw7HpIIRbRIOPmAq1Euj5Wm
         N5QbyOtm0o7OjM6oeveVpVU6ufLYRTqb3i8AxF1UoOuiB3v4KVhzqdqs1Z7Nwi5khE87
         JwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466311; x=1780071111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=bPAuBMuM3DEhS31//vxZi3g6dMqB2e0D2dMTDS0jGd5+ZIK5GcEwevAb+SPWCLOv8c
         L3oO73gnFXj14XjLoIZyLFCnOoK5hr+WBMkTfhVigsyH1BnW1h+clDQ2zkDgx7FkkwC9
         yzWxB/rPyFDfX6kERr6ZhIA6opgU3xTCv9uByZgKlyebYmQ5s/3TCTx80dq9Ky7oSWGC
         nHmkA0GSBVfzjxe/GcfsmYVlrRiF63EBODibMiPdoE5o0f8MSbtK29grLSWiaGp7b78c
         ndw2rbmtp9c2dA9SZQgDSwYK4h1Za+CdF49H9PgP5sBlb+0++LaP744ro/SX2jsyMsyW
         2K4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9nXaierAiiPoljk0mYGCQSmQNNolVAmEisbhFU4UsCwF22XGq/uiUCXiJ8ZCrsa5kgaAZUEZI1t0Oc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LizY50jyvsvKgPLgL3Q0lDn5aJ5XJK2m7P4PhtFLlJzs4q1d
	sMtEcaOrJiiEXJtj56Eqbw/KZMauwuhj6nAjMKMkEjAJcze0zrjdl/xS
X-Gm-Gg: Acq92OFXMflENJRJyTIGIhASorVNVTtC4w4/lx3Q1818h50sY3hnUj217jh8ef+iZw4
	UJH4SnxZoOUfEH7oIhmqfxskVHD/ZwyNiHyd6jUkfFSXKEcEj88jpNHXopsShNt7N7yWw1unrvT
	WX0SHCgUAPvptkbzm9xgHA/w+0Je7yTqpyMfv44hR2FhCt7ik2fUReP64sjojHIIKrsXoqf/IpZ
	H6L3e3X1pu2EsvFKDEtwZrSokSDeNgi8+rOYflajzo5wNALqteV33zsaERDnFDtUvNXKlaZxXy/
	s6yMvYJrRgoBKYketH8YX8eV+zWhh0H/EiY16mJy1dfnK4bxpcdlIUx6Zq8N1wy/wpDMONg9NTe
	hnkScBvIyr7dHNe/O23S9Kk3/2L8Rsh+DcvdovV5vK4OUfaW3Bh1hhFpRJ86/VPLyWDDIVYxImd
	o+ypxlG3ZchoQUp9PqPqwuPA0z3EQCSsmskfF7tYMvPw==
X-Received: by 2002:a05:600c:4fc9:b0:490:3893:c71 with SMTP id 5b1f17b1804b1-4904248839emr59095215e9.5.1779466311391;
        Fri, 22 May 2026 09:11:51 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:50 -0700 (PDT)
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
Subject: [PATCH v3 07/11] arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
Date: Fri, 22 May 2026 17:11:11 +0100
Message-ID: <20260522161105.277519-20-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso    | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 14898f8ab0e2..a1083c0b2502 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -224,6 +225,8 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -332,6 +335,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
-- 
2.54.0

