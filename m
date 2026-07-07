Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788B3EE1C9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421077; cv=none; b=CnRYakhLf7kCnlMk5+9HPvUhiglV+ZcbZYgUNw7nO7iJQ+z4cF+SI7Bh66uaWJaWV0k+bF2oOrA50baPBcuvLHz6Y9BFcr+iTivqc3zWLf5E++eBw+DpLFOwMgT5rAwsqTBF6ZphCoUQk0dAidO/pYhGOmaup33ZzmXAOQ+AzdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421077; c=relaxed/simple;
	bh=1bS25uAo5oAFey5ptpv3WHG4e4WNdVjeKvEPkBHnQIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qtSWwCia0ZrmlJK5vvOrlMoleygGlc4Jc+CgoigBIeMFqdkSpzOMvQET6TcUacTPjiG+lWJ8IZvARhx9HtH7IEmvpRtC92kpQvKFD1H0Tz4gjFcXuENMlgVQx44FDJMyMp3JrXImQwyN60IbxoOKhkNxRPX9ylNR5RHcITh6kUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wsw0NbGn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wsw0NbGn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845ea8924fdso4467552b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783421073; x=1784025873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=;
        b=Wsw0NbGn6QNqHRjjAVKJSxkd/v2gU24L8yXW7OFLEFc5LkUfb/j3DrtEEm7M9kCSTC
         cQydzCvYbUPniCH2JyS7WF/5SHZ/2DVcZuiHorQ2ej0J2hNOGaJJ4ligRj0rRasuWsu8
         LpDcoMs7qB2F3XUr4SyCtSg9gBCNv1+1es2WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421073; x=1784025873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgrh/mASxWOx6HSigXPKqA3nGSJPR3udlEHH4VDDYpM=;
        b=oBhlbzRFzCaYeh0OWM6LT0xp0OtrABWRCeqHlZP2xZfuAMCzJZriCGoiFvCW/r4r8s
         CFwSEw8NSwGHTdwCWy8UB8S+HWPXaKeVlvPlUYAfnE8uh/iTzLmil7csaZyIklTQFjAG
         K9Tbxp9XFmJF9EyAyr24ajoZGkv3yOGepQD6a6/crPQYaBveam6q7o2D+jNw89lcvQiB
         8PCWqnqkWuRWes5/HgfbBDOhPeMO77Fgds5pLoCCWnytZPpoUd2c1Roue7AamRXnmHfx
         prb7cg5qK4hI2DUsbSjb4TARxoV76a4yJvWZa03nO3YtklYiLwEVkSYS7Hmx0Is7lZnV
         cyQA==
X-Forwarded-Encrypted: i=1; AHgh+RqZWxgrsl37wITXAZ6rLlh20kx8Nuv83O4EO5ERl9X9KLFRWC/J87Ea2PU+uxjAivEaD/UzIjgquySu@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPyVL9dEzKfyJsFNPG12VInYYTlzIuE8J5g37SWNkkuddcIr2
	E+0/2Y8bGJO4NJRhdKGk3RdLOU7434AaqBB0Ybw+7eBbfCg25zuZ4lcBN/szWQBdCw==
X-Gm-Gg: AfdE7cmHPV25YrxgoVnBtWW8tk7aBwDRMFuPOmBJgVDNgKD5xNZOkY2InYHrNlWpMwX
	6Ud5/WwXT3FNA55f3fconU7s9QCdJa0Z6HlOoxvapySfDpzSM1DKBCGyfe+WMBhZW9F8G+EIbK0
	q9DElRK36JYIjQ8yJedOvWIQWui7nykpuOlR3TKW7gjV2Wqx/9lkSdMDF8uydm6T+qQ8hi8joLc
	oXyl8agljFuXQVQr2UiPsVjBl6m1411YQX5/D19kxL5SjVe3nO0X8OvzwNsAh/7IfOTRY/rnuy6
	NK9Qw1xuqaV+tzEUcgiICJ4ZyRxeX1do3976jaEkQjWFXlfD+pWAezLlo5s8lKsuIMuhmqbvrgK
	ZrdaeLMi9r00lGY0bPPOlRr7ekZjmR3qCBmHNTUMTcESlvgfDmiidytgnl6HvGrNRyHJA+trQqG
	Hq2Wi55+nwDiLiceLUmPkXgTxQscK4dKFmqoOMk6LwiW1ol5qLa11C2ALejFvpBQZGUmUeIQ==
X-Received: by 2002:a05:6a21:3204:b0:3c0:9c18:d5a7 with SMTP id adf61e73a8af0-3c09c18d6f0mr2745290637.68.1783421072707;
        Tue, 07 Jul 2026 03:44:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:cfca:cfe0:c982:e981])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5b95sm790980a12.3.2026.07.07.03.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:44:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
Date: Tue,  7 Jul 2026 18:44:25 +0800
Message-ID: <20260707104427.3409290-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
DRAM.

Add a device node for it and hook up all the supplies.

This change requires a firmware fix for the SPMI bus to read back
correctly. The required firmware version is 15842.175.0. This is
included in ChromeOS releases R150-16700.22.0 (available in Beta
channel as of writing or stable channel in mid-July) or
R151-16721.0.0 and later.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..fea52c377d88 100644
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
 
@@ -241,6 +243,14 @@ &cpu5 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
 
+&cpu6 {
+	cpu-supply = <&mt6319_buck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6319_buck1>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
@@ -1156,6 +1166,14 @@ pins-bus {
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
@@ -1267,6 +1285,54 @@ &spi2 {
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
2.55.0.rc2.803.g1fd1e6609c-goog

