Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655740;
	b=vTpC+0VdFhlBgZT6TH9cRo5AL3BGyTGpG5/WC5EhewPbeulP0km1RRAOjmt/M/2xntK6
	 bX1VdbLGqUS1MwHiA13EXqKySyO3JR3UHYRMakOPzl5FAgoDJlyHQWxZO6U4p1iP+dR8o
	 WuzLmkdO0MNPcZt3OeUaIf15vtsInuPQnknzsqdBC0XIGJg0MIAvJklTHLUTy+mN0ZO/o
	 VK2hdqtrL5jabDO+BQzLML2frM9luaD4rtuwI3zYnY3h2g4WmyltF5c2CEmXzMfnIEf/A
	 QZqkLKKcp5HriPrYhZTcJQCdQzaT9dNpRseqwkT+yTJmljLRxwf7thOzyveSGw6MAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655740;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1XWCIdQlz/CkR6OErkkk9PAAFK9Tc6Zr9ToGv1LJSQg=;
	b=T9K495FXFFaMZ8Gr7H71AMjnhJJnONzJvzWwuEdS3eOGDp15ougR5iwS9jT0XW6p65Sv
	 kHoubCGM5ghLJ4xC68jInPfpcEId2bshKq8tTWOZ+OBuFSb3Sy5UgID8w8rMW5zr+it50
	 Zbva2d9PbDcox0PEBVEb9HwdAckAdjOY0dr/j3pyxFZLeNC6Feo7bY+G26XsZlX2Vvv0M
	 zs/l1Bk09g4sr0hin+9wX2/qGtIYNiOyeQKb+trpVVIZ8avXS7RDu2MvO2ZhHDkn0qZ4s
	 B8/QyMoOrhTQzp0ND5WHvskyXC3y6/5tdY652FPhyRT2ZZtOmVP+YALyaELKVLztNtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=llhNzH8F;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1DA606A6BB;
	Thu, 26 Nov 2026 01:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1DA606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=llhNzH8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=H9BrvMVbgp/3Eq1cw86cz9iNcUtt6pcF2cofKkzeROs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=llhNzH8FHfOuL2bdJHMSlVK13vWXAnyiOhkRqjSbIB3s6RzspOKVbJEvrNjOhsytm
	 +mJdKfe7AR0WWBJwwK104B07dQ9cQJvVG5ze1xAC6srZ2J2gWUapn9DIfXvbhPAxiH
	 s6fSKCyuIjrnbz/feepRv7bE9WzJ4Bf8OTPhDPtIh7Ase9TdGULUxG20dVfPiDJ1Cx
	 UfGhR/Dz0RBoqyhBeVlxQLkoJNh+BfcSARZUPgxOb+a3dGX2heA19KdEwllrutV1HK
	 Lq12ShRXhqsOa6aUWqj3mYbvk9nQpuQfv/i6+2j1ahAPNyfXf1wTXNNJ0Cm+b6fG06
	 2yEIlcdOtBZyQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71A6817E130C;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CCA17480047; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:37 +0100
Subject: [PATCH 09/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 CM5-IO
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-9-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3312;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=H9BrvMVbgp/3Eq1cw86cz9iNcUtt6pcF2cofKkzeROs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDXxnJ9F6GqNVh8RyFGegYRow72UfG/GE
 y7k2EMdTYK824kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qa1GEP/0PZKrsxLZ+t7/8izNsFQaNFlEt5EwkuQIJyeLMVCMW+aJv0zZQAaqAJidwrXUCeOLs
 vkDbrpZZThB6lXGSTGG9eXzbpB//YjLCCrPQDc2Ludaj5j/9wAXBQllPOiGg3VLCPgRD4gjTEo+
 87U6Vra9/Ac6f5Yn3jXNiyJI9V2Gv8eeN148p2L7Ea74KGpFQZstrYQP3ENfmolw3GbzBffHrvk
 ZZY53jom1T7zKGuLENkGGsKJlvCN13ZGRdWqvhGQbCEyD27VP8LPTCTmqwqyTYuOoltpBDRH5UO
 hWBZ55BkPqn6R04WT/0d/ZPKMuesohnowriJxA7kb5FN3QdXYtcYo/HrDRz/tHCYhAjJGVWlfTG
 RoCj/HtRY9sgH7UqB5u5gfqgQ0A3z66GXC+rSD0ihnC0NRw+lNz4u9AFZPnFSMYeINf88zaNcuW
 4lZmi6Bth9mD41KdbWP+Wxq5MOIokqC8AAREXQrpkIPgvCUrClGx+1M/ECFlOXqSy+ax4gTQsyy
 z8zKDHQdxA8d2sP8KaiZtt48fh0qFvbm4HmZoJhKu7sx6zSl+dv9fzJZxVjzL1/AD0rx5AiArr7
 SY4zqtkCfFlJi7iRxMJJqSmVx0k2IdkeH/pkf8PMKeGL16ZqScBb74WcX76Sa9ZCn5sk6MIMSB5
 k8+b5dFk/7P+pSzmQafUtZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Properly describe the USB-C setup incl. DP AltMode support, which also
fixes the USBDP PHY ports description for the CM5-IO, so that it
follows the documented ABI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     | 86 ++++++++++++++++++----
 1 file changed, 72 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index f6ab189a0578..5170eb4d2589 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -150,6 +150,22 @@ &combphy1_psu {
 	status = "okay";
 };
 
+&dp {
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
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &hdmi {
 	status = "okay";
 };
@@ -215,22 +231,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					usbc0_orien_sw: endpoint {
-						remote-endpoint = <&usbdp_phy_orientation_switch>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_drd0_hs_ep>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					usbc0_role_sw: endpoint {
-						remote-endpoint = <&usb_drd0_role_switch>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
-					dp_altmode_mux: endpoint {
-						remote-endpoint = <&usbdp_phy_dp_altmode_mux>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -330,9 +346,22 @@ &usb_drd0_dwc3 {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_drd0_role_switch: endpoint {
-			remote-endpoint = <&usbc0_role_sw>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_drd0_hs_ep: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_drd0_ss_ep: endpoint {
+				remote-endpoint = <&usbdp_phy_ss_in>;
+			};
 		};
 	};
 };
@@ -350,18 +379,40 @@ &usbdp_phy {
 	sbu1-dc-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy_orientation_switch: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_orien_sw>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy_dp_altmode_mux: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&dp_altmode_mux>;
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
@@ -380,3 +431,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};

-- 
2.53.0

