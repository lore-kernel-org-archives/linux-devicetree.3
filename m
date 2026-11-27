Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776713;
	b=5OC4BOoOyL4Lwqqcdw4S9tPCTj7OaehS0tFaYsYZegDSQTuh+6qVY/I3zDV+4L2oYpyB
	 5xb/eR+GoVgS42Htoje7/PnzL4WGp7d01F31+DTWmyNSzGQj38KDkNbHgIo3VEkNsijbP
	 JaNfct9CrI9N90Fxrb9vWD6Q8hlsqq15UayCGLNCNz5aeeT6sHpwsfcrktDqyUe50GaD7
	 rHa9UL0gAv3bBdndj7my+GtuVLfKw1AkQkyrlbVaXF9o6sqxU946zCtRmpneQ8SL/vKWj
	 6d6n/Vpl0CjwwmSfaJUBWQi+D9qURm2lpX3R9Vr7H8NORohnwvRXkwdKumLM8z3kAYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776713;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=QzmxQs4zicvWfzS1qJCDMl9nOspC9JptaKcmIv2t/Ww=;
	b=fIo0DigFbQwRfOD1vBOdiQ1TJ41bVqzRpg5QHc+xiPWOEPUW6GkLdcoexV62qzsubCil
	 QaHGTxaytR39boKdT2I6GI2Ffhp43kQfVP5M1R3EaL58mr7vsCBZS4u8ffaVLc8KxODL+
	 BAO4wkBG9vtcWkeZrfjXv9+CCEr1G8syNPxItcdwksBW6sXe4Yw2MhvF0FGL00vzjR3ep
	 nhWRrGERQP1tCN68FKVTIqPRpdxlvWJjIXYEikhuynwk/cvp9sRFm6LRhNv2cKHNB76hH
	 NylDt1DOgiaICLCFH0UopWMakiQt0mb7q0J7T2zA9hBigCi8383Pp3m3g24ITEFCLaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bG4yQriN;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8D606A6A2;
	Fri, 27 Nov 2026 10:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B8D606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bG4yQriN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=tQK37NTbi9NxpR6L0RzRWeTmpieiVQIIDCqFH3tLBAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bG4yQriN3K+6d37rU5pxcb3WpEPatbIKXk2kIpsPpu4zKD9tiJzR27MA544rIQ91X
	 KRsEN5paqb5deTnQkJceuVIhA4ksY9zaA4RkROSSoROJFnEJmUIKqezlcxiuLNK2ZC
	 5c4SJFcBonY5kLHYykAcUPpmhQazQyvo3qx526c/dAKqWweX6+Uh67qsQn6LB5pdR7
	 7lLEXDioCU/+CMfWAqoBdflgbqqQTUJGdRTInX8gbj0KipB6+j6dUxIKLKhJBjtcJR
	 say/P91l7YC/aLba1DIAkb6PHq06H3SIsT8+uSjhUTGnz+0+YFtOhAmwIucinvSvGH
	 OL/Yfq/ssVnuA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97F1817E0800;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0D8A0480038; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:42 +0100
Subject: [PATCH v2 05/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 ROCK 5B family
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
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-5-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tQK37NTbi9NxpR6L0RzRWeTmpieiVQIIDCqFH3tLBAw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMMGBjXRJczCYNOzHSNOu4cSYyyjW0M3h
 2dvyR9dVYEpgYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qaMdUP/24AVIawMfWh2kWfeqKDko6fJV4DGH7/E4LYxWi2WoFQn/1GibAkf20l8VIJVAcW4eZ
 DlR5rFhhxoC/qcYlwL2gxqf5tV5l8JSCfJ0sKrDgFS7mlVzpNoOYj6cDs1AewGy6MMJlaOgCZb4
 zyAHKZY9cPkYXbRVgCIGdgV+ufNDbbbYkM564+4psedo2ke79REk/SyckCkocbwgb6tviqJ2esT
 nUswbAUhdCmCabGTMOhOOksKGjyW5W3Zmxfl+Gf6+sdJ7IyMcRJrzo6qnLyTGGkfMVxlDv/Ii0m
 06I8spFMScEE0C5r+drYmgF3p0WmqOeKjQpXVvMgtH9FjnJ8vE3CvnbVHTHrCMCWlz3FA/go3u1
 fonAIL9TOipIL48Z3COFZ6ppi8fT9KuJQ3nuwClzRCtYPTUR6La5BM/UEIelyjCE2ANXEVS/DJQ
 DKpruMIvQAzr0SRAnSUTxuQpiyjAIo5XkEHtfPoGOQdL1qR0cDkjHsnoPf0XozlxIcuiVs46Gmo
 JpTyD7alwooPJ8WMCk9BFypvRx7H1z7n7m3VrpSKv+5f6PvpO4FOf5sJEw5DuNavAcaw+X07lfQ
 j6FBm5LFAek3tnNDgPyr0/glL4mlSeoC6ef2nTzCHhQ9oRPZsx7GPHk4asyp4repO+9Ev/SPvNg
 XZCdicmGIjlaG0lKhpc0kUA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Enable support for USB-C DP AltMode to the ROCK 5B/5B+/5T.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 82 +++++++++++++++++++---
 1 file changed, 71 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 0cf6da8d8f1c..aa0de092626c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -178,6 +178,22 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
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
@@ -359,21 +375,21 @@ ports {
 				port@0 {
 					reg = <0>;
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_to_usbc0>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -1033,18 +1049,40 @@ &usbdp_phy0 {
 	orientation-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_sbu: endpoint@1 {
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
@@ -1065,9 +1103,24 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host0_xhci_to_usbc0: endpoint {
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
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
 		};
 	};
 };
@@ -1106,3 +1159,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
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

