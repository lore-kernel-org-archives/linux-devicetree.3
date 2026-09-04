Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEBC1F5825
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564758; cv=none; b=N5mkA6moE3T0MSr+oNdwpFCwXrWAuMM3SyneZfrDciHOusmh3DyVvL8ZKlJPikJGV3GhNb/t4apTY5Jvf480lTUPaHxZ9Yo31/6UKtlwygTW2/pvISpqFTOqDtUyGdiXw2A91yjvy0RcrGUlHyssBeg+z+pVEWCWUZ1d5i2y9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564758; c=relaxed/simple;
	bh=G3MAAk8sod8BrxQc97KrEZ+LUNKv4mzbOKTwBfsxoug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QNbXtSRtfJRnbmanq0dv3N2fjI50GlP5jXqE0EVXmznhM7iEUgEDuxFrOwpnVvezgEB97WT7CGI6D4FYN+yqet9pX6uM7gjrrpE86O6jH84FLg2W2pvW4sxMF5QDRWk/b/2RegXf+pRDnhyeHthjr2SFLcEr/wSpQkinXMyDm0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iSHA1xOp; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iSHA1xOp"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1115354a91.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788564756; x=1789169556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoP3yRaiFCSXh1sZA3gfI7CK30OHycO7b/XTPFpuSM4=;
        b=iSHA1xOpOAkpmDfgicKHbUY6RSrEaY3VM4qq3KODTYY6ZrcacKuw3eJy4xBVFI1wjH
         vAfUDQeKHNiyHrIwH5LYGT4i2OsfQNKqD2hu2RG1D2tR8czodOSaH5gInb8F9naJ/0t9
         y49nMAdu2+DDDCdD+257QxtcWDhM+8FIjHLWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564756; x=1789169556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoP3yRaiFCSXh1sZA3gfI7CK30OHycO7b/XTPFpuSM4=;
        b=IhcKkPcWdqtD06AQmxJaHIOF5R1wRWE5FneRuS15BuaSw+kJRBDSQv0DyKfnSQu7WL
         LDc36OraWgQbhwe3Haz05/xDvslT774wM0e2xbwgZe08blKO6nNI/HMeNsUmPxsOeJ0K
         Y6/zDWZ76IvtxOLeWWU0TFIuijW2Qi8PHlHvEhkpv5YQblF2+DpBsiAAHTWm+zuUmE8e
         U+2+4cpKCB5Yi6Bs3H5qu2BbwZktrKOAlbbEREJzqlMTzuZnBiurPA3xtQkyE9cKoLKD
         gegXo+9gGnKxuUSFH+cCbp5zK9cey+j+9QoRzUOKI0Xc0ONrjUZjyf0pU6UEzO3DmakG
         yWng==
X-Forwarded-Encrypted: i=1; AKwUvByAaxgGUy5yR5J+tycD/MU8BPmy0nE7bg2Z22UCJNIVvqkmkh3nCvkT2aUWbtIB49efpZnqevqwNO3V@vger.kernel.org
X-Gm-Message-State: AFuF++kk6sT0Zpfv9Gq6lzDgkhTjiaJQa+dpykDSn+2VOS0Cw4Tk0Z0d
	DNLvtyjlavxHqDIBuWhy99oNSDRfsjF3W0bxsi8qN8na6k8OycAwUzRDBNHsx7L32cbOMtRe5fl
	+2nI=
X-Gm-Gg: AYBFou3fy7ofnnG1gLRCwk2bIYw5d+t1g/CPhTUODzmVMYeg/m0tMIo2+opef1qP6hj
	b7jma3VrVbj3O+9bzvdBgms3LM9QMNbSiFxOnbwYjjyIzB4IqY348JV2dj6cw6KuQGAJ/ZIz5kf
	3cwMp8sNZRZ3FL4skUDluG3DE/h22jCjXs4AEAsdJdlT2/BN0OTbsiam5IFDNh1afU3i62O5XpG
	BfhR3cLz23OrFrDoVbgeTdxcWd/8Tiktg3I3A4XJ/jKWS213UyjISCl9Zwgcu+xrsdnyBc/eH/K
	qKY+NOhkpYlgmqVr75mka+T1z3sstqs6UmaNnlwdN9YS/7Tu5heqFGTG0Y+1ZuDRz3IDcB72cvY
	1fHQ5Ea+NGD0t0yJUAjJo/SjNA98MTBm2vQO0DKMV5zVuYu5x+Ac4YoEq1abRbwAVeSUaH8RRQR
	l7sMmR/LqZENbwR7cD4wWFybtC4tJDFkLBptVxbKa1tz383SHGOLoZH83Ghq40Zh9hw/QaPRrJ5
	GxlcbF5ir+v+8x9kDFE4fW+RB5WaY9vz4p9
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr14333919a91.1.1788564755684;
        Fri, 04 Sep 2026 16:32:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:1121:7bb4:46a7:263])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339885ca07sm10975102eec.1.2026.09.04.16.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 16:32:34 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v3] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Fri,  4 Sep 2026 16:31:44 -0700
Message-ID: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1 series:
https://lore.kernel.org/all/20260428200712.2660635-1-briannorris@chromium.org/

There is a little more background in the v1 cover letter. I didn't feel
like a new cover letter was needed for a single patch-resend.

Changes in v3:
 * fix the syntax (build error) in mt8183-kukui.dtsi. Oops. (Sorry, I
   was testing other platforms for v1, and not ARCH_MEDIATEK.)

Changes in v2:
 * resent separately from the series, since the rest were applied by
   their maintainers
 * trim other-arch maintainers from CC list
 * Add Reviewed-by
 * Add missing linux-mediatek@lists.infradead.org Cc. It claims to be
   moderated, and its "join" seems broken, so I'll probably get bounced.
   (https://lists.openwrt.org/mailman/subscribe/linux-mediatek is
   disabled, and linux-mediatek-join@lists.openwrt.org gives me error 550)
 * otherwise, no change from v1

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..777da2129e77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -16,6 +16,11 @@ aliases {
 		mmc2 = &mmc3;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 69cab9f9c530..acd5f59b0d4c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -22,6 +22,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..2b327d9ef65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -26,6 +26,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size should be filled in by the bootloader. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..c65805f2a7e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -41,6 +41,11 @@ dmic-codec {
 		wakeup-delay-ms = <100>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size will be filled in by the bootloader */
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 40d34b16dc80..e8ebbb74987f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..f06ca2bc165d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -42,6 +42,11 @@ dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.55.0.979.g7e5102b832-goog

