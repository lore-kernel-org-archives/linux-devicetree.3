Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655739;
	b=SHpWQBiv6z72TFMWVVcSe7cG0vpJkQrR8l96gRedLOsDoR3XkJRcqweMryWcg4waL7W9
	 uXTuxhnoJ83RQYUzX+rtFaxfbnvsK/jhl1XnR9HWdy72Y/6ZcOptgB1oaE/D/XbGm2lxX
	 iqNqOUpjvPUQwVkygvjzA0Th4F6uL6S3Y3J5cdM7+Ay17DWsb89Jm4Vkd8smaKbzTTQfu
	 gOB1cAvPeAjvHCP6yCXJ+6Geox8miS1s08SoUT3ADPGk0hLKWfoPEh+IggqPzjay4BZVJ
	 GeSD66bmD1enGuW25Sy50Roa3ysusrlNpXKth0x0pTsutMi/qsIaBxmJwqVwoHihQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655739;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GtQ4UBpMkBpOgtE+AL8S5LyVQsUQzIsf6QgCsx3ULRY=;
	b=3T/I55Z3VdrFOECh2WKH350sY/NmTtzKcXwWAsX08mdqMaQ4Owyqr5LWnDkym2XR2rNf
	 0gBZ9m5WJdjbbkJSvulC/WD4w6ZPjADeM3LfiBufvr6bMVfml1SwoJ4XZc7TTtCrd9Vfj
	 4N5tqatHIblOZfT5BbLxCiLgaCrfBqB3BpmdJQAxtJ4xEAAFGf2t5VuZdQ33Pb95GVHeD
	 Ln47wZYtDC7nz/z1Gzsm/tOJ2tNv8O1SqHXX9bIt/qcoR+CoIBnO1mDCTM2W+BdKRxQmo
	 qHklT3Q1wHivRCnH9XJnz2jCCt6gGsOcSpFCCcUkxhLQ0kDmtGe4AcN9IG1hmq7069A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=diVSXvT8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7162606A690;
	Thu, 26 Nov 2026 01:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7162606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=diVSXvT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=5grVQOV18rMjWjaQKETYB4amImegESgijOC1OKMenMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=diVSXvT8w76akXka81DhEMg8cidnEfRGaE7gwgWg9Ris9Pu+GwnDl5ndzkrQ56aPd
	 Kus/+2cGK9H2thGRZqjfa4shfxemgvq+B7fYlt5F5HayFt9S2pIxENEb/pnM0/tdY7
	 OXvNZ2FSJfDtnJbUxj85xyGqOaKZjGYfD5DwphB0lS5n3KCtX2uyq6fkkRd7V767l+
	 iey57/QH4YpOSygNr9JUo4fBbTcgGrap/maV+prXgMWjOmKPCbcVjn5fzMdQ3B2YT1
	 42x+eqTqikjoyhGrgXpzc5NjqOaAaJSYq974DxCaSB/2A64Uayx8evd1L7Fal9NLLW
	 xF8fDvjdmhZvA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B2B517E1297;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C909A48003F; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:35 +0100
Subject: [PATCH 07/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 Gameforce Ace
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-7-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5grVQOV18rMjWjaQKETYB4amImegESgijOC1OKMenMI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDX0qRV4Kr42d52lIszdruYG7KknO8LZc
 lyEG7DZEYL1QokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qailQP/2Ez6EiqTv++ojoZqHx85BKJFLpD82S9D8HxpQOmyXa7HS5TFD8BQ6ZSOf83jzjr6BQ
 Zn89c0qwF1IDgaw54OlpCLs8xr7MTN5f3TgG8P7Q+SwCTA+MocHnw9eSy3Fjxk2vLcUd32WwRah
 ypm5GUlEcS6py2M/xiDuznuYk+LgeHvehDwwbGWEkkb19BqR835EsFuWYFnRrhbCNK1XDTpOr7e
 raZQmWdfTW2Ya0aUDvylBfVTPm0402XuO/IBdqzilcEEKr3hBD/cU9JKuUpOHvxQ2C2HDtQW+KG
 M8uqEeJ4ksD/RehLtC0vFrlCbAxwzv0v/wHlelzT3/eSveXTPGtRB+2wtrbBT0Kv/hsKhu6NYbE
 gA1Y2mzy2w7Uiwj2JQfKgzCoRRVxBADr9pDa4OazvPavTg7jS4wPgFDxOty93iaTUEOBcuPxVyc
 wCNjtvNpVgBXX2ram7HuOJukcEwHdlR3BTr+dNSNVCfWdzN645neFl5RvFAeTx/KlxDrdoE2o5P
 aQRug1n7VrQNoS+CA8hMOC4tVPQESQ+2Ei8yxWTxSUw32GKD4Jou3HIw87XrXts0sNzPJxr+n+1
 e/Eh+V8eZzDNYW6IFej3V8DndVpHRo7jZnXSoDb7FOTEUA+9ExeOgS/GcEifdTe9+f5eB6JOyT5
 /EYbytAdEhWb3keVVYZkseQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Fix the USBDP PHY ports description for the Gameforce Ace, so that it
follows the documented ABI. The current binding confuses endpoints with
ports and makes no sense at all.

While at it drop the rockchip,dp-lane-mux property, which makes no sense
for USB-C as the DP lanes are routed dynamically based on negotiation
via the USB-PD protocol.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 87 ++++++++++++++++++----
 1 file changed, 72 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 5ffc94b70813..4bfa442d762c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -504,6 +504,22 @@ dsi0_out_panel: endpoint {
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
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -685,22 +701,22 @@ ports {
 
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
@@ -1466,12 +1482,24 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		dwc3_0_role_switch: endpoint@0 {
+
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_role_sw>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
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
@@ -1483,23 +1511,45 @@ &usbdp_phy0 {
 	pinctrl-names = "default";
 	sbu1-dc-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_HIGH>;
-	rockchip,dp-lane-mux = <2 3>;
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
+
 };
 
 &vop {
@@ -1520,6 +1570,13 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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

