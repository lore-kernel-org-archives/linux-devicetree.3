Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE3497B83
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162417; cv=none; b=mpkfOMSwIfhrhIyPzZnSBD/1cGaafQ61Q/uiWkldK2PPpiIYE3ZIGf039oU0scsTsklM2rw3mj3qkXh4kqD/4CayPpX0phnJgSWdIs5Tv0rfy74X+TsUsTPtupTKpn7MYm2uus84MtxTudV1fEuxy6X9DxLbR03mJYfmb8QzXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162417; c=relaxed/simple;
	bh=LzFzKdYIt7KQIiyurFYnhAFiegOmNQVla4mXTg3pu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEvJuLUvnRXYsoD0aLcHp9zPa++pVXO7daXMXk5E+6Wwab9UiYeX/dxLFfllwrRrfRD2cYqLbEpHE7P/hVdChTk53jHpwbe/gAzi/tXd7L9IKsg0YOYMrjOAH02R6zIqUmCm2Q9zG0AJ9H44yP0iuF5hUQFR8i2ZC3gDtw32ZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=immSqu+Q; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="immSqu+Q"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b79784a6edso693961e87.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162413; x=1790767213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=immSqu+Q0HsFGrMKQZAuoLPreMas1WOv/nvmfoI4J60D6ctvxxkMHCdHM+B2a/qZJi
         29NAvABABLr3+D3bMQE2ZrpCyyKOQJ39OfrV9u6MevxbmmgRX21J/bPyu+XE4qkSzrVw
         8ZZp3l+6RCsZz+rQhLUfzqBoFCZIxqDe6+F4O9lZWg6yAttReDPjjNgaFkjzbxWJBI1E
         llRPIOvQodf21cousOXMtA/a8SO95R1+78+TvI1++G/WaJ+UqxCVsX5/J1H9WiZxP2sf
         5si5s4ES3t+t2+6sfMnehFq6anCmQEV2qzxmW1R/g8h+iZi6jgspgN7sK3RQ0X7SeWhN
         vuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162413; x=1790767213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=nS440Y+JlWl0RAQ99Ebuo/VPgWi/caLMaaFuc+2DT5SOhW8QxDCdyeQGm71xRzZ59f
         lAR7P5eI/ANvgUL0VsZaXPTe6JmUNHvSOGoKim2rYXePxdzjGoHcdr+jpZ3FRF659WLV
         OpPfZ5aF+UwTbMXiawH1CQNaXeYLx5cIz9vjLWHsPxF0Vgd4mP1EgD1LODjnZV8SXfs0
         ZbDfflFJIEe001P2e+zZzZfWgRFCtOp6B+SvN8a8b3uL3maSXM9t/pRu6pmUoY3qv967
         Y6i4B0x0Sbs4eco4K05RWIkjI7jJmFlbT53nqqeP9HnxwGJDvZjoB7mTQYMus+OX0VCj
         NxhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF7D3rWKUshULfnmaODkKeEQMtMvmvto3t58DVuduo9ZjUZT6DyukCTqNJ/PYjQOAulljJwgZB7Ddv@vger.kernel.org
X-Gm-Message-State: AFuF++lY0SvJEoNuloZn06iS1nc454rTA8o6fKXzqjDVE13Vq+SSh+x2
	SRehqRKHgEVJ6l9vClKiyjxdEdtpy+K6DL+Oe+VTdHOg+8RhGzIYgdWQ
X-Gm-Gg: AYBFou3XbA0V7k87t16RB7k0svm7Emab0n4dM9mjLb4z5zDmOmDlo8l8uvwKkGUBoSe
	8WQ3zFUJE53Pl7BJ9++PB8rNMnIQvRfkgYzPnbR79ozMdePbopHKmbNYT+Jzgn+IanRUoA1O+kE
	WJiohOkxXWAYYMjD/3jj4rbUDFrRfMdhfVA/8sQxPaoksIdnkf6jPDH9p8uewAZ3SzQYSjdtv2K
	Hc0ZNElBxUz/3jUMbZZ1vEPCPgPly3f+RIgN6ZiCy8ELbOIl7BKnImCcrbJx3WYWesU0dowd6e4
	ovz+o3XOVcfXi6yxFNFDo2ZpAjTKsoSTeTh0/zCxUGjj5LEZx1LGCNrOF6QuvxWC1hpgEOes/iV
	5ToPooDOiiD8AR1h3LH/pv6vEvbqIwyz/h43J0CQslX8BhOV6ly1hxHwnyGjHS5BffHyb9jM3mk
	QshODj8SlxZRA1sp2peptGW476t5YDUAJkWQ7pGkj5DVwhquEZEbVDBg2dOhvK1pSXsVt+nCEYx
	wQiuio2t8DlggjXRsU=
X-Received: by 2002:a05:6512:3091:b0:5b6:4ae:3ff4 with SMTP id 2adb3069b0e04-5b8d8967f46mr778397e87.28.1790162412004;
        Wed, 23 Sep 2026 04:20:12 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm516505e87.82.2026.09.23.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:11 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay
Date: Wed, 23 Sep 2026 16:20:07 +0500
Message-ID: <20260923112009.1062-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The optional 24-pin expansion board carries two buttons on LRADC channel 0
and an IR receiver.  Keep them out of the base board .dts: with the board
detached the LRADC input and the IR receiver pin are not driven and float,
which can produce phantom key presses and interrupt storms.

Provide them as a devicetree overlay instead, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  2 +
 .../sun50i-h618-orangepi-zero2w-24pin.dtso    | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd646..e4576030276 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -57,6 +57,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w-24pin.dtb
+sun50i-h618-orangepi-zero2w-24pin-dtbs := sun50i-h618-orangepi-zero2w.dtb sun50i-h618-orangepi-zero2w-24pin.dtbo
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-yuzukihd-chameleon.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
new file mode 100644
index 00000000000..2d7e98e4b66
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Device tree overlay for the Orange Pi Zero 2W 24-pin expansion board.
+ *
+ * The expansion board provides two buttons wired to LRADC channel 0 and an
+ * IR receiver.  These are only present when the board is attached, so they
+ * are deliberately kept out of the base .dts: on a bare board the LRADC
+ * input and the IR receiver pin are not driven and float, which can cause
+ * phantom key presses and interrupt storms.
+ *
+ * Apply on top of:
+ *   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/input/input.h>
+
+&lradc {
+	vref-supply = <&reg_vcc3v3>;
+	status = "okay";
+	wakeup-source;
+
+	button-1000 {
+		label = "KEY_1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <1000000>;
+	};
+
+	button-1600 {
+		label = "KEY_ENTER";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1600000>;
+	};
+};
+
+&ir {
+	status = "okay";
+};
-- 
2.55.0.windows.3

