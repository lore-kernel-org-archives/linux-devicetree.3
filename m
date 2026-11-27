Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776713;
	b=JhjKP+/7T0RoznsnI2K5bmK2NEjxFog1seavyGNfCuytsbNlI+DbMPlia/RT7oKv8kRl
	 z12mWvlezsjGE+M92pPJGeBO1E26/5ULmqRz/3mRtHXC2NiOcg1Pkc7uAhf4PD+dZyrY3
	 0Xdstxs6sf4K4s8HNE7h+Jc7+cZiRK7S7hUX8R4sLPIBu3f+m7GHnVbOnZgiHhjKJltnO
	 KXxdHn9fhNXeUhpThZvc6cuun9z6WCdVj2sfujxDdK1u31x/MrpuzCXE5FPB7heqUQejy
	 Uc+dXtwdBIl9+jNTThSKNiI1vkFxKbsJ8wuS4wkSR94zseTAIK3r3y6qdtz9eHabVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776713;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4TokXJF51r0m7b3JphOEG2nSxULNTcYs7ptSnoFwDpw=;
	b=5mKp6wKFNh4KppcI4kMSGdj5SOVtSGhUJbeentZndYp7zYwuteQdtjzx6ZapEYVHTSGL
	 /rdiSquasPJxOr3atHOnWgAw88ajb+P6V5pdmU5AwsXNfA4BX39vt//doBei6TAZtiIWv
	 HrkSysHESw4ikHyiLek8G0HsypyEtYtUB/MCrUiwIK1EcvI3Bq291uD1FePz4lHiq0nk9
	 gw39/Vu6+84JM0ZhqfjJqlLdiJGj+crO/jSXOy89bhSHg7JjYb/zdHwffRHuzrKeE0EEU
	 iM5E4Y8TiAVhYm1AKk4Hrv7x4BHZHZR4l55E3wDiSyz9KrR2lX/oSuzSDIT3RK7JNwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="TI5ne/Ku";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348B606A6B1;
	Fri, 27 Nov 2026 10:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D348B606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TI5ne/Ku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=WrRpl2FXyGdQCMEaQZpvoyTD6x0Lxdy/M9U/sdGkjgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TI5ne/Kui1QCvZ2ia0tFNccJ8bQnDLTPUIiNsX0vR29BgWoXnXp3CWon7TazGZxU1
	 FwN8Dby+jLcZjXBrqC5OJSHKHxQw4EJ+OYsFS8sOxJWeSOxD1nzEbgAAwHbBSxgBjk
	 kjCxLinuMw8FLpf2llVYr2zoBmoyq1dFsubw/ZTz3gARz5zj0vqWae90+hzxrKxqWr
	 CzbDatMlQ/ZHHIb5WUQ5RpYJa9W3qYppU22SrpdKQz3C7aun8e8mBCTI2RonCv+PjJ
	 vYKULqLj6Ox3OprZmD+fjAWRMsB30cnBoEmf1Ri0eclohDO4ewyIOe4lJyZhTKzLWT
	 uDSWoLFFvYkDA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADA4A17E0BCD;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1670B480048; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:47 +0100
Subject: [PATCH v2 10/11] arm64: dts: rockchip: Add USB-C DP AltMode for
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
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-10-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMNPjDtM2Dvwnpjqlal3tZL2260zX/2t+
 tlfKaivgrQWWYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qaVpUP/R/oUoT40NuCtC5Xk4hh8qfRZG1v5XDbsCzAo0exx6BwpFa8bsbRNkNbBOi6h1V7hos
 DDMZqX/5nukCsenKJcCnp6kDjqjeh0nvTT9FmZo25xkPdSWfqyTDC/3UpQ0sZqdf9Nw2QAbAj/L
 5viWiuHC1aQcGfDO+v45bWZjJJBbJexbTm1raXA4InS365RhusVTzf6y7OASkjbZRp27Cd/evlJ
 QX7/eHmpyB3j4NHOfr5GCJMAgwtjiPdERQNaI97WcthtdsvFCj+H6gYsjk9QOMTpMcIdAzeEzO8
 SUVsy8LSPdSRx8m4oCoUpsaK7d+6xhLWR9viMPoC2dCDvwyWNfvdaB3EbfYrbIuLf69ioH9XbQk
 oeEr3Z7nf8yIe/aLLfy8oIHLWupx60dhxjni8fi+8cPUDmkpay+8KHEx10J8C7Ijz1NxY/WjeFc
 DKAylOKnT1pFySb9MOx2iKJlNd0sln7UfgJWyypl2JUZz5fXbTgYk/IFNFtAqrysG4dKpYRAe4x
 dWei6f0oGadqhhDzpcgzG83aZo26AnpBxaCCNAMS7S63KM6waxaPUz1lIV3MIpIlbrCzWyPXSfj
 q8MkrDnmKp/vu57tzYtDQAM7ZmRIDbZCb+1rmzgvP3F2tqD8raAdnf4r4I4qLzQEgqDjy0SSBBq
 h3gmXdxJl/e3zu/vXnJg4Ug==
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

