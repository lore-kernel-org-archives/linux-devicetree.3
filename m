Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655740;
	b=lCBfZgz/q/70DhYHvjSH10ICJcN2HFx4raW4COcrqYvJuTgyW+E3EutrpBA2ddsg3cv7
	 69CWEZHE/UmFI7dCf5Q3rcyGnHxUyQmpeT+zCWubwvrWNLMvsshPAKlXtqj++JyvObs9D
	 nQvXJm5EJEmFjX20R7kld0BwGe8p3U7Uh5svDm/1g0cA+5IR9Nkbskejc/9kwXztUcSxL
	 LzzHolj6vNh3NpS3ljZvHA+JHVBqbN5Dzxrr5j6PtL5jy7rEzrdWLUyPe4eM5Sp1GxQui
	 YiY/XR0Ik8FFok83QSOMDJViYIx0x32mGOw0XePRGIkPlAmic5V0/o6BPdvGXFyigag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655740;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4TokXJF51r0m7b3JphOEG2nSxULNTcYs7ptSnoFwDpw=;
	b=RPg+s//HwrCGFqsqYqd1WSQclWU7IU/EKkkAZLZPbE6QgIpDFD/Ofege44vf6wZ4NhJg
	 y1nIQWBPtSUSA9ZjE9DaJHjr74D27pmzvw73YJy/9KVhV6Pe4Tv/uZS92btKHhQ9fpvty
	 pU1aYu9552BOKGApcBh3EgFYseW3quZXmSKS3K34MGmLPmV0WgTl8pGil46Q3bkbWqMZs
	 ZbKQWY3pXsIfn4su6izQ2Pyden1zIBjgWvSbq0yWCg6HtOn1trZT5OxtCOTbI23w1xr9C
	 MVtGNjzUCZV6DXAsLyHDSe7Y+ksuOCwlDymZ+uEtuONi7WxJFEGxt/p0mo3HBq+3PfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jAL3sRAb;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494A60A2609;
	Thu, 26 Nov 2026 01:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3494A60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jAL3sRAb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=WrRpl2FXyGdQCMEaQZpvoyTD6x0Lxdy/M9U/sdGkjgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jAL3sRAbrhglV44KL5PoXY8OjYQNMdb6ji1juPec1508XlaPW8tPcUGceRy1uQGpu
	 EucwpHiWXetAWT3DmlkiXzE+ge9IL+aZaJP74VmyGRU7HsYYj1vl5G6qVTZrB7p6hQ
	 +VGA1N0zqKFpfoKwUQqUHRkzvOd33TDEhbJkOgYDehqSt2+4xwgS5Ajd+A6DtPOc6+
	 ZM9h8n5etncSFupHjQDTNw7ki6lrjheeTVZa0Wb9qSRFAHvcnQMKLWulouLIGi7mx9
	 g72coR4enM2EYqTs1zxeUlo1/Krd0TsAoj5gc2lWNHXXdMEX6ZCZyLbfJSRuxVtU5m
	 a4pqbslQ7ZvKA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 782EF17E1515;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CE5AB480048; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:38 +0100
Subject: [PATCH 10/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 Firefly ITX 3588J
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-10-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3883;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=WrRpl2FXyGdQCMEaQZpvoyTD6x0Lxdy/M9U/sdGkjgU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDW0TjutLoUBXHQkdJI5u8GmDEKKcuT8K
 WzEXaJwIajdZokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qabCIQAIFMHHKsTeyEiX2cr/aQMcQ0LofxYsWKzcpPAlHinAWE7quCOR2En+3fel5RMtIpk/d
 GH9ukWfcEVDdgO9Q5u0hVlqeD7K9X55eSvAm2i/UggEWd2Si0iVBWV2Pd4PNloko3klyiW/zHcb
 gV8rjbluc9P9YFxJmIn85Kk13gcgMkn2Dljwd3TsqAWxwqG8P4SoLc8ZHZksmgy4uAC55CDUWMr
 Y+m6GkmmA3OIbbZGCpXt8yZKDN+eY6avcjrtMD4dh/WYg3z5bq14X7npaDAIBtMIW/uRodvrQLO
 o3pEerDdubdy36h7Q/Be8AFGhWoPcBU8VND51rmdDN4M+ghtTiYx6T3j3NWSSW2PcSm7fCVkPc6
 KQaMPjju74LzeKnXcFUTnN4ocK1VOGZYtQb0SkbdHD5GV1+YPdaSZFDFdEu569c8poVgtkuER78
 9d428YhAAnQjsf4VQ27HMjWMgPSW6aC0itG3lenzEuiFlYhQ++HvGTx+/p6L6JfkN2ODxCnI8Xq
 Fm042EQ2hR54vDfzF2rM6tnqYogLSa1alMN/r43YEKHUgPGdrPknY7e61Iz3c4dDcZzKlnV37Ij
 Z9xGtVBRUgC5IcrZcW7prw4OzOSoe4jHtgBTO/5njqdtQlitowAcd88Zib+iyuGSyJLeOtOW4vX
 yQElvR7gADhVMcqOavpQsWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Properly describe the USB-C setup incl. DP AltMode support, which also
fixes the USBDP PHY ports description for the Firefly ITX 3588J, so that
it follows the documented ABI.

This also adds the missing mode-switch property to the usbdp PHY.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts | 93 ++++++++++++++++++----
 1 file changed, 79 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
index 8dac069f8351..57d8f193f186 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
@@ -285,6 +285,22 @@ &combphy2_psu {
 	status = "okay";
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
 	phy-handle = <&rgmii_phy0>;
@@ -397,6 +413,13 @@ usb_con: connector {
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
@@ -404,24 +427,24 @@ ports {
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
@@ -635,13 +658,25 @@ &usb_host0_xhci {
 	dr_mode = "otg";
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
@@ -656,23 +691,46 @@ &usb_host2_xhci {
 };
 
 &usbdp_phy0 {
+	mode-switch;
 	orientation-switch;
 	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
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
@@ -712,3 +770,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};

-- 
2.53.0

