Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655737;
	b=DJgwzYrDrjce20l1Ja1Xk9Nfa1bfnjpDXiX/SJbdIag5eW4JTBor4uIwFt8HyWS/qhjr
	 kUcNefCL06cubQBZ+S9JJre9Ajn1eavoxR/0HRwxJhdCL1EqIrVcATQHc0aguowaeOtRR
	 epAA938zcCNIDkanH8G4bUz++joSBXPUvkyDgdP4q1rdxE3+8MIa0nt9mSvqOzTIJpvWH
	 GFbP70hbkJblk4eGgsCPK4aOf8jAuKODVPD05b3eFvjol1fZWn2qdLxMNeD0vFzyrQWuF
	 N20yJkm7ZvyeKpz41w/GBr4rLzmwjzfKOqbHuegwXN4VWb8BjVg6NPUBoxhFDiN5cTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655737;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AftxNf3tYTBwIKs+kkGfCDejnDzmlWG/RiMVlQShfiE=;
	b=RgrTyKsEvcPpDZ5v3kfOw+uf5QSF4mFEb9vA6uqqR31dGfliZ+67faej3+Pja5EWq88e
	 w9IOpsrneieeaO08oQw78rbdQ5ItpbeA7TzyLZV39MN3BteyJi/vSUXDGfVv++TAG5d+d
	 W66fBFecqDXpMx8Ih/2uy/F400ttFt5znCCtm2FVHO4n9Eg0UQeS81+a9WCy/lwabh0RG
	 SQei+whgILAY8hbGHONknhgVvw1r/hhD4klgjn44KjcsGcx9YvHhyYGTyasqV8zX/NK2g
	 E8fMvX8MHVhR9tORCCxzuJOVPPU9uY+EUVMIDNrxF2kX0rigA0uMve/n+tibKOyNo2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=PhmIRj+t;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEBD606A338;
	Thu, 26 Nov 2026 01:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEBD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=PhmIRj+t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=Gv+cLHwgunqeMtyO4yiB1Qcbps2qbpKw8xllMJNDfgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PhmIRj+tayfWkquZlQDMcqaM8ruhri6O2jP038nGMANl8gt8YdmHAnx/wODrdesc9
	 wiTBK8ub5tfoh0jEZ/ImfNM64N4GIe6+7q4AF9EEWG+n/8QNxDi3yz/RAYkCcuWLFS
	 Lbx6vqo015qwcnS/zCn0pYam0/8rdo5SU6+WSBOTGHgFrKig+NkZzsrg2iHgWC2w2M
	 jQ0Hd4i0cKnSdOh6xTnAf3cm/96+vSt/ZgWAcK79cPsBuXTUV9pHtHvZGpHH4Nl3+J
	 JQF5Oy8GD03WVVNv7n6NR5GjFprus5jasa27Ra5/qDekif0W3Ic3XLQWDBWrCl4Jhk
	 r8NRcQ6r2dk5Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15B8D17E1202;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C3CBE480035; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:32 +0100
Subject: [PATCH 04/11] arm64: dts: rockchip: Add USB-C DP AltMode for
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-4-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDWueIsDrMe+lHEbGUxJwYoSWVBn8y0Y1
 RRYjYyJzK3eiokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qaKNIP/jYaTmu+F2/3JDaIdBTK4jCrJKwmqy3jvt1tL8TJujWd7OOxv6q2EQ3opFtN/Wcu9z7
 QPW6ilQPhHmfG34SPMOflw+L84OJOHf+jqygkQDlY3mg8YKWj1/RCa43YVgURmQK24nRdA/Meaq
 Tv+m6u9XS78wlVXY/Bas1HSqlozUFDc8wVN+hza8LzscUsd7hUowLKIZCiIWb7Lt87M95ljXWT0
 tNT3jz8zHPgExUjSBKMZ89awPzaploVrl53RKcRBxsxf5np1w1aeSVa8+9Ddwq6tjckB6fWwalI
 dnrtyZAy/h7uS9B5D3gId8FnsFa0BCYctHshxCcpdcs8GlgGO6Wf0OiRVVgbSg91v8WgGhPG9tj
 8kcqQVbxuEf2osmctKfrsnzb3wjerDpxNHfdx+9uAhwojQKy0vpsImnM/qG+FviZ7T1zCsRfp1F
 DbJ8VlIzORT3suNrL+BOxdVOx0Gv0WXn6R+/odNmb1fqVTLoVFv17TRbBqFUK9IFSgZECH7KurU
 PPNq6ppeI7bJVZuclmaWShv6u3pm+c9U47wUy5OYipFYd8vfLhXXan/p3+201D9J2EKdybywoZ8
 9GTw12Zse2kOJcDgWHmnxPHolWqE+b/avGYCyF5vwIlmVZoLVqT40/rOWJZmVJq7HQ6zm1umiIO
 IwFxmHXxj2bxfGxVfY1QxPQ==
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

