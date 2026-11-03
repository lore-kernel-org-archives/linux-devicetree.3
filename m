Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724482;
	b=ZL3+tEOz3bjUhDLTleYuDmoc+CONg/UpZvA199kz/uCueKQJ2dCZO95hXFWQpAJ0Vq92
	 NhTEVkZjy2HEG7Ckn85y76C/im/aNUuSYykWJnRJmauOXrDCgIpqOLDESlTNBG13utR+A
	 uHpIa8ltqQYKi7SJ7QAyNsNI/432r91+J4GtXReYYy0z+IsG6agtuAtjhgZWhUQW/hjae
	 As32C+5htNS9gsT+ByKkFYuF3RElkJzBgkp6ZKO/NjrIW2pYvGCgRYIBwWwFx3TNgKfz9
	 AF6XtPizrCSSlNZ4tN1WIoRkB+hkaiIX+XFY1aW4dg9Tem2hfx1aeRFdh1l10rAO9JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
	b=C5+xnKyZpss4DVIdbRVjIgQmrieinPzhxeSx4N/86JovJf8/WP3X9miLHXHVC5eb2zer
	 0q7nP1Wq8F/kCEA4rk0ZyQIFu9EOOGWQyJE7bpf+DHgsJtOyEfplKolqseHsKNne5fPHt
	 A3yy00Urdnq9bOSw8njK++nVDrv9PdbV3hBFxbVsPNV+Tl1NYLTluUzBEGV4urFyaYUMu
	 LY6brpFh0gVyqE4LLhwvfHPzq5AVaBwrAgTSdzoiaWaxAZtdkY+0EUisyrf7Fyv2KmZaD
	 fvDrcRT43i5yPEdVeQNjohO/sI93v02L6nuYf4WxhmaJAGx/4TLj6JwvCki0E8QPNrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeeHNMFq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE49606A328
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE49606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeeHNMFq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28530055e9.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724480; x=1794329280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=TeeHNMFql7z/dmsDhMNob7K6l+sxr3dGrDQYy4AMO1t13woq6zGlwN6vk1pkxkwMp7
         7a9m2XWFjxq9xYWZouL701hCI3RdmZyV8iEN7Fiplv1Mv+UDCjEAF4KTcBdnEZ743pcx
         +8o2zBx1teVEfxt4yvSC2r4WMRsYqUS8unaKkLRtdwQ9jDj+jSDxXaaDDdx8c4ywtdgj
         wDE6JNwd98H9+hAY394lPPe+XDt5sFmgalZ2u1huCJgqnGyO+sNiWOQaDtza5BpQFnnr
         ROzuKCzzGhOwxSH/OYqGHpxkLMkN/QtdQ92XCoypAcfES4v8j1Ewye51T75/GlKfgw+i
         DqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724480; x=1794329280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=vcX8UgeTCsEiPw+C0UugftW05k5lMSSviSPZV7C12Vt/croC9WeZogcpTbpOcerI+D
         jNBVkT4pIGIi415bWePDCoXPm9be0A6g5HNUbFytPk1w9ZZeu/eQgRXr78xAfvsaDscv
         NU1KhQMiNyw5J2jrPccRibV7Z9E3qxT4ptstkX2Lc3uACSypoLQbh7O1ZzwSCClYmyNj
         SbDhtwcMjtCKQMbcOnvfR8kWqfriKjSc35VfC0DLVqkdZKg94OuAaP0DElGm7oueejB2
         PozB9ninEK7LyfijxdIP0/q9H6wF2z7PFr5XwTlyyXyPq5pT9lXpyKJG5PbrZ/4cVSUH
         fvrw==
X-Forwarded-Encrypted: i=1; AKwUvBxRN6YGZ2XZRgfQuITXH/znUQXhxJQ0z56ajX1Ci44Pmi8rQ4ouSkJRMEAGmfFqdb0u7Me7q2eCvpNp@vger.kernel.org
X-Gm-Message-State: APuU4Z9LdomWWgmqTSWptToOqvoF0pfSX7P7h+xX9+akc5GqmbDxpcpQ
	Ar9kzO4fFNGsfjtVtsdIv4hDofAZhHjmKOw3bMH+Auu+QbtA2u0emArk
X-Gm-Gg: AYBFou062WDh5IRw5shzkfpZjhnEpydpdvOHVVnsWSlsBUEzIgBmKlGgkCnqUegCqvp
	S+eY4Wdu2v2bfJ5mFvjILD/B9Dl5qmVMcY81AvtmnTrXknTiLe3My82TmIxDxxZgapfKs7yVghV
	tT0XHCrmduHYNOg8M3LBb7ABt3yHYQU8IiPVFwk49AhRHMqSZrHX/GCCEvm8Zql9nuq64vyZWBu
	7AhqxXhtXzPPHYEVuY18cmJrQuhQmww/u21dv6JQcvGftNnYu3Xi7Yi0W0ZRBEIHUiKAOzAAn6p
	goEPVs3iT1hu7Uf8OrkNL+oas5MD9soCc8gAxU7r0Z0Na2695E5enH/ypuSscOuMMHKHg2Jg8cF
	JquJJKlKzaTyTVe9hikUg/nCa6xfjz6YcT0/y/5fjtijhk8DbxiHQ5r9otfQCmlesmSzpHPlNGX
	Wr5Y0kIt5fiRxcJ9Y8Hr2nFcFUSubT0kRDzmOn5Fto4BlDjgsBsGgxgSLs4pSuiiRlsrkheknxZ
	gnWTtHfecriMkyalb77iD6KFK2z3M9Nl8gDSr+AaG8Q5zntt0uKN+GAC8ehrXBp4l2gj7Zxn4Tb
	DI/yGthTNqIV/fHShB+CsS2jjDlheWQQm674mTWSFgWxMB3pFZAtEpOnSZ/aOAzGiFk=
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr276786925e9.28.1793724480320;
        Tue, 03 Nov 2026 08:48:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm79469835e9.0.2026.11.03.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:47:59 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue,  3 Nov 2026 17:47:30 +0100
Message-ID: <20261103164730.160593-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..c70780b11b9b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3

