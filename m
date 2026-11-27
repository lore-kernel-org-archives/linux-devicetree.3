Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776711;
	b=YuQZNpmSVdzZBvlEec947wXySyUhFcs9LqSMOQWrzENdYM0xLCitBxmJhzeCaiVyVrF0
	 DrairfKMR77W465KV8awHAQ502lqguT1hLj+lNtxcp6lXgN7AH9Fn7cqO9CenfChZDxKu
	 WD9AL7PkfdtA8HvyCN5XssyGEzeOSmw2t7klzixQ0sqOsyZkgMrd9+NX+e649YUy+K11n
	 lX9GS5rqLBY4gy2hSPFJyK7ubrZSa4I5aHaWsaV/IrfyxVotD0OAo7GdXmACUqbULV4Sv
	 0GDgnS6W+uqUJqJ5FrhkmCaTEElqL/W1T3NsWC2P/8/wful7Lj4XVzpxFa4MDvwMCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776711;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AftxNf3tYTBwIKs+kkGfCDejnDzmlWG/RiMVlQShfiE=;
	b=xbYvMwCVajwo/b8Dg4GPDCpe+woDiADS4806Th2uak1Ynsw2xMZkooVJW4bXX0dByOwk
	 4DzraItuV936zA7uheXN7Mcb5t5vsAQb6TPl5NAxb4wvIkzq7PK6XqwPdxxZZX5JYZc3o
	 AZPPnhwbTIM0f+ob0c9xL8NtSX7xrqfDbDgRIU2mS3wYIJRfe5jOPPZFFq4fIWemWE5z7
	 NoXPpCtFyLCTLsMvhOfcIrKWFujK/ucScFFiEJRMHlxBrVPGD7AUCQv6UhSI1x2IAoz5K
	 dNtCSRaZtFisM9V8pO3eltnAYwDNQnnUXOfnXmxFyqYB30XHq2QYrbbK6O6NKA7IWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a2GVDIqu;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F244606A31E;
	Fri, 27 Nov 2026 10:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F244606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a2GVDIqu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=Gv+cLHwgunqeMtyO4yiB1Qcbps2qbpKw8xllMJNDfgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2GVDIquWI7UHJLazdtwmlN0Mre37c/BEaZUuuh6ttm6Qwb0e4sh6hFVfzLzvA4hl
	 ay/1KAHcYUibsQNZIk1F4EWtXPyaEIc11f+8CCbL5YXnusU6MgPK2+FZQmd6WC81nP
	 +u3pHsAoBkwlYFejUaPG3R7uCZ1JkbvLoOb/7xiA5lTGnL5V5ZxWxoo2eHYktSvq+4
	 LJ0tEs0v55sUzDgxVwazve7Vqb6FVjAhhwOue2wRD0e7XCnR00QB3Y0b90M7BHVDom
	 rtrg7guKe0SBHopBZaSP8fps7IDZkSqpJGSOry3i6u0B8gqYXXyE201ZTHYAHsQ+Sj
	 mgXS3vjHRQC8Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49D5B17E07FF;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0BC80480035; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:41 +0100
Subject: [PATCH v2 04/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 EVB1
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
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-4-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4022;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Gv+cLHwgunqeMtyO4yiB1Qcbps2qbpKw8xllMJNDfgk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMOqz88dDNIZZYpOiGFjs4/QzCbiiueQI
 4b5XFLkUkVF4YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qagB8QAIJTe8jG2e5l34BGUCYSSDUhRvSRntaERhs8UVZEanshJFxO7cQdVVeuK9At6IdiSNZ
 mWviiiRLj81zw4fTKAtEdVxrkB/WFwEEvzmQgjr81AfVd1zcnXC5NYgQxi01ETXk66l8+Ed1atY
 QSiNHNLNymGjqNrV54yGpLa5dxf82G4Gq25EoPw1P4N4IHrsUEhWm3QzX5Q+/rIjfrMijdKNiS0
 NqUHFQEDvUaWidWZAC2rw2/XWlpj+vL47ACJZBKfLqOujgvXZGtMEaI9/illV06yO4ENrSg6n7z
 ORwPHPQBiSnSCLhLhTvfPrF2yUb/oFUOx1oh3rk8E9XS2Hip2QGzYSwuk+3qk5FBMLJGCO26dtn
 +YWL71eyvp8w/QI/cY58OJ4bYulOKwsk+YFs8ksaLnEMzDqZowrWluV2QcANnK5LTJXsGcs6QwN
 08R4SoMWRukFP48oaVY61YZDaa79+utXPfr8z4xXOA3iKp23uxiDxjGXvXepYUTjH7VS5D/ouA7
 CTiBF4n5LHfESywgWJKZUSyhlCMkdXscGwrvoD09KbinwtKIv4Gvc/RbscvIbqXbwePYVf+Qv4l
 tm8Y74gyR4KvUIo7S8GKwjlWYG8Nu1W724ngaCe/DM/4LNZwsh87iBNsQnRHQNGIpdBYvVErU0e
 qdFZdqApjcHUAwmH7pBUrFw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Fix the USB-C connector description, so that it follows the binding:

port@0 is the high-speed lanes
port@1 is the super-speed lanes
port@2 is the SBU lanes

This also updates the port naming, so that it describes the hardware
instead of how the drivers are using the information. These are
effectively the same, but the DT should describe hardware and not
software.

Last but not least it now correctly describes the DP side of things,
so that DP AltMode starts working once the kernel has support for it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 92 ++++++++++++++++++++----
 1 file changed, 78 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index f578e7dd5aa1..2c560d376f46 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -384,6 +384,22 @@ dsi0_out_panel: endpoint {
 	};
 };
 
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
@@ -497,6 +513,13 @@ usb_con: connector {
 				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			try-power-role = "source";
 
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
@@ -504,24 +527,24 @@ ports {
 				port@0 {
 					reg = <0>;
 
-					usbc0_orien_sw: endpoint {
-						remote-endpoint = <&usbdp_phy0_orientation_switch>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 
-					usbc0_role_sw: endpoint {
-						remote-endpoint = <&dwc3_0_role_switch>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					dp_altmode_mux: endpoint {
-						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -1582,18 +1605,40 @@ &usbdp_phy0 {
 	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_orientation_switch: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_orien_sw>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_dp_altmode_mux: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&dp_altmode_mux>;
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
@@ -1614,13 +1659,25 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		dwc3_0_role_switch: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_role_sw>;
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
@@ -1652,6 +1709,13 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 	};
 };
 
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
+
 &vp3 {
 	#address-cells = <1>;
 	#size-cells = <0>;

-- 
2.53.0

