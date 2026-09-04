Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66CC38A72B
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562628; cv=none; b=I4G3PIVFZy6A7/7C75wehYCrk/uFy14aJKtg3ie3HGJDpapOoM99xU7NlucTi94aW5J7b1rgkq2NIy7qRHf1yN33i2NvilcCiU9m0gcbvGauayl5d0pc37O68MGEiF06Neps1iZeb4G1KW3sqORtZaW2zork+TWA35mP9ACgmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562628; c=relaxed/simple;
	bh=dzEvNmjdyNIVi6iYSCSIFXaRFg+2yslmOVwcjZe1bEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPi8aGp4KzxWmgdLBzIwC3vmvcwrxSHLCJcxCHUbux/CRoOKW8AIE7SGeR36qxIlAMsq2SdevTvq4qI5OZjDyrYsPNKQ5yFT7EnSK1BKgGvQIRo7vM12i2q5Qcg9y95F3cy6Ro38Sj3LetuJP4YoOQ4lJhjtHFVRHdUfoJnkqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B9myiEYV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B9myiEYV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1213020a91.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788562626; x=1789167426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=B9myiEYVJFRW2vQsxbOzMFOiopL0j54Ex4bhdxDJwEMXoyV0Kj3H5msnKjPdw0siVp
         /+Ryvcq47jBWZDcZbnWj0AaqqhM1i6AZnMsTU7G3PHknBIaBy+O3IWDptlLDOu4ZaUJ5
         b/8iKvJeo0vhIq2wEDStnKHyukTCzbuiXryz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562626; x=1789167426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=F9WtP95MrIiRiWAfhZRbpO7pdXgErcFYJTf1taLHeDuVMkug3SnDWOdWzYAx3i1vUC
         zvU/CipjRsaiH4SWVnFFEfpojyNUiRCgX0wO8nVuwJf0Bife9FkUWokZ5U7dLTPR5vIx
         FtL1BLKKXJu8F7TOA/sMrsTuzOI2y32keFBMAMiWoTVq/h5G/gg1k2zdwIjquyyD8jLn
         vJCJfa3cwdVHXn3q4Dq9JMMVoNPgc00gYqUDSlh7E7IQ1MDc7Q4zGm6NvV3FYTwrgUJ9
         d0wW380rM88bjHklmEClioNeGezaHMS/IVeiJQTVnzo5CinqCNj7ZzNRSmRH/io8anTT
         UDbg==
X-Forwarded-Encrypted: i=1; AKwUvBzMMkE1JI6eB37Y3wC2kutpjvAt2SiNrHV60WJTxWp2g8MdFpcUJt5TgR3B2nJKUGe41czXE3b72NT9@vger.kernel.org
X-Gm-Message-State: AFuF++mOSos8ivVSTnu3ads3c3SvperKPZOIJh1kDXFWoAxH9/QA6ZX0
	tNECyVBGpH/Ju47feru4J8vQfOAbSUDlNt3Dk4oRMfHHxRNMlcH5S+oX/BZ43LWJUA==
X-Gm-Gg: AYBFou3DmJyOu1GKy1Ovh6jdqXULSuAxexfLlE2UNIhZX30mvA5FOndbGzboINrZSYt
	WlaZbVkZJbZn2xhPeYSYVIDIv4YXUl0i9xYRTVHzUf66tcrjYSXTkNAatic5OBexAIqHqqJU2Vg
	HK+VBN4IOOGDjP421AERc10YSb+M/94WXWJMgPXPeVx+NIbVBrhKWDYLN+I/NLCtoahLzIO5ALy
	PDUYDI0d9nPNFYF9NDDtndqCU7Etiiuy9panj7IHHZz4wDw1U9R2jqIZkGU3TaIAblkQyXoMT0a
	wUmws5b5KK9EVMnWxZFb9vTU5IWlcYM0yMxp1uf6lTwR3yUYLaGXciVGKtJ/5IvMyduQpIWr5vm
	0WoF4rXs+UHYH6W89bsDn+UXz57ajZK2s4fbVHbIwwSnca332o1HsoVpTxqrw6i4+JkdLjJE0MQ
	1DXTC4T5M9tk8koSZDYuWm78PIjDZ71GYKndEuj4+BSK9Hwt+vRuFsxkYrGkk5+zJlLWC2dDyMc
	twYNB5ixsSxrCPvHFn4gveykvUHlTjbk70U9Ig=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr13463573a91.16.1788562625925;
        Fri, 04 Sep 2026 15:57:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339aa37dbdsm8157345eec.11.2026.09.04.15.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:57:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Fri,  4 Sep 2026 15:56:22 -0700
Message-ID: <20260904155621.v2.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
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
index 69cab9f9c530..fa359440ed60 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -22,6 +22,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells <2>;
+		#size-cells <2>;
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

