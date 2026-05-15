Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41644104A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835771; cv=none; b=F4Fawb0/dpfIkdeoNyS9Cw80Ef764bGDf5QdLnXm74mHIZRvoUCfy2YSHplfHIkboyFuQnu8XPDakcoiLoeG/XbQeIdvCeOwaEl6np+0DI/QLW0pJeHNXDxnLtkBxzBEdlfyF9DEqu7g3xMjYXyJob7I4H296gr4O0PYUXsfv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835771; c=relaxed/simple;
	bh=hzmFuLfaZehJONSUg8nNmwN5xN2aJspRaBE7HbdGagQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g79ayqzbAShM+B6BIQZJpCkGTB8nP+I6sOonwJAhT2zizDzevl5FP5YHXhzGFRJ+d2V8Us6H7SgRXMW02uJBnYAG9su3cuFNyjv6WINdt7AZDXMScOtHf9C4uaeFaPcUORgbcn03eCniaYCu4Ft5LW2H9Ao8s/mw+nir0c88Xc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fpbM0JDu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fpbM0JDu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so4729746a91.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835769; x=1779440569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=;
        b=fpbM0JDuoHI1reJ6klWr2SLVRJe4FIi6JZOHStuaNlznIkJwajRajT0ocY1Q6F48V6
         CnuDOr5LT0NMQqVBkqUastLg5gXGbnML6k2FXxP/PGgCqTgWme+2zQe3k5P8v+YJXHIq
         k6up0xH7SzdepLAfaWrDzOlrTgJeNl4zSvqe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835769; x=1779440569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=;
        b=RlfyV0hbTeIEzSy51OzrgomNp0iPKyJjomCosY1YwiLLkRDXiF4TZFEjIhEcyVH/c/
         rGfEY9Y64f0JgHNKunUYEH7j6oLfkvvwh44nCDfGTAGbRwXDcHejL5Vf/4X/6djTfF+S
         oFVwEemUX8anVEhm+0vXj966z0+O7UkjeZt6U65QOulhNPzNC9TAq3ecKND0NF9bJVc7
         xr3hfd4vUxVbraV38e5wpNyytSvB8x5U3PT0sdUuBtdsBoLNwe+YszuvHfQzUVwHG1ve
         fZK6wSm8xGeyDNP7AYhncOQ9Ob/UdEhYvVEx0isCKhhKYpajEVTdAc6g4ZBzzuMccQQI
         NvZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+inDdPpuJcYGQLEcvvYwceZ0H3HSiiTzyXCATFTZxU1gwFn9Xhlrrjy0cI3MCT+Fcx2KgieHDEwBWq@vger.kernel.org
X-Gm-Message-State: AOJu0YwS16lLiFzOYUcEWF0kyzPv8piFrnx8q2ENHj/20FqGhKdtkFQ6
	YX65ocIrKmseVuPzYwGCeRKUrniDVTPxEGpGcKRHzgqUGMtJdK0KL89I+HOiUiDtsg==
X-Gm-Gg: Acq92OGYCL6bWchVg3imHdcK5qT/fH+mpHQ2Z9S59DniKUfxW/DKr61Zl4jMqxsFWOu
	uzVvXi2pvMNrfbRYRgol+JsPbAk4AUVRGMcyS9eQlnwMqLsnlGGZtlmE/txNGnhgOznqjLT/L5I
	qnkL6zFSOGH4PbKnH/5HYSQrPEAB9uaQILhbRqPhJNd7HLeptV/BBYQG49XEY9UdeqNqCZCngh2
	kxx5RL0kPeiXzfWUSA75OYGVSOcfsEo2sShg6IwZ/MO+vOpC3P85NhexSRe3TXIR4VYQcb1MhHc
	Vlq3zNLOamrJ763EwqmgqfFBVylK+YKiTwkq2/7xkTfWBWNX0HZyDGufbIK9tI6WQCQZemoPS+T
	sc75nZCxmJ+1m2t0EzUqN8fNyTRm+fb/98JQuGadjyTMzVO7ItnH9AuPL1jcHrHA0c+03lhvUUv
	rFuS8b0oDG7SDN6HWTtF2SN0yWuul5gKrQH6Q7BR9777H4DodmBNQm8Iep5H9iTBJ00CQrBFykg
	AJZ+Wxo
X-Received: by 2002:a17:90b:1344:b0:366:4782:138c with SMTP id 98e67ed59e1d1-36951b971ccmr3221579a91.17.1778835768758;
        Fri, 15 May 2026 02:02:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 12/12] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Fri, 15 May 2026 17:01:48 +0800
Message-ID: <20260515090149.3169406-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
design. The connections to the rest of the board are almost the same as
if it were a separate M.2 card. The only addition is the PMU_EN pin on
the chip; on M.2 cards this would be tied to the primary power source.

Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
USB and auxiliary signals. The PMU_EN pin, which enables the internal
power controls and regulators, is modeled as a regulator fed by the
pp3300_wlan regulator. Since power sequencing is now correctly modeled
using the M.2 E-key slot, drop the "regulator-always-on" property one
pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
power is controlled by PCIe".

Also drop the voltage range on the pp3300_wlan regulator. This
"regulator" is just a load switch and does not provide any regulation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 93 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 4cb23595d17b..d7b5eb95ba0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -86,13 +86,11 @@ pp3300_z1: regulator-pp3300-z1 {
 	pp3300_wlan: regulator-pp3300-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_wlan";
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wlan_en>;
 		pinctrl-names = "default";
+		/* load switch */
 		vin-supply = <&pp3300_z1>;
 	};
 
@@ -159,6 +157,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
 		vin-supply = <&pp5000_z1>;
 	};
 
+	/* PMU_EN pin controls internal regulators and power sequence */
+	wlan_pmu: regulator-wlan-pmu {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-pmu";
+		enable-active-high;
+		gpio = <&pio 145 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wlan_pmu_en>;
+		pinctrl-names = "default";
+		vin-supply = <&pp3300_wlan>;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -193,6 +202,39 @@ adsp_dma_mem: memory@61000000 {
 			no-map;
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie1v8-supply = <&mt6359_vcn18_ldo_reg>;
+		vpcie3v3-supply = <&wlan_pmu>;
+		w-disable1-gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &adsp {
@@ -656,6 +698,22 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
@@ -999,6 +1057,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+			output-high;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1163,6 +1229,13 @@ pins-bus {
 		};
 	};
 
+	wlan_pmu_en: wlan-pmu-en-pins {
+		pins-wlan-pmu-en {
+			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>;
+			output-low;
+		};
+	};
+
 	wlan_en: wlan-en-pins {
 		pins-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
@@ -1342,10 +1415,22 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci2 {
-	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
 	usb2-lpm-disable;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb2_ep: endpoint {
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog

