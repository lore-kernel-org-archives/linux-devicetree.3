Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70830DECB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585177; cv=none; b=dRcxB8St3mGcOtOj51BxW3SB9kXfaVcVPg51x2YBxhsPyRDJxwWxDD0Vxwz2MLkO0IO8UhFUk8js2GEHgx9N8uI5Bx04yvOk3F8CqgEdFH8LVSA6DhObkjtHpcu4G9oq3tQO9bHcjtyhMKvuQDT4JfcQCdWw14rT0c/KRyodXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585177; c=relaxed/simple;
	bh=S5UFZMLjFckuRxZtPhVtitmozymvSSYfH08eAs51SZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBGl9LMbFFx0qRG5N2UI4PaXJNhweH7aCpdkxHFd915tQA+3mRPznq5SOmidmgfMGjZo5J0o944hhu+QOlHniteZBUAlffecqPQhjGc+7w6ZFr8tK2YncCsnlBu/6rRA1nnQpYVSxJjFfO4Srob1qYvIgx3tnOEU2x8X2k+CVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dGNgtopy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGNgtopy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1487052b3a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585175; x=1784189975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTOPP+o88VWkb8bpp8Y96c4/97TqS6hM51V5JviFgiY=;
        b=dGNgtopypIm39RarrIOuCPUUTl3gZO/VftINsfMIBB91hzlAs68YF2UF4UBSjbrLjz
         QPyioj8pd6ujFaM70JRE4RIpT45aK+QO1TlTiWQGWu7xxDhI6/082kYLeMFqY1D1fRHZ
         /uBlFJxEFxbI7KWqLowLrGMi32KcvycMOdp6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585175; x=1784189975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTOPP+o88VWkb8bpp8Y96c4/97TqS6hM51V5JviFgiY=;
        b=DXVlt1gqZlhJM7wMNU7cSPvB8WPkRdaNZa41iXUKMDs7Mmia5LCNJ0EJQldilIMX4e
         M6aoOPwQqqCYixVcczfggVEMygbW+JZii/4KkdeAfZ/0sg4ImZ3zETBn0OMwzg7b+14G
         hKHPrP5UpXdGO7p8fSbWa5UvaImfl8MnlBHQClG4W62rCs2VhCwNsNy3Us3gloDckVe2
         892cHbTsvP/g+w+x+HqdfcfS9NY64lgZBta6EJ4x8RiPcJRJUyyW4svGILaXSPSe18Fc
         ut9v0CpkoWvYFO1AU7NOyjdxIkdLrKdP/pYe1H/GcHorXN3ma29Ohposwx1wnEXA/Roj
         QO7w==
X-Forwarded-Encrypted: i=1; AHgh+RpjM4o9n3yUW4jn15yuLMpyiVN/lWGI5DwtLFctRH1o8N5NkLFGZWu7go4IjYMSLok7sf/Qbx2f9Npl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3x4TMhZ3hKD3EOM12rzHpzf5HSniRz+0FGUl67LhfYQ3STDR
	z3xp+pN4ciyb9MqWuNrI+qjBPSS6sMaa4cvPEmowCezqM3fmoTs7InD4TQfM+t+Y/g==
X-Gm-Gg: AfdE7cktsQYPx3AZtPTATF+pZNhsKOPzRsBpZpWWTbYkrPJ48f9EWH9j9Imd/S/8k+u
	+7em2TNUzp0ObZ8la3U5P9gODPiAtXwPPYq/ygiL7tKNuvwL4lnNhxD6/Ku+2pxoZ+ufPQ2Iomv
	REMPnNJPwUoOZr5Mj/ffwwvFpi82kayLIHTOIBSSSI94mfni4qbN4MrnuiJnlkw+5fqIE2inxGm
	IJ61FDXoOy5o3ee5maiXmOZ6I7Lk7DH5MBcdptEFx3ApGiv6eZJEttqWCevM5w0h5zXcX+ZQHpT
	wyGCsiEhU2pekoPuk1NuEnxloOObvVNgp5G7NQFsL6moX4VqRJ5RRcwmOTXySSEseZPjcTh1ufJ
	givF8G6Fkn+9owDEMthZ7mzJvjzWr0uLxC8dfBqOoUCWZrQPNU2OwbpfsusbAiKwD5mf7fr07tj
	V9Lvdi8uY3gaA+i5Ovf0GzmX5kEDheUByE9SLQbHvH6Af5oHTUFe4ZgTeO3ZoZM9VGvU0bnQ==
X-Received: by 2002:a05:6a00:2450:b0:848:2b8f:c9d7 with SMTP id d2e1a72fcca58-84843027f6emr5831170b3a.18.1783585175251;
        Thu, 09 Jul 2026 01:19:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm8211863b3a.55.2026.07.09.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:19:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
Date: Thu,  9 Jul 2026 16:19:27 +0800
Message-ID: <20260709081928.612294-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
DRAM.

Add a device node for it and hook up all the supplies. However do not
add cpu-supply properties for the big cores. Adding them without the
firmware fix mentioned below will likely cause CPU DVFS to stop working.

This change requires a firmware fix for the SPMI bus to read back
correctly. The required firmware version is 15842.175.0. This is
included in ChromeOS releases R150-16700.22.0 (available in Beta
channel as of writing or stable channel in mid-July) or
R151-16721.0.0 and later.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped cpu-supply on CPU6 and CPU7
- Added comment about broken firmware and upgrade versions
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..dee946309121 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/spmi/spmi.h>
+
 #include "mt8188.dtsi"
 #include "mt6359.dtsi"
 
@@ -1156,6 +1158,14 @@ pins-bus {
 		};
 	};
 
+	spmi_pins: spmi-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
+				 <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
@@ -1267,6 +1277,70 @@ &spi2 {
 	status = "okay";
 };
 
+&spmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spmi_pins>;
+	#address-cells = <2>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@6 {
+		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_s5>;
+		pvdd2-supply = <&pp4200_s5>;
+		pvdd3-supply = <&pp4200_s5>;
+		pvdd4-supply = <&pp4200_s5>;
+
+		regulators {
+			/*
+			 * vbuck1 is the cpu-supply for CPU6 and CPU7.
+			 *
+			 * However, this device originally shipped with a broken
+			 * firmware that causes register reads over SPMI fail.
+			 * This is fixed in firmware version 15842.175.0, which
+			 * is included in ChromeOS releases R150-16700.22.0 or
+			 * R151-16721.0.0 and later.
+			 *
+			 * Assigning the cpu-supply properties for CPU6 and CPU7
+			 * without the fix will likely cause CPU DVFS to stop
+			 * working. Hence the assignment is left out to avoid a
+			 * regression of the function. If the user is confident
+			 * that their system has the fix, they can added the
+			 * property themselves.
+			 */
+			mt6319_buck1: vbuck1 {
+					regulator-name = "ppvar_dvdd_proc_bc";
+					regulator-min-microvolt = <520000>;
+					regulator-max-microvolt = <1155000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+
+			/* vbuck2 is ganged with vbuck1 */
+
+			mt6319_buck3: vbuck3 {
+					regulator-name = "pp1125_emi_vdd2";
+					regulator-min-microvolt = <1060000>;
+					regulator-max-microvolt = <1170000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+
+			mt6319_buck4: vbuck4 {
+					regulator-name = "pp0600_emi_vddq";
+					regulator-min-microvolt = <570000>;
+					regulator-max-microvolt = <650000>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.55.0.795.g602f6c329a-goog

