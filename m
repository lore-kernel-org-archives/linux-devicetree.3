Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FD49E12F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161664; cv=none; b=dyn2Xw9YgDaT0lwZPsV7/RDPT4Dw4l90HNoXo3KWK/Q2xZFQhJ7M3i5v9qd2MDXKHxcaoULkt/XKFAutEy8bQ854vaqRzo/+GnJo9iNRvvgzY5vcdg2zIltb6/waJimh5DUW611wIWUYcPlBA4Jn05fAzcZm81760u2hO1HUS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161664; c=relaxed/simple;
	bh=LzFzKdYIt7KQIiyurFYnhAFiegOmNQVla4mXTg3pu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBShz9VUDsDpfjpIbE7zO+6GbiBVTCRjUNexHVy/xb++MFqlgQ+A2n2oyuY1HZSD/HyLNJs+ElcjgBUd4kgnfJEmapI1BUalzpCBphH+8tw/TCQAlJVftQ1QWu6w7jdDIB7x1aj3M3r9uOQLL57tEQoJcRDXuetoOn3Gol8DPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONO4YDn+; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONO4YDn+"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so626370e87.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161660; x=1790766460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=ONO4YDn+u8wRBeDJl6f4o/NuYrh76pseDkXQ44TcpJQcyzYjg6gWmj4o0VH0VKUQJo
         2UZm2RIva9ewPaGxd5y4JT47/ispM/b3GekAYPb0vjE8S9ReaDIz6K1K9Xec0cD5wBJh
         5kqAxG8iGTm3HkFqXrCVw+3iG6oyWBXhkato9jm43orM4t23JeVmUNI99Lb3rYxpNN+1
         0tR+Sww/mp871GMlcezUuhV+A+wj3E8ej/qEQVxT/+Ekn9L61ygkv5GWsy0+RXNQlvYr
         vhu5PWAobZhyhkLs5q4I+j4a8QiVNa3JLVoKAklw8y0dWlJJc0dDFf9ZY66T6K4Ep+Pj
         Sy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161660; x=1790766460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=ookj7VNpIhayy5MIcz0W6lEWozYsHXFnLe34sOy2dHRtk+b0m/aB0YNAJmXNz6Rlcw
         tfD59JrLkcqOh85cVCfWzQ1QbGJFVaoqSMdOwtGgiEp+LRpopJydqrvrsxMjCPcg24ge
         vj7PUKAynLvFRgORpPDf1BL+tvoU+cv5mlZ7ULhjh46b8QuHatb8Yv0NLtqs+dPAkkK0
         9uSdE1f7hpRgyhxEfnKwXXBISg35aBy9LLNxY7BOjdR+W1CV3bYJbQXjA7x5hHdgpj9D
         mCJnaZnvTkJXGynk1DIl6u3FzNwzE96nb/ZyHPIokBXQM+x3Q6o5v7JNk0FjUubfcmna
         XpdA==
X-Forwarded-Encrypted: i=1; AKwUvBwE2tWKooafghfc11pyFvYbPSFHJRoOmFJ0jnW+aQdziwJ7v9gsCXhGQu88fHGGHHeCzdeai3WZyF6H@vger.kernel.org
X-Gm-Message-State: AFuF++m8+kr/j55x/zmOe0JP54WEpbOsieU/Cf98hYRrVA/cpewm55vC
	lAxObIeNnSmL1nyh24D4drI53aF1MVtRalORpkXngvQ2aysgOPpwqvpj
X-Gm-Gg: AYBFou1Ow1vv7SAKnxo9nkjEeiTYrMNZXoGLrJMF2bCOgt8I2pcWO83GrIl/LKDWs2M
	0mWm7O/UOXg/4WCdgMsp2/DtNnKPspKizpYTLup0JNWyY5j7h2WMthSeos4ZhjoU3tY2gpuRim1
	eBInYZahNf/Kcq9dBFMkd4CqcVriuZjf9aN12MHtLBaLSlM4x0OVFkMxZD22etlpLk85SpDuQ3X
	SY35Y516h7auu9gn/LQTTACNBu6pu667w7wBxz+vCcjvlgBs9cW5GiOWvASDPGbS7M3M+9JPnA9
	JSdSJcJNEYUtsuqj0PWIVtnofdFjGceUIC/dcCulgFi7kzUXSfeKQUQcIH+Cr7xm94sO8YUioWP
	pQ4rP0S1lqqrqycqE3AR6znU2fgjfiv2Jv/UMMp2fTuyxZ6nkL752yrdM9EhX3pmddkdmz6EMmu
	Cbdj3+h+6YWVoryRI+H7oR+frZxpU/nrJLraSrKwnRD7SY0iRFlI8MAPzpPdfiMcRTVSw9EIXM7
	QJaE0ifG/zDw9BPVzUK
X-Received: by 2002:a05:6512:3e01:b0:5b6:17b6:2224 with SMTP id 2adb3069b0e04-5b8d89779f0mr771643e87.23.1790161660218;
        Wed, 23 Sep 2026 04:07:40 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f2f4sm521750e87.65.2026.09.23.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:39 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay
Date: Wed, 23 Sep 2026 16:07:35 +0500
Message-ID: <20260923110736.10-1-anykey196@gmail.com>
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

