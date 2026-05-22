Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9F3AF64B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456050; cv=none; b=qz8uA0oqC0IoV/t0zuUKu6VS3vzjJs0uJ7PcluobLpgmgLjNp2ZpvWW8dGDow5xCZoIkL4QZAUj6u3fIIpOK5Soic1S11hQuSmcMyUQ8b7eWw46IMIEdfJdehx/Cfja4bSKlbASMzeKHxhux8ZuRY70c+c9074xIel4v4KVp2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456050; c=relaxed/simple;
	bh=ZLqTvLWlGVqpc/WhFD89fa/q9UaQQhCW1j3oilKl0C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxgIVBvPVXXAlNuozSsVg8Y9nsFxV7yoAvJ+hrlmElODAADDrQaD2yv7sdDv+x1hXZA6Dlc//I2wz5knV+VnBQixCXMoWRC8MoHnL8CJvD63Df0W+mBfw52MrOkVEGjehTeawyommxCc83oFzCaK5mbak7AM9gCKw4rA9YIrL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMA3FvwB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMA3FvwB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so7167525e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456047; x=1780060847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=OMA3FvwBiLH7Tr6sMpwroirRyF+06MI8mbTwZK8sdzh28QWfqnmh69tFA3NPwfFh2f
         DeLQ5tEKfo4xL/7cMV6wM+fLiVHEZ3hUBMwJeEMW8gGzH6Nlk5qHyCQJUnwd09cp9DVl
         Bo7xlKMN7o0Z7TJ9/2KLDnN3maJY97wSmyNQDie6uCl6PhTRhvBLlaKCDbO2NSrw66WV
         aNh80aBWb+OuE7sswso8lGmjCFqDiuHuot2mYLxCdkINUkjC7bV3xy4HHHDKcGUaCAwB
         Yw4b3Z0IrnBubmRJbtFlr5yArNWn+JKKtD8EXtAl/75a5IO+OweIUzUqaVHJPu5+/1wa
         HSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456047; x=1780060847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=r516eyl8BAMeOmyDMxIAmwDkv31MlzFDfecVWPNn05ogDrj7upbuGuQk2uvG3i/OEr
         EfMBwBvVb7iKVxtpo3CxYT+9MSjNne4JrSdAW0gyq/i8P6ESxxNC3Pfvlit2bv6GNmDU
         DRHM0K2GdPXf7i8/V6BLe/MJYQMDya5XCXCyvkz6N/uSqg+KiOMddA00VjrGPMgOrCZy
         kRfYgt4qCEz8kdXA1U5DvkdBzu3QtVTnAAmHsk4kRv1qSOnrhXnm5pdQLbJkeozVJGD6
         c8cnKLCA4e8X15Nf1Eb1O/XN4mxgektOWqj/nwJ5l67aORaMmR9T1NbeW77i7zZw+U3O
         bEwg==
X-Forwarded-Encrypted: i=1; AFNElJ8R0NK52sOFPK8ZPESVg25qMeVA8AahrDnoLvkPOpWP4Nr3+z5EoeAlCrC6ksNcXTsL1x8Nj3pTGvJM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq1uPYyCBv7zptJ/5NCaRQ0rMIQeJCv44O7vE4fVSVA4IpbCQ+
	rmYNSG91elFLPZB3wv9Hcban+KxJHqJD1MXjduYOhRFPfSgOuVic5jNk
X-Gm-Gg: Acq92OGkh3nsGhxW7bR4looS5LeXCQwVPns/CSbKzeL+gXDghC0IYvo8ZFNgAUsajUi
	VeSzFL6bIewElRpHyonrLi0nflBkVSv2ZWCXLyYT54vALJd9qK9NFhjw8adjFvoazsmDrp4jjzj
	6YkV+XroM0SfOSCop4w81S1v9FWuNoKp1ZqNws2EChCs/sJSG8D2IugMFwwRDDgsgRflroHqEoE
	HsyQL1B0XMrwRpTG/4l7dRvUhJD9BanA1vWjlhY4DYseebrgSHo5wOiYGV2SbQAr88/+dLVNpX8
	U6kTNCdpELU1tANHj9Fhkpi24Es4JX76827mcSasAOjDUmz9G6a9sYY/r43Jk67RaCFExx/QTOW
	mHvRKZrSW+5+CKpeHJAs6lpciP1339JMTwiwbw2iIO2W5xN2h+LE8LCu1yTmlvqk5f1j0e2CDnk
	v12Xiug8h0WRW0skj2Q66ie9QmvVtPhgW4PbhJMw1EeA==
X-Received: by 2002:a05:600c:470e:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-490426aa413mr49128005e9.9.1779456046963;
        Fri, 22 May 2026 06:20:46 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:46 -0700 (PDT)
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
Subject: [PATCH v2 07/11] arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
Date: Fri, 22 May 2026 14:20:20 +0100
Message-ID: <20260522132014.226721-20-ivitro@gmail.com>
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

