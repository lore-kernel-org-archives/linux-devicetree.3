Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28B46C84A
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545599; cv=none; b=n0t84l+Uta4UvWSjrdMgjlVqw8q5FXLpk3q3Q1+IZabCwBfSsNARf2C8j2hpj1ngLaaLmnEPd3KBUsh90efNBtwYbn3Pd6qbcM2sDJWm6oV8g5MG0xEaCUTzYJhM5cjEjI5HfSqTfwrJRItsuqNFpUmho0CJI/n5JsABcxe8/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545599; c=relaxed/simple;
	bh=gM8tPRMx33Qx0BJjFPOzM7No2FKd/oVjiOutbBIFOqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHR6zPSE8bMUwRsp/tLSGejCObd36A64U7DEh2OtuO0C/MXBMTn00EIqsNvAXq1W3MjY5Bw+PusKLxKZhgitbYDCvxydbMsi1/yWUr4qdLEQb3Jsst5/yzRih9OiCtCO6bb0nrOh3bqUmklFGz3q5fssbe8kmdUOz65UXRU4/z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jdg7GW8C; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jdg7GW8C"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2012819a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545576; x=1790150376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=jdg7GW8C1HHcNqR7aJd+x91iUTOLTL7Happ2lazp2b7ruVjlH7ScUU0ArKUwp0LXFU
         wRgvKrHC8NVrxJzF1Ag6XfzZN6HnbPO9Wsozn7hnxgChR/hXqispWTs3/0HIo2hCKDeo
         DJtRtuSixpbhyxM+rEX1IOndzpapMamJGrttA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545576; x=1790150376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=HUtDguD+VNDy2fCMNWWY3ukE0Ubgsi5+kQkoxf1F+9b3uw09u0KX33G/3x/x0Ez+YV
         UPZ9YqzPtoO47+QHnN7axWLWP6yBNwk5wFhjlv9mqWvE4UBRjPEfF3nbk7EHa/W1sQi+
         zUAH7dir/RxpTqFIz2N3b5IRvEFSMV0U1RAkdlx/q8eJb3YEzLLQI4RXdQPrTvPOdGdh
         wRoQiw5mDRqvmYKpl+SPYcnd0CNB4OFhNkdw1Qollt7/i3maMtFV4+kHj1zWRxbQUNnX
         inwQfWlIUozag1l8dvWspam5RjV4hh0e8lcgO6OGgPI95wHXHRNHDd6Htx6cuC+i0tLN
         elVw==
X-Forwarded-Encrypted: i=1; AKwUvBybPJy17HFXFcraTb0Fhun9elV/VLBdZVGQZ3B9n/it56eM5i7roDDRCtR9c5LzHbshIAceHY39PO0c@vger.kernel.org
X-Gm-Message-State: AFuF++n9AzoKvkllMIA9C1Fr5jw9idmwfJ8Bn1OsWmx7I3IL9WsS9uSQ
	ykoUPvJHj5RFiglacxZFB3haLfhkvSUaIZAqX1QTBbxD+dR4Hur3e5jFXRbxUKUSXA==
X-Gm-Gg: AYBFou3A3L0tDNcSiIRgtfvVh3o+Uq38+p50xr7mdZsSg0dkBERaLXj4WzHTMYeF+DN
	vX4A+wWpmcIW0+jY0Ow+RZL0H3hOM+cI1tZ2npPJ+dqiUKxFr4caRBl21qGCYtBLM10O7t3jKsf
	doNCYJY/jF74kaWF+Wmzr1NR+nnxxWHmHB37ykLIgQo3q+va89SgSJHtTF9Baofzh/ASbXZDjm5
	19hgcxp5LvIG56szPIcR/cAC6XHcoCZxhP0GvfyXxGYzwwjpIdzGRIugYR62inNaA61gmA62tI4
	ZQJ3KTChd/QoU4cZe1ZOaVBwOl39aThtSa3QPfu00xKOHCHJ43RyUVAC/ntLoxQgOjzJrKBzvkE
	9Sner1LbgM4I0IOtUV3UN6QcS+07IxtjsUR5Mc9iajxTqRkro1Ofz5+g4fCjfcLt79uVCkuYBHs
	mo6Bvz8ON1KgMyMicItoQiNVM4/dZ+f6S6mHaLEQDa+mY6QtkZppOWZ29C5uvsyptz/MHNhlBOm
	jBBFoV1cv9eMJFuHf2a0iR7WbYygbCEI9/8X6KkNc2T8V0tWfXv+evJGIAWtmfRakgg
X-Received: by 2002:a17:90b:3c08:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e0fe9c653mr6440889a91.10.1789545575967;
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 14/15] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 16 Sep 2026 15:57:40 +0800
Message-ID: <20260916075745.3549953-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f06ca2bc165d..5d65f4554c6e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -271,6 +271,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -796,14 +837,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1090,6 +1131,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1642,9 +1690,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.1032.g73a4cd73de-goog

