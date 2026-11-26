Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655739;
	b=IRTbcX2NE2VxlTrfuEW2LyCKLnFXPOdPcixQ6V5c/CrKnc6pZ1n35BzlEXILoMvprTSY
	 3JbJ+NeQxBvWyswLHSz8N7OjaqUbuAQmP7XDBsAhhN1kvUdXs0GWkgS+Vic0t2at8eEfZ
	 A7MCLyw2J+zA5Btm+6TV/I7JvKSOVw9gf3OJXtkWpKmQ5nlCH+oaCDEZNAklFGbUri3CT
	 2WtrpQD/A7MP50158yZ7UPa5t21ysfKT2+afi8vrgIuY4jQisXGYN1WR2peYEjUtjrhvW
	 k7CFYEgxYo9XLoWjBgcTagTKwBiBZgxvwDK9rcRjAI9g83p3JnemC9UQJoXS6u8u3LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655739;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WkHN9A3Y86juNKLrEVQSy/VEql3aXHqCYmFvIrSVDmo=;
	b=VUTDE/+oViPMFWenhseWaFbIEfwQRDL2gXUMEMl2Wp+hk/t8Y8HSZIlWAxhxf2RGvI/F
	 ARGnXVAvT8ET982H9rzgmAqW2s1I66xtkkqYcf7prBh3/uqpWpm7f3nR2gr+XXC8zS4YT
	 d+fstBfO3qp0urUvczwdTklcOztWrmu0eiD6tbjXQF20zjADCBoX0HtogTU1uGSlQPVfo
	 d0gHnyoZeHoGZExnd5VjQ3qac8klF3Feyr92vWx3Y5cVk9kzz7MkDboZb9l0Z/aNTKoZx
	 +G7xRgxd1FWoQrI1eVUu9MaCJlSTRmD1ONcHRmAKOu+aqc1rVeOqcoHFTUOX+gwcQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NYg1LOrC;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815D606A691;
	Thu, 26 Nov 2026 01:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A815D606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NYg1LOrC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=TReSjAabIH0w5Lp+llK+KbrOfk2KHaTLEr6xiB4QYtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NYg1LOrCSTei0r9BiVMobgCs4/RupeRK9GY1Tt/Hj54AEJLw4bh9YwjoXOGCmG/JV
	 nCVRp8rFrrB1F7AIXfb3ADVD9+wmzbDiEQE9/GNYkaJqIbqruokCWrV0OBRgvmu4SJ
	 qguOaFPFUHJT3+jF0iekIj22FxpiyQR6pHEywM/+bFVA3ksXFbAkfOpeBE3DVZ4/dz
	 WL9UnSeYHBo+fQBevUYVIRunpRBtIY/E1hJTXNa5X4TUkNBxtEI+7iizuMFlafNjrP
	 r10CfEy9EIjqJRZ4od69NxKifKY6a5r0Opcso6w4QQnOcVyf0FipZi7fA3EN7f4ZAc
	 WZ1Cc1+D2+LgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B6DB17E12EB;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CAD2F480041; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:36 +0100
Subject: [PATCH 08/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RG-Vita-Pro
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-8-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3047;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TReSjAabIH0w5Lp+llK+KbrOfk2KHaTLEr6xiB4QYtw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDVHBf/7Z0cjKNlvICvyct4R2IeoVQJIe
 nBcZ/Vd4hxj7IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qar3sP/2dGaRUH/H/vMuhjMk7X2iJZT3+qyME4NWYuAzLVDrehc0+zLt4+G7mFPKWo5uMRxbN
 C5Ii1HDZABNGSqU7Z1ZRTq9lMc0lWdDTR9nnGC4ozM6pAdr8RcfXSAiyNXqe3xikIGgqMwSMMRI
 HuW9loHRmgLIi/Wf4/+vUKLNpMOZlmAvpTjYs2hUKFnJyVerrvuJXP8/V41bVQEwonsH77vF4U9
 WhSY1uTtBUVTg1bjlLJEITAa6W56HJczIp1gA/mu26MSkCi8rpMJKXctMKjsJXsgL6fvn/Byljd
 bAntLIsg2XX0gQ1OG5LiBPttBxbXIvxkWHlvwhuVqSE2A0W+OninjxHhmG6/T3kgiauixyH2WVo
 Yq7amQ1lALH0UrGxruqRBtzD45Ej6mRTok/m5ByCaAl23MOuOuQBkt8gDPmHPfWOv6fDjHR4EXq
 YlxNPXh4QAMM7zt2XKj1FGBfEfl3FzItSzmZF7zhewSvYTD8b9jncFDSRs5ErUeCyNKAu6/TL7d
 HO8knERt1UB7r/Em9WVHsOF0LMlGE1DA9Xf84Pgnb2h/o6qafPSsOHcNRC0y4mPDFV2M1aOoGtW
 o9dsjD0yFDbip9JoLdk3GpzS2Avd8oxsbDExfhdbVCb4bnwVuIFEoQCK5YUP84hQmeLJtYd4sSd
 ZeuXh7NcLrI5XGYEc/vorhQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Properly describe the USB-C setup incl. DP AltMode support, which also
fixes the USBDP PHY ports description for the RG-Vita-Pro, so that it
follows the documented ABI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   | 78 +++++++++++++++++++---
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 85576a437f7b..5da90f3792a1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -469,6 +469,22 @@ mipi_out_panel: endpoint {
 	};
 };
 
+&dp {
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
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -932,22 +948,25 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					usbc0_hs_ep: endpoint {
+					usbc0_hs: endpoint {
 						remote-endpoint = <&usb_drd0_hs_ep>;
 					};
 				};
+
 				port@1 {
 					reg = <1>;
-					usbc0_ss_ep: endpoint {
-						remote-endpoint = <&usb_drd0_ss_ep>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
 					};
 				};
+
 				port@2 {
 					reg = <2>;
-					usbc0_dp_ep: endpoint {
-						remote-endpoint = <&usbdp_phy_ep>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
+
 			};
 		};
 	};
@@ -1221,6 +1240,13 @@ vp1_out_dsi: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
 	};
 };
 
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
+
 &u2phy0 {
 	status = "okay";
 };
@@ -1258,9 +1284,40 @@ &usbdp_phy {
 	sbu2-dc-gpios = <&gpio4 RK_PB7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	port {
-		usbdp_phy_ep: endpoint {
-			remote-endpoint = <&usbc0_dp_ep>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy_ss_in: endpoint {
+				remote-endpoint = <&usb_drd0_ss_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy_dp_in: endpoint {
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
@@ -1277,15 +1334,16 @@ ports {
 		port@0 {
 			reg = <0>;
 			usb_drd0_hs_ep: endpoint {
-				remote-endpoint = <&usbc0_hs_ep>;
+				remote-endpoint = <&usbc0_hs>;
 			};
 		};
 
 		port@1 {
 			reg = <1>;
 			usb_drd0_ss_ep: endpoint {
-				remote-endpoint = <&usbc0_ss_ep>;
+				remote-endpoint = <&usbdp_phy_ss_in>;
 			};
 		};
 	};
+
 };

-- 
2.53.0

