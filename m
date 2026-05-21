Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66314364038
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375679; cv=none; b=R9wRRi7mU5U/ZPqoODnX6obMmWfo2O5goKerbWnCY1g11OmmQ3yd+KOjQGlCex8blB3TPlt03RJ91niDiQFnqhQDMZqX+UgtwpjLkeG+ITqwj3Yzpq119iUrs3jfOwwPh2f5PB0bTDrIKATLIBZ/OS+AG48BPnWlU8tARzyouiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375679; c=relaxed/simple;
	bh=ZLqTvLWlGVqpc/WhFD89fa/q9UaQQhCW1j3oilKl0C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUH8vnpCOv5D2p37KbwcTyM1kCEuCkOaNbs8L7UTCSg1e8L5c4UikrvFSzszNhsTsnLAFCUO/1nD20MsALRlRzB5RfrJnWWf1J6SrxSYnbH0ItLhmL5sg9/sfeemAsrMcGzOWplJq1NNOnHM5mMbC81CsnASrX5oqe6gPsa9Jf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryoilyMj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryoilyMj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso3468803f8f.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375677; x=1779980477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=ryoilyMjEONPWdafrpuONTrb1DZAjkSI1iOHQ3q9uk+UBUf/jZhjdGbOClXKbn0gzs
         v/uNX8BgvfV9ZVFEN2UxGdcuU/X1NRPMXc7Kz6NtZNGfIywh6fQ7xN+nCMcBpwNoXZ9y
         sPXjkAYrerLopraCESY6FMrcvbyYduswuUPVBFB5tss/37R77R9sIWjsJtF8/uXjTRdc
         nKWavhda5G27tkK17oLwuspfLN9JUmXuqclakjUO8+Pt95uKj9Kx4XkUL8NSvKob3mBq
         0z2neS0unRYYB0wCfPkq2rMc/yuVF5AhQqcr3aK1VCOfJVdLlQv8fQyPacLyUXFjpLw/
         Klsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375677; x=1779980477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=aIPEWYJbD/2+n97dSEvqjdIl4bfXwU4Q3edAFsa/tE9qa8ogrLjgmZreOshUIpqrgC
         SqLqdABkcLZmBuFrQPLD7P+C4brYRumTqL1QAEI/n0EydQIxIfjs9kenjf35MJZcE5v8
         8y1Yfe/qnzyi1ysrdLp7PBKHMgEg9PYcvQZkA1pnGV5s44EW0M/2Sc04+7ruSM4armLM
         +xURtAYJFn5hVFFV+0+f7iNh+QQsbQMYz6oQlGhoEIDuQ1nV2MJhyQXmOSwJrcZuxhwI
         36kZrORjHBoRRxUCRl4+tzYleZmd9UCBvRqRY4vjm/K9iHHsOHfFRlADW9lR/qczReIV
         9F1A==
X-Forwarded-Encrypted: i=1; AFNElJ9OmpvsBjdZkLR2F1BcHsDGNnRy1lJYLkkOdr/Me6mrCjtO216p9Hpedw5ajaNJD/gLLbXfo+BVeY0f@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0idzrCWNXhlvXYEpEQ3JQU/wYmC/KqstUp0V88XA7D7w0A+Q
	iXRoG7eEM/okobUoS2AUUF6gq4x64Zhae+8xkEE1nYMooUohGDOPPQO7
X-Gm-Gg: Acq92OElI02jwfWYK/avr5YEeiVndLYnaN4QeWuCvQPkn9I22P/IauwFnoPeQqck8h6
	6KUuN8PHvjvzva9GYGygRnBnWMC8VUpB+QtuE+5Euka2oNOt7+m8E5cRVg6J7Dmc3Pnk2pNZ7PM
	IF5ZVFc2uFrwPWDXTBszVVKTts3TpPc+zoXy0YnQ56QI8iWmVxBSGVBnOUT4zOQ2KSym/xZ/Shi
	VzsJgOcNPz3KynIY3GdTXFEsacNSDIIszOJ8lydmlDgh4/CvdXCctFHNxjVQQWXNPg6vsRLNu4y
	9fNRK9sAcLI5WpVdljaj53tlCg0lh6Y8crENcgvwbYOsPU6mOQ+Jzu1QKRdGxolm1suY9OwLbzS
	jAPpzfHMUD86VFI1+KOaclgf16NRMyEhslqEKUiuK3jLIN5r6hSOZQiMOO8rg0Xe7YRBH2kbi6k
	SBM21hj0+nYHN4f6SJjz4xEzJkEb5wCucg286pfgk5kXslywA/wFmH
X-Received: by 2002:a05:600c:524d:b0:490:3893:c4f with SMTP id 5b1f17b1804b1-49038931006mr39445515e9.3.1779375676464;
        Thu, 21 May 2026 08:01:16 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:15 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 08/15] arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
Date: Thu, 21 May 2026 16:00:44 +0100
Message-ID: <20260521150038.103538-25-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
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

