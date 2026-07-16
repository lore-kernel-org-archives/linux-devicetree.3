Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC52F3C3E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227403; cv=none; b=PK69s/aEwIf0PUH9Qhs6bjHSGMTpoqYYQT6zbKTMJogyf2awLG/z07ik7RSwdvPflbGqJmpRb64rxjj9Jgp8PpacKxH5cS2+QkGJlLUfv5Vorycf/XGKYUWt11DC6DCDI3qidyIjc8uh3m1ojGIAuSWD17AlIYhjpYY38rV7YeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227403; c=relaxed/simple;
	bh=+slR3qQ8e0+eVCDidEVqYlIHZVvRu4L2ketwFigqOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9/dQu4AcJ0U1MyovQ7OqfdryrlKtheW3H6I+PrPMV79isNiEsrgmlTkkFPHXGRULryaMEdaZwMUapKDG49JyK2Mct5GV7orwzEgnSsDjgpGNoYCOhlt/j6mkzDLrT7wEVhEJQOveopJsBOG7lswr3YCmmoEBzRiKCbLmuQxZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HI555y5w; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HI555y5w"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so56359735e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227398; x=1784832198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+owPLS3W62V7LASlKWJAuonWiR0ofRaVkRMdZyo+/Oc=;
        b=HI555y5woTCO2Dx9LfS3zQxtevK2fdfTG72omweUlzwOk6a7nhnUBTaEB3Widx26Xw
         PydE+2tVkTUp+TNP+UOaeBXGIr3TJwt9sif2JV2F/7+T451AqK74gTwWWTL7jhh2j1PY
         2EMwysFhAyloHe9ce8m7hAVE3+SuzJQ3XuSW6x9WPdEYhP+wM6E/S8ouDusc0mNDpzvj
         KkGrcJ4UR5EE2xPfQvbd3Yj9neZ4SlIo8OGFt0r65C27n3H0vbE4SKVL05hr4Y3mGX3A
         kclfTOLmhSLjj9rxDGfH7tW6NCTsUX7cYUFxFE6/3LNJv+1Ull2NyTAvFLeUS8Ma26uN
         LGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227398; x=1784832198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+owPLS3W62V7LASlKWJAuonWiR0ofRaVkRMdZyo+/Oc=;
        b=QjLANLYm/TCPJUqVH9/e5m4gG7uL5FbBoiUr32YuEC8isANkgwQK5v4iO7xoGclrLM
         PvXpEa6Xfv8eFwL6M6iRLxkGwIhRtk+EyR+in52V86EpXJGNUBN4dyUtXwCQQynm+hsD
         r7KNP6YLNg2+brTByhvA4Fl3PrUm+56UVISEu/eC4f1CtIEbr4H9xosCi7O4VDW/ttFp
         a6qydRWFk3EL9GqDCms1zxOx30Dh5wCCtIIgd9WiSoDYvq47LyJlwyKsjO+3Ei4fx+pg
         O4oE/wFEqIn8oek/CLtnr6UyYUmcJxHB/MxxYMmMbSPDKZDvJbL0xxmX0W3TKpG/FXdC
         Ro6g==
X-Forwarded-Encrypted: i=1; AHgh+RqwZh0VNe+EwFiSJM9zrbCZMJrWetNmcUFBmGS8TpyRDCGq9o1OL4vGbsiDY/t8kmUsJ+gSKCXD6Kou@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EEVcuyb5Vk1WJ7Ztz6ascq/q1nIRg5W+UjKV82t43JyOLdXD
	mrJUXDlyaDB3PqbqfU01KQ9KSETyrzMuq2WGZvronmIGASGhrp6+opGc
X-Gm-Gg: AfdE7ckr2+6Y06pz+pmxH7IPbML0Hfm+xryDhLxB/vk/u3kir+93vpZ5/45qWuvqCkI
	0UeWay+EguA0ZTxIsOQK1PfPHXlnJPamCsyCFUvoe4mLPlF6MzIq+VytckPPoZbl6cQGD2NUdyM
	bLUmXVhmoB77R+C5KtzQQtYfnjpOjIGMTEbMvetPwAw4uf9X2c20UMbWmtZEe1h9W+PzRqdoMaB
	E72dWIR8K6FxCouHwTF/UPMgwD13cHV/OfEJFn5bDa4eBZYcxf7UY5UmvNgEK10JS72RwQwHcd4
	4hi6J0E4urtSIHv8JCkNUUZjZxBTWazdcl4OKkxu2sCHZkDtMVAEi3lekYLOm983BJgpUuVWr4I
	xa03MGC8u2oS2KgkikgVqKkPoylI1IZxH61YrLgp3OPF8VxwHbHz9GxdcvsAmB1SYmHiV6A==
X-Received: by 2002:a05:600c:4614:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-49538999453mr94144035e9.14.1784227398284;
        Thu, 16 Jul 2026 11:43:18 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:17 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation overlay
Date: Thu, 16 Jul 2026 19:43:02 +0100
Message-ID: <20260716184300.85413-8-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Verdin AM62 and AM62P both expose mcu_uart0 as Verdin UART_4, and the
reservation needed when this UART is used by the MCU firmware is
identical on both SoMs.

Rename the AM625-specific overlay added in commit ca61bcec3e8a ("arm64:
dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F") to a common
k3-am62x-verdin overlay and use it for both AM625 and AM62P5 Verdin
combined DTBs. This avoids carrying identical SoC-specific overlays for
each remoteproc firmware/peripheral combination.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                          | 9 +++++++--
 ...din-uart4-mcu.dtso => k3-am62x-verdin-uart4-mcu.dtso} | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-uart4-mcu.dtso => k3-am62x-verdin-uart4-mcu.dtso} (69%)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8541e43d24b7..874577298d6c 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -48,7 +48,6 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -98,6 +97,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
 
+# Common overlays for Verdin AM62 and AM62P family of boards
+dtb-$(CONFIG_ARCH_K3) += k3-am62x-verdin-uart4-mcu.dtbo
+
 # Boards with AM64x SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg0.dtbo
@@ -248,7 +250,7 @@ k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-uart4-mcu.dtbo
+	k3-am62x-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -283,6 +285,8 @@ k3-am62p5-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-ov5640-24mhz.dtbo
 k3-am62p5-verdin-wifi-dev-ov5640-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-ov5640.dtbo
+k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62x-verdin-uart4-mcu.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -384,6 +388,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am62p5-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am62p5-verdin-wifi-dev-ov5640.dtb \
+	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am62x-verdin-uart4-mcu.dtso
similarity index 69%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
rename to arch/arm64/boot/dts/ti/k3-am62x-verdin-uart4-mcu.dtso
index e263809cdf74..a3b50efbe52b 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-verdin-uart4-mcu.dtso
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) Toradex
  *
- * Verdin AM62 Cortex-M4F debug UART
+ * Verdin AM62 and AM62P UART_4 reserved for the MCU co-processor
  */
 
 /dts-v1/;
-- 
2.54.0

