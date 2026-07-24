Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D23E717C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882725; cv=none; b=PB+id2cuwXBXKNotqgiopwa8zBUe9wElBjysQmMC7BUh+PepElNIiXp/exQcUUEBZdXvnTSGQ+R/qOpd0oUci+8qBqrMI2t/w+0gX6WFMv6zceB9OI0YH7Vghpier0fn40gutif4uFrkIVowLxg1ReReQ32bLuTYrbCxTLQaGMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882725; c=relaxed/simple;
	bh=5nZ4oAMk+j/TL2cUgeaIHep9LZ80pEB5bycph4BWJnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVLm37TyFoidIxy4pgkLfvvCvcTciacsEbbg7kuhLlQZThqdXo4SXvVqzRvxgwfoA1yPmVj3r86GHbtrW5XO2WuHOtkcrN+CTlJxVZglKUh3Dd8EesDrMmjpDeoktN6JGN4+euX7vLK1erELutv3APKBd5QjKqvWX4v3w/ivBnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4R/TUXI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a4R/TUXI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dcbade417so170318a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882723; x=1785487523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSIe19R3Jx2/rJrVImdy8rgHYnwLDdUMVV9CAsQ6TV0=;
        b=a4R/TUXICZl5YZAdlX+M0WpFb5JBSRjpS9nz+nMNEWuPKpgpGiPW1WRDVHM2lsT3n/
         GtL6OXk/EsMk4Q21vsQaiBs+HCoKC2m59vhaCX2wnbk1KpMePAwWiaSzJJWhhU3bTS5O
         XnlN1lvux6kWt+T8uaAQGnn1S/+W+x8n0M2uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882723; x=1785487523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSIe19R3Jx2/rJrVImdy8rgHYnwLDdUMVV9CAsQ6TV0=;
        b=BtYXsX2C+b7A9NXDrttKmfnV/raXkswjdkghuO7NNLQB03oTjVuZsriR350x2gLpPP
         F5oDPPSL8pS9Z6bMnY/+ka4mbDdHTSpcLEUoi+oSOrZVLI4DRdf8PqoWj1SHMMyfabmO
         EyzVwdVDx7Fy2Qs+8sC7a/sF4usZ8hk7EVtKsaTKvAkXy5IM9VeVrlhw7RJrtGPfomE4
         h/xdgMtAWm/swxKWQ+p5nyTUdqOS5vVaWXyDbz3uMtvL4c4SQHGOL2dWBaiwN9+E/VOu
         xjyZ+UN+hF/LRcrlmq/AViQJ4lDs/dUtHipnOmqbkMrq77guZ83/u/OhMVnO+ZBpo7xo
         pFvg==
X-Forwarded-Encrypted: i=1; AHgh+RqB+Ei+xSVExEEDDnsS55fvyhIZW3tm2y195gk1km7/p0xv71o1TJaDpvNQZVaHg4QRJbiad763kwNd@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+YtPYwKDkunSxhliZ7/87xkH9DzrGAEa/3INeCjZJrI8SPGh
	ryV0N3s0dhrfR9VI6DMiKieIyXjtrDVsRwuUgJR+mPzFYLQwuN92N0oC6QC7JyDvbQ==
X-Gm-Gg: AR+sD10xxPDIdZVcyl0KasQgF24/DzGP8hZ9c12W7e6sVXMRJ2jkch6Mmt0bO49f1MC
	fxVQz2ZNRy83tjyDNxqtjZSDXc9BmeY+bZvVr6U7C2kzQrVavRdxp5gC5bd0EalARXGAjxXo3RP
	Y1Np3SvYxvnWz2wkv0JpQ0RjFfB780ijsBtIn9yo3+vPOk8xe9ZaxSN3WkXF5H0tmSHs88yamMF
	r2HMc8j+1puyhWuWuAc6kVg3hRK0FEWXkqPjmPXD7M4n2zWCXPqdPV54Gc59MsFKKIfhvmqi8nc
	quOC1jOAuzBwPPntDgBt9g9/oWDpYgNXKgY7FoAh/JDbBrrtlLfcEEeOla+rtz07nZfnHS7J6r9
	glufA9Pyn4tFU3QRSUhnT9Tjvi6Jid1O2cL6aX3RHll2Mr66SV1xNTEnDzOh1uidqh+VIsXSaad
	Ucw5DJ70dJQC6mY8JLNOD7bstWYDE+44KavGscMvkNNr15KuvFy9G7S7EPHqEo8WCcli4Gmw==
X-Received: by 2002:a17:90b:586c:b0:38e:7446:d2b8 with SMTP id 98e67ed59e1d1-38ec6890685mr7222992a91.41.1784882723047;
        Fri, 24 Jul 2026 01:45:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:21 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri, 24 Jul 2026 16:43:24 +0800
Message-ID: <20260724084328.3943997-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
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
index ef7afc436aef..8d4cc30d91e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
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
@@ -791,14 +832,14 @@ pcie@0 {
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
@@ -1085,6 +1126,13 @@ pins-bus {
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
@@ -1637,9 +1685,24 @@ &xhci2 {
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
2.55.0.229.g6434b31f56-goog

