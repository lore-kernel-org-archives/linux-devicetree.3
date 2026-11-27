Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776713;
	b=gjSwTH9QT8O9ahAmQvgw3qOnT50O0R6T1DY3oqWzE9sOvJdKv3U2hbe4XF5vdyGmL0k2
	 3p9dWZqVS480OTprSd43atsgVBl0FX/C6jX6F0NvyykyHrgh0z4IZaYdtBnSFBiDf+WfQ
	 XOjgQq4qDMib9wbyrfMV/2hpEGTZUFwPBJCI0tRmhz/P86ySXZerJL9Oi8k5S1ywE9VvJ
	 KbQjq1d/IExV7RYj2zw6q5AM097lEM+Ff/J7u1jpJ0BgrxEoPJYgwkT8GqyhrPhFlj0lC
	 gnZmeACaWI+fB9DKwaRQYJrFwezkH3lo4dbTY3+kEl39dg1wNlYC9eOnI0ZMcDGpImA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776713;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HxtcBWZWgvzHdXMP1bP5jHFPX3eEJlRCwg5hvnUv5Yg=;
	b=UANWTcPKVtIumxI6Do3VG/aQLKjkl0JapJLL/mbPxUp8j3kS9Ne65hOMPXGKZ3Mq/g5o
	 X3ZacP7eXNI/ng63cf8tG/uYYlqNyzCNLQ8LzLKo+f1aZH5JVBROYTFJaKXoG7vrFezEG
	 K+54tOF74S+PUlbFKtXln+eYFXf0IrXeFnqEVZ0bzDbE+ZBzrbOpIgE9TCjkiS2uXl7Qa
	 URWBs2kz2lNyktS/AyhWDPH6nZhH2vDSt6ogZH9x/9cNuUUvIZUTt1dtrtwqZQ0/G1h/e
	 eEgcWPMWucdkdZ2+PUd8EOWEPQEJaShL2fbKS4Sl2RygoIxp6FImtLE6MPwAXfYBAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ek6yrIXA;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D3C606A6B6;
	Fri, 27 Nov 2026 10:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D3C606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ek6yrIXA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=bLT7/p31yej9A0BHu5GC1yHX78QpVwmRd/Nbhy5mNqM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ek6yrIXA0e4f6+bExFdDCycDhUaQfsFcpY0hcd/dRMuVDEfhD9hYdYs6pdZLeCzGY
	 rd+HL694qVdPJEw3R7pCKL2ckbdRr3zyIDDPDuuOsNE/Lp4rak4N7EALAnyrno3Hni
	 +04nEjEH2K7H8+PHzoP7VIr0Ieg8/2Wes6tT9v6I5G6wmxBXXCQDzTDKeOlpHeB+RI
	 XnLFjXPr8RJGwlYIyvhr/vwddxvu68pPou2+lvUP8SacrItNdBViKwwwc1IrKEyMgI
	 qqHcnoY8Cl9U+qEjKJg2IMN2HbXbzCarW2NU0qEDkNE9E1rGt5LrnEMS/2CFRqfaqI
	 vSCTKflRrQM+Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B47EC17E0CA0;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1821D48004C; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:48 +0100
Subject: [PATCH v2 11/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 Jaguar
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-11-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6620;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bLT7/p31yej9A0BHu5GC1yHX78QpVwmRd/Nbhy5mNqM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMMJkVvjMfEuH8ZfMm8jbU72lJctpKqU2
 EFWGamhQMIMPokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qamaEP/0K6F8xXgDDvsTHjpdykIu7pn0+oOaJFYIl8v8aYy5jUines4Mfj9jaGJ8N5qBaZ5ch
 650RaBDuBVMFC9FTHMaq6piGBQu7jkglI0OHUTMYg5SMvreMgL0p3T+jMo1bWehWV0br/YFaoHh
 HUsAJmrCOaM0GdzS2YWMUdguKIWOkK65Mx+KL41mH7Bl6JjUuvFQPvUvIcicj710EY+w51g9kg/
 s/7SI2SqpwqW5NoUB6szM+9iIffdVNd9lq5v0aaO1vsTG//eYEuRRGiJ73Omq6hrxLWL3DxFeHp
 L0Oodbzo/ES1tCi+oJiYJbkqYrugzH31rV8YFVt+pHxJg+LouTZKm/hyhTc1jiYWWExR8QxAwP2
 HqYp50CD/8nKfcRp2TyUStIckMniS2vDppAJw7Mrw8+iPiivuPyVKNB9/mg/65R802vWfIUa7tR
 b2xmdDMptVPXJryTtv6EIIoQMSKRfXIVCeBB+km3WMyi1YKwV6zQzJpNamZQbxUzwonlpHFmu4f
 5jaUu2Iw/89Fg/vGn8xYMrsXjCHOLw4vJiiXPKJ2ksY7wtNnF2W+paaugRVaaUpj726+QOKAoOf
 0cpU1vAS8oCX7DFYo/5J+qhsgGQqhW60Kmx+SG5OITuPq79TnNbMa5UZUrN9Tw+6oG61lHzsIOO
 jU9Q5EDW6MRkxMbeKQTsx2w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Properly describe the USB-C setup incl. DP AltMode support, which also
fixes the USBDP PHY ports description for the RK3588 Jaguar, so that it
follows the documented ABI.

This also adds the missing mode-switch property to the usbdp PHYs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 182 ++++++++++++++++++++++---
 1 file changed, 160 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 0446834e84d5..f79b2281ff4c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -247,6 +247,38 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
+&dp1 {
+	status = "okay";
+};
+
+&dp1_in {
+	dp1_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp1>;
+	};
+};
+
+&dp1_out {
+	dp1_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy1_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
@@ -367,6 +399,13 @@ connector {
 				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
 			vbus-supply = <&vcc_5v0_usb_c1>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -375,7 +414,7 @@ port@0 {
 					reg = <0>;
 
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
@@ -383,7 +422,7 @@ port@1 {
 					reg = <1>;
 
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
@@ -391,7 +430,7 @@ port@2 {
 					reg = <2>;
 
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -480,6 +519,13 @@ connector {
 				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
 			vbus-supply = <&vcc_5v0_usb_c2>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -488,7 +534,7 @@ port@0 {
 					reg = <0>;
 
 					usbc1_hs: endpoint {
-						remote-endpoint = <&usb_host1_xhci_drd_sw>;
+						remote-endpoint = <&usb_host1_xhci_hs>;
 					};
 				};
 
@@ -496,7 +542,7 @@ port@1 {
 					reg = <1>;
 
 					usbc1_ss: endpoint {
-						remote-endpoint = <&usbdp_phy1_typec_ss>;
+						remote-endpoint = <&usbdp_phy1_ss_out>;
 					};
 				};
 
@@ -504,7 +550,7 @@ port@2 {
 					reg = <2>;
 
 					usbc1_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy1_typec_sbu>;
+						remote-endpoint = <&usbdp_phy1_dp_out>;
 					};
 				};
 			};
@@ -1102,6 +1148,7 @@ &uart7 {
 
 /* Type-C on P11 */
 &usbdp_phy0 {
+	mode-switch;
 	orientation-switch;
 	pinctrl-names = "default";
 	pinctrl-0 = <&typec0_sbu_dc_pins>;
@@ -1109,24 +1156,47 @@ &usbdp_phy0 {
 	sbu2-dc-gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>; /* Q7_USB_C0_SBU2_DC */
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_typec_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_typec_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy0_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
 		};
 	};
 };
 
 /* Type-C on P12 */
 &usbdp_phy1 {
+	mode-switch;
 	orientation-switch;
 	pinctrl-names = "default";
 	pinctrl-0 = <&typec1_sbu_dc_pins>;
@@ -1134,18 +1204,40 @@ &usbdp_phy1 {
 	sbu2-dc-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>; /* Q7_USB_C1_SBU2_DC */
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy1_typec_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc1_ss>;
+
+			usbdp_phy1_ss_out: endpoint {
+				remote-endpoint = <&usbc1_ss>;
+			};
 		};
 
-		usbdp_phy1_typec_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc1_sbu>;
+
+			usbdp_phy1_ss_in: endpoint {
+				remote-endpoint = <&usb_host1_xhci_ss>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy1_dp_in: endpoint {
+				remote-endpoint = <&dp1_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy1_dp_out: endpoint {
+				remote-endpoint = <&usbc1_sbu>;
+			};
 		};
 	};
 };
@@ -1165,9 +1257,25 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host0_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc0_hs>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
 		};
 	};
 };
@@ -1177,9 +1285,25 @@ &usb_host1_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host1_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc1_hs>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host1_xhci_hs: endpoint {
+				remote-endpoint = <&usbc1_hs>;
+			};
+		};
+
+
+		port@1 {
+			reg = <1>;
+
+			usb_host1_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy1_ss_in>;
+			};
 		};
 	};
 };
@@ -1208,3 +1332,17 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
+
+&vp2 {
+	vp2_out_dp1: endpoint@b {
+		reg = <ROCKCHIP_VOP2_EP_DP1>;
+		remote-endpoint = <&dp1_in_vp2>;
+	};
+};

-- 
2.53.0

